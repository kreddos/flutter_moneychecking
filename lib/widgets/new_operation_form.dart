import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneycheker/widgets/new_operation_form_input.dart';
import 'package:moneycheker/widgets/widgets.dart';

class _FormData {
  String operationName;
  double value;
}

class NewOperationForm extends StatefulWidget {
  NewOperationForm({ Key key, @required this.onSubmit }): super(key: key);
  final void Function(_FormData) onSubmit;

  @override
  _NewOperationFormState createState() => _NewOperationFormState();
}

class _NewOperationFormState extends State<NewOperationForm> {

  final _formKey = GlobalKey<FormState>();
  _FormData _model = new _FormData();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          color: Colors.black12,
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text('Новая операция',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            SizedBox(height: 20.0),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  NewOperationFormInput(
                      labelText: 'Наименование операции',
                      validator: (String value) {
                        if (value == '') {
                          return 'Значение не моежет быть нулевым';
                        }

                        return null;
                      },
                      onSaved: (String value) {
                        _model.operationName = value;
                      }),
                  SizedBox(height: 15.0),
                  NewOperationFormInput(
                    labelText: 'Введите сумму',
                    keyBoardType: TextInputType.number,
                    validator: (String value) {
                      try {
                        final parsedValue = double.parse(value);
                        if (parsedValue == 0) {
                          return 'Значение не моежет быть нулевым';
                        }
                        return null;
                      } catch(e) {
                        return 'Невалидное число';
                      }
                    },
                    onSaved: (String value) {
                      _model.value = double.parse(value);
                    },
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter(new RegExp(r'^([\-]{1})?([0-9]+)?([\.]{1})?([0-9]{1,2})?')),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.orange,
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        return null;
                      }

                      _formKey.currentState.save();
                      widget.onSubmit(_model);
                      _formKey.currentState.reset();
                    },
                    padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text('Добавить операцию', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                )
              ],
            )
          ],
        ),
      );
  }
}
