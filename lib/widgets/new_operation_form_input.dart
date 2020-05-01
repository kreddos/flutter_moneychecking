import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewOperationFormInput extends StatelessWidget {
  NewOperationFormInput(
      {Key key,
      this.labelText,
      this.onSaved,
      this.validator,
      this.keyBoardType,
      this.inputFormatters})
      : super(key: key);
  final Function validator;
  final Function onSaved;
  final String labelText;
  final TextInputType keyBoardType;
  final List<TextInputFormatter> inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        keyboardType: keyBoardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelStyle: TextStyle(color: Colors.black87),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.black87)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: labelText,
        ),
      ),
    );
  }
}
