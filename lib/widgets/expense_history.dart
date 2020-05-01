import 'package:flutter/material.dart';
import 'package:moneycheker/widgets/expense_income_item.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

class ExpenseIncomeItemModel {
  ExpenseIncomeItemModel(this.operationName, this.value);

  final String id = uuid.v4().toString();
  final String operationName;
  final double value;

  factory ExpenseIncomeItemModel.from(String operationName, double value) {
    return new ExpenseIncomeItemModel(operationName, value);
  }
}

class ExpenseHistory extends StatelessWidget {
  ExpenseHistory({Key key, this.data}) : super(key: key);
  final List<ExpenseIncomeItemModel> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('История расходов',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
          SizedBox(height: 10.0),
          Column(
            children: data.map<Widget>((item) {
              return ExpenseIncomeItem(
                  label: item.operationName, value: item.value);
            }).toList(),
          )
        ],
      ),
    );
  }
}
