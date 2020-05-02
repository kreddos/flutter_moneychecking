import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moneycheker/widgets/widgets.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State {

  List<ExpenseIncomeItemModel> values = [
    ExpenseIncomeItemModel.from('Купил книгу', -300.0),
    ExpenseIncomeItemModel.from('Продал книгу', 100.0),
    ExpenseIncomeItemModel.from('Купил книгу', -1300.0),
    ExpenseIncomeItemModel.from('Купил дошик', -300.0),
  ];

  double _sum(double sum, ExpenseIncomeItemModel item) => sum + item.value;

  Map<String, double> get valuesSums {
    Map<String, double> result = new Map();

    result['balance'] = values.fold(0, _sum);
    result['income'] = values.where((item) => item.value > 0).fold(0, _sum);
    result['expenses'] = values.where((item) => item.value < 0).fold(0, _sum);

    return result;
  }

  Future<ExpenseIncomeItemModel> showNewOperationDialog({BuildContext context}) {
    return showDialog<ExpenseIncomeItemModel>(context: context, builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 300,
          child: NewOperationForm(
            onSubmit: (value) {
              Navigator.pop(context, ExpenseIncomeItemModel.from(value.operationName, value.value));
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ExpenseIncomeItemModel value = await showNewOperationDialog(context: context);
          setState(() {
            if (value != null) {
              values.add(value);
            }
          });
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30.0),
                      MainBudgetInfo(balance: valuesSums['balance'],
                          income: valuesSums['income'],
                          expenses: valuesSums['expenses']),
                      SizedBox(height: 30.0),
                      ExpenseHistory(data: values),
                      SizedBox(height: 50.0),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
