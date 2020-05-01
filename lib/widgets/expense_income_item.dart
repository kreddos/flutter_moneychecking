import 'package:flutter/material.dart';
import 'package:moneycheker/utils/money_utils.dart';

class ExpenseIncomeItem extends StatelessWidget {
  ExpenseIncomeItem({Key key, this.label, this.value}) : super(key: key);
  final String label;
  final double value;

  Color get itemColor => value < 0 ? Colors.red : Colors.green;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: <Widget>[
          Container(
              height: 40.0,
              width: 10.0,
              decoration: BoxDecoration(
                  color: itemColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                  ))),
          Expanded(
              flex: 8,
              child: Container(
                height: 40.0,
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey),
                        bottom: BorderSide(color: Colors.grey))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(label),
                    Text(toMoney(value)),
                  ],
                ),
              )),
          Container(
              height: 40.0,
              width: 10.0,
              decoration: BoxDecoration(
                  color: itemColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ))),
        ],
      ),
    );
  }
}
