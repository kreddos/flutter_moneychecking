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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      MainBudgetInfo(balance: 200.0, income: 100.0, expenses: 200.0),
                      SizedBox(height: 30.0),
                      ExpenseHistory(data: values),
                      SizedBox(height: 20.0),
                      NewOperationForm(
                        onSubmit: (value) {
                          setState(() {
                            values.add(ExpenseIncomeItemModel.from(value.operationName, value.value));
                          });
                        },
                      ),
                      SizedBox(height: 20.0),
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
