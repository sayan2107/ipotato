import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    Key? key,
    this.maxLine = 1,
    this.label = "",
    this.hintText = "",
    required this.onChangeCallBack,
  }) : super(key: key);

  final int maxLine;
  final String label;
  final String hintText;
  final Function(String) onChangeCallBack;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: onChangeCallBack,
      maxLines: maxLine,
      autofocus: false,
      textInputAction: TextInputAction.done,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 5.0),
        ),
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
      ),
    );
  }
}
