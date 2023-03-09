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
  final Function()? onCancelTap;
  final double? cursorHeight;
  final EdgeInsets? contentPadding;
  final void Function(String)? onChanged;
  final String? errorText;
  final Widget? prefixIcon;
  final Color? fillColor;
  final bool readOnly;

  final FocusNode? focusNode;

  ///For default, for textField, textStyle(18 pxs height) the height of the textField is approximately 40 pxs,
  ///and may change dependending on the size and height of the font. To control the height provide [contentPadding].
  ///If you want to change style completely,
  ///provide [inputDecoration] parameter. If there's no parameter you want to override, add it.
  const CustomTextField(
      {Key? key,
      this.inputDecoration,
      this.style,
      this.cursorColor,
      this.obscureText,
      this.hint,
      this.hintStyle,
      this.textEditingController,
      this.validator,
      this.ontap,
      this.onCancelTap,
      this.cursorHeight,
      this.contentPadding,
      this.onChanged,
      this.errorText,
      this.prefixIcon,
      this.fillColor,
      this.readOnly = false,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        readOnly: readOnly,
        focusNode: focusNode,
        controller: textEditingController,
        decoration: inputDecoration ??
            InputDecoration(
              filled: true,
              fillColor: fillColor ?? AppColors.whiteColor,
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(
                        top: 14,
                        bottom: 14,
                        left: 15,
                        right: 10,
                      ),
                      child: prefixIcon,
                    )
                  : null,
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12,
                ),
                child: IconButton(
                  onPressed: onCancelTap,
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: AppColors.lightGrey,
                  ),
                ),
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
                  TextStyles.textStyle.copyWith(color: AppColors.greyTextColor),
              hintText: hint ?? '',
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
