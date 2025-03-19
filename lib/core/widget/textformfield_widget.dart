import 'package:poon_estock_application/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/config.dart';
import '../utility/formatters.dart';

class BuildTextFormField extends StatelessWidget {
  final GlobalKey? keyTextFormField;
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final bool obscureText;
  final String? prefixText;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final TextInputType? keyboardType;
  final int minLines;
  final int? maxLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final Function()? onTap;
  final bool showValidator;
  final FormFieldValidator<String>? validator;
  final bool disable;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autoValidateMode;
  final TextAlign textAlign;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final Color? bgColor;
  final Function(String value)? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final bool isCollapsed;
  final Color? cursorColor;
  final void Function(bool value)? onFocusChange;
  final bool necessary;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final InputBorder? inputBorder;
  final String? textKey;
  final bool autofocus;
  const BuildTextFormField({
    super.key,
    this.keyTextFormField,
    this.controller,
    this.initialValue,
    this.obscureText = false,
    this.focusNode,
    this.prefixText,
    this.suffixIcon,
    this.suffixText,
    this.suffixStyle,
    this.labelText,
    this.hintText,
    this.helperText,
    this.prefixIcon,
    this.keyboardType,
    this.minLines = 1,
    this.maxLines,
    this.maxLength,
    this.onSaved,
    this.onTap,
    this.validator,
    this.showValidator = true,
    this.disable = false,
    this.readOnly = false,
    this.onChanged,
    this.inputFormatters,
    this.autoValidateMode,
    this.textAlign = TextAlign.start,
    this.hintStyle,
    this.errorStyle,
    this.bgColor,
    this.onFieldSubmitted,
    this.contentPadding,
    this.isCollapsed = false,
    this.cursorColor,
    this.onFocusChange,
    this.style,
    this.necessary = false,
    this.padding,
    this.constraints,
    this.inputBorder,
    this.textKey,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: keyTextFormField,
      padding: padding ?? context.onlyBottomPaddingLow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (textKey != null)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  if (validator != null && showValidator)
                    Text(
                      '* ',
                      style: AppTextStyle(
                        context,
                      ).kBodyDefault.copyWith(color: AppColors.instance.red),
                    ),
                  Text(
                    textKey!,
                    style: AppTextStyle(
                      context,
                    ).kBodyDefault.copyWith(color: AppColors.instance.grey),
                  ),
                ],
              ),
            ),
          Focus(
            onFocusChange: onFocusChange,
            child: TextFormField(
              autofocus: autofocus,
              textAlignVertical: TextAlignVertical.center,
              controller: controller,
              initialValue: initialValue,
              focusNode: focusNode,
              obscureText: obscureText,
              cursorColor: cursorColor,
              decoration: InputDecoration(
                suffixText: suffixText,
                suffixStyle:
                    suffixStyle ??
                    AppTextStyle(
                      context,
                    ).kBodyDefault.copyWith(color: AppColors.instance.grey),
                alignLabelWithHint: true,
                constraints: constraints,
                isCollapsed: isCollapsed,
                fillColor: bgColor ?? Colors.transparent,
                filled: true,
                contentPadding: contentPadding ?? const EdgeInsets.all(12),
                prefixText: prefixText,
                prefixStyle: AppTextStyle(
                  context,
                ).kBodyDefault.copyWith(color: AppColors.instance.grey),
                labelStyle: AppTextStyle(
                  context,
                ).kBodyDefault.copyWith(color: AppColors.instance.grey),
                helperMaxLines: 2,
                errorMaxLines: 2,
                hintMaxLines: 2,
                hintText: hintText,
                hintStyle:
                    hintStyle ??
                    AppTextStyle(context).kBodyDefault.copyWith(
                      color:
                          disable
                              ? AppColors.instance.disable
                              : AppColors.instance.grey,
                    ),
                prefixIcon: prefixIcon,
                label:
                    labelText != null
                        ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (validator != null && showValidator)
                              Text(
                                '* ',
                                style: AppTextStyle(context).kBodyDefault
                                    .copyWith(color: AppColors.instance.red),
                              ),
                            Text(
                              emptyToDash(labelText),
                              style: AppTextStyle(context).kBodyDefault
                                  .copyWith(color: AppColors.instance.grey),
                            ),
                          ],
                        )
                        : null,
                counterStyle: AppTextStyle(context).kBodyDefault,
                prefixIconColor:
                    !disable
                        ? AppColors.instance.grey
                        : AppColors.instance.disable,
                suffixIcon: suffixIcon,
                suffixIconColor:
                    !disable
                        ? AppColors.instance.grey
                        : AppColors.instance.disable,
                enabledBorder: inputBorder ?? InputBorder.none,
                focusedBorder: inputBorder ?? InputBorder.none,
                border: inputBorder ?? InputBorder.none,
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.instance.red),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.instance.red),
                  borderRadius: BorderRadius.circular(8),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.instance.disable),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorStyle:
                    errorStyle ??
                    AppTextStyle(
                      context,
                    ).kBodyDefault.copyWith(color: AppColors.instance.red),
              ),
              style: style ?? AppTextStyle(context).kBodyDefault,
              keyboardType: keyboardType ?? TextInputType.text,
              maxLength: maxLength,
              minLines: minLines,
              maxLines: maxLines,
              onChanged: onChanged,
              onSaved: onSaved,
              onTap: onTap,
              validator: validator,
              enabled: !disable,
              readOnly: readOnly,
              inputFormatters: inputFormatters,
              autovalidateMode: autoValidateMode,
              textAlign: textAlign,
              onFieldSubmitted: onFieldSubmitted,
              canRequestFocus: !readOnly,
            ),
          ),
        ],
      ),
    );
  }
}
