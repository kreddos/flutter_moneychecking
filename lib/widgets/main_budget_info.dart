import 'package:flutter/material.dart';
import 'package:moneycheker/utils/utils.dart';

class MainBudgetInfo extends StatelessWidget {
  MainBudgetInfo(
      {Key key, this.expenses, this.income, this.balance})
      : super(key: key);
  final double income;
  final double expenses;
  final double balance;

  final double middleFontSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                buildBudget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    buildExpensesIncome(
                        color: Colors.green, value: income, label: "Доходы"),
                    Container(
                        child: SizedBox(width: 1, height: 70.0),
                        color: Colors.grey),
                    buildExpensesIncome(
                        color: Colors.red, value: expenses, label: "Расходы")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildBudget() {
    return Container(
      padding: const EdgeInsets.only(bottom: 5.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Баланс',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
          Text(toMoney(balance),
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: middleFontSize))
        ],
      ),
    );
  }

  Expanded buildExpensesIncome({Color color, double value, String label}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(label.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(toMoney(value),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: middleFontSize,
                  color: color))
        ],
      ),
    );
  }
}
