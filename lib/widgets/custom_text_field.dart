import 'package:flutter/material.dart';

import '../theme/themes.dart';

class CustomTextField extends StatelessWidget {
  final InputDecoration? inputDecoration;
  final TextStyle? style;
  final Color? cursorColor;
  final bool? obscureText;
  final String? hint;
  final TextStyle? hintStyle;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final void Function()? ontap;
  final double? cursorHeight;
  final EdgeInsets? contentPadding;
  final void Function(String)? onChanged;
  final String? errorText;

  ///For default, for textField, textStyle(18 pxs height) the height of the textField is approximately 40 pxs,
  ///and may change dependending on the size and height of the font. To control the height provide [contentPadding].
  ///If you want to change style completely,
  ///provide [inputDecoration] parameter. If there's no parameter you want to override, add it.
  const CustomTextField({
    Key? key,
    this.inputDecoration,
    this.style,
    this.cursorColor,
    this.obscureText,
    this.hint,
    this.hintStyle,
    this.textEditingController,
    this.validator,
    this.ontap,
    this.cursorHeight,
    this.contentPadding,
    this.onChanged,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: textEditingController,
        decoration: inputDecoration ??
            InputDecoration(
              filled: true,
              fillColor: AppColors.whiteColor,
              prefixIcon: const Padding(
                padding: EdgeInsets.only(
                  top: 14,
                  bottom: 14,
                  left: 15,
                  right: 10,
                ),
                child: Icon(Icons.help_outline),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.lightGrey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.lightGrey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.lightGrey, width: 1.0),
                borderRadius: BorderRadius.circular(16),
              ),
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 11,
                  ),
              hintStyle: hintStyle ??
                  TextStyles.hintTextStyle
                      .copyWith(color: AppColors.greyTextColor),
              hintText: hint ?? '',
              // errorText: errorText,
            ),
        style: style ??
            TextStyles.textStyle.copyWith(color: AppColors.greyTextColor),
        cursorColor: cursorColor ?? AppColors.greyTextColor,
        cursorHeight: cursorHeight,
        obscureText: obscureText ?? false,
        validator: validator ?? (text) => null,
        onTap: ontap,
        onChanged: onChanged,
      ),
    );
  }
}
