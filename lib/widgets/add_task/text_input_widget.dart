import 'package:flutter/material.dart';
import 'package:ipotato_timer/theme/app_text_theme.dart';
import 'package:ipotato_timer/theme/colors.dart';

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
      style: AppTextTheme.of(context).h4.copyWith(color: AppColors.gray),
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGray, width: 2)),
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        labelText: label,
        labelStyle: AppTextTheme.of(context).h4.copyWith(color: AppColors.gray),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkBlue, width: 2),
        ),
      ),
    );
  }
}
