import 'dart:async';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poon_estock_application/config/config.dart';
import 'package:poon_estock_application/core/extension/extension.dart';
import 'package:poon_estock_application/core/utility/formatters.dart';
import 'app_button.dart';

class BuildDropdownSearch<Object> extends StatelessWidget {
  final GlobalKey<DropdownSearchState<Object>>? keyDropdown;
  final bool disable;
  final String Function(Object item)? itemAsString;
  final FutureOr<List<Object>> Function(String filter, LoadProps? loadProps)?
  items;
  final Widget Function(BuildContext context, Object? selectedItem)?
  dropdownBuilder;
  final Widget Function(
    BuildContext context,
    Object item,
    bool isDisabled,
    bool isSelected,
  )?
  itemBuilder;
  final bool Function(Object item)? disabledItemFn;
  final Object? selectedItem;
  final AutovalidateMode? autoValidateMode;
  final String? Function(Object? value)? validator;
  final void Function(Object? value)? onChanged;
  final void Function(Object? value)? onSaved;
  final ListViewProps? listViewProps;
  final String? hintText;
  final String? labelTextField;
  final Widget? prefixIconTextFieldSearch;
  final bool showSearchBox;
  final Color? fillColor;
  final Color? fillColorTF;
  final TextAlign? textAlign;
  final String? labelText;
  final Color? iconColor;
  final Function()? onTapCancelButton;
  final Color? menuPropsColor;
  final Color? backgroundColor;
  final bool interceptCallBacks;
  final BorderSide? borderSide;
  final EdgeInsets paddingTF;
  final PopupProps<Object>? popupProps;
  final BorderRadius? borderRadius;
  final BoxConstraints? constraints;
  final Widget? prefixIcon;
  final Future<bool?> Function(Object? selectedItem)? onBeforePopupOpening;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? searchController;
  final ScrollController? scrollController;
  final Widget Function(BuildContext context, Widget popupWidget)?
  containerBuilder;
  final Future<bool?> Function(Object? prevItem, Object? nextItem)?
  onBeforeChange;
  final bool Function(Object item1, Object item2)? compareFn;
  final InputBorder? inputBorder;
  final String? textKey;
  final bool showValidator;
  final EdgeInsetsGeometry? contentPadding;
  final bool isClearButton;

  const BuildDropdownSearch({
    super.key,
    this.disable = false,
    this.itemAsString,
    this.dropdownBuilder,
    this.itemBuilder,
    this.disabledItemFn,
    this.keyDropdown,
    this.items,
    this.selectedItem,
    this.autoValidateMode,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.listViewProps,
    this.hintText,
    this.labelTextField,
    this.prefixIconTextFieldSearch,
    this.showSearchBox = false,
    this.fillColor,
    this.fillColorTF,
    this.textAlign,
    this.labelText,
    this.iconColor,
    this.onTapCancelButton,
    this.menuPropsColor,
    this.backgroundColor,
    this.interceptCallBacks = false,
    this.borderSide,
    this.paddingTF = const EdgeInsets.all(8.0),
    this.popupProps,
    this.borderRadius,
    this.constraints,
    this.prefixIcon,
    this.onBeforePopupOpening,
    this.padding,
    this.searchController,
    this.scrollController,
    this.containerBuilder,
    this.onBeforeChange,
    this.compareFn,
    this.inputBorder,
    this.textKey,
    this.showValidator = true,
    this.contentPadding,
    this.isClearButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? context.onlyBottomPaddingLow,
      child: Column(
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
        ],
      ),
    );
  }
}

class BuildDropdownSearchMultiSelection<Object> extends StatelessWidget {
  final GlobalKey<DropdownSearchState<Object>>? keyDropdown;
  final bool disable;
  final String Function(Object item)? itemAsString;
  final FutureOr<List<Object>> Function(String filter, LoadProps? loadProps)?
  items;
  final Widget Function(BuildContext context, List<Object>? selectedItem)?
  dropdownBuilder;
  final Widget Function(
    BuildContext context,
    Object item,
    bool isDisabled,
    bool isSelected,
  )?
  itemBuilder;
  final bool Function(Object item)? disabledItemFn;
  final List<Object> selectedItems;
  final AutovalidateMode? autoValidateMode;
  final String? Function(List<Object>? value)? validator;
  final void Function(List<Object>? value)? onChanged;
  final ListViewProps? listViewProps;
  final String? hintText;
  final String? labelTextField;
  final Widget? prefixIconTextFieldSearch;
  final bool showSearchBox;
  final Color? fillColor;
  final Color? fillColorTF;
  final TextAlign? textAlign;
  final String? labelText;
  final Widget? icon;
  final Color? iconColor;
  final Function()? onTapCancel;
  final Color? menuPropsColor;
  final Color? backgroundColor;
  final bool interceptCallBacks;
  final BorderSide? borderSide;
  final EdgeInsets paddingTF;
  final bool necessary;
  final PopupPropsMultiSelection<Object>? popupProps;
  final BorderRadius? borderRadius;
  final BoxConstraints? constraints;
  final Widget? prefixIcon;
  final bool Function(Object item1, Object item2)? compareFn;
  final Widget Function(
    BuildContext context,
    Object item,
    bool isDisabled,
    bool isSelected,
  )?
  checkBoxBuilder;
  final Future<bool?> Function(List<Object> prevItems, List<Object> nextItems)?
  onBeforeChange;
  final Future<bool?> Function(List<Object> selItems)? onBeforePopupOpening;
  final void Function(List<Object> selectedItems, Object removedItem)?
  onItemRemoved;
  final TextEditingController? searchController;
  final ScrollController? scrollController;
  final InputDecoration? inputDecoration;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? inputBorder;
  final String? textKey;
  final bool showValidator;

  const BuildDropdownSearchMultiSelection({
    super.key,
    this.disable = false,
    this.itemAsString,
    this.dropdownBuilder,
    this.itemBuilder,
    this.disabledItemFn,
    this.keyDropdown,
    this.items,
    this.selectedItems = const [],
    this.autoValidateMode,
    this.validator,
    this.onChanged,
    this.listViewProps,
    this.hintText,
    this.labelTextField,
    this.prefixIconTextFieldSearch,
    this.showSearchBox = false,
    this.fillColor,
    this.fillColorTF,
    this.textAlign,
    this.labelText,
    this.icon,
    this.iconColor,
    this.onTapCancel,
    this.menuPropsColor,
    this.backgroundColor,
    this.interceptCallBacks = false,
    this.borderSide,
    this.paddingTF = const EdgeInsets.all(8.0),
    this.necessary = false,
    this.popupProps,
    this.borderRadius,
    this.constraints,
    this.prefixIcon,
    this.compareFn,
    this.checkBoxBuilder,
    this.onBeforeChange,
    this.onBeforePopupOpening,
    this.onItemRemoved,
    this.searchController,
    this.scrollController,
    this.inputDecoration,
    this.border,
    this.contentPadding,
    this.inputBorder,
    this.textKey,
    this.showValidator = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.onlyBottomPaddingNormal,
      child: Column(
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
          DropdownSearch<Object>.multiSelection(
            key: keyDropdown,
            enabled: !disable,
            compareFn: compareFn,
            selectedItems: selectedItems,
            itemAsString: itemAsString,
            items: items,
            decoratorProps: _dropDownDecoratorProps(
              context,
              constraints: constraints,
              textAlign: textAlign,
              fillColor: fillColor,
              hintText: hintText,
              prefixIcon: prefixIcon,
              labelText: labelText,
              validator: validator == null ? false : true,
              disable: disable,
              borderRadius: borderRadius,
              borderSide: borderSide,
              border: border,
              contentPadding: contentPadding,
            ),
            dropdownBuilder: dropdownBuilder,
            popupProps:
                popupProps ??
                _popupPropsMultiSelection(
                  context,
                  searchController: searchController,
                  scrollController: scrollController,
                  showSearchBox: showSearchBox,
                  menuPropsColor: menuPropsColor,
                  listViewProps: listViewProps,
                  backgroundColor: backgroundColor,
                  itemBuilder: itemBuilder,
                  disabledItemFn: disabledItemFn,
                  interceptCallBacks: interceptCallBacks,
                  checkBoxBuilder: checkBoxBuilder,
                  onItemRemoved: onItemRemoved,
                ),
            onBeforeChange: onBeforeChange,
            onBeforePopupOpening: onBeforePopupOpening,
            autoValidateMode: autoValidateMode,
            validator: validator,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  PopupPropsMultiSelection<Object> _popupPropsMultiSelection(
    BuildContext context, {
    required bool showSearchBox,
    required Color? menuPropsColor,
    required ListViewProps? listViewProps,
    required Color? backgroundColor,
    required Widget Function(BuildContext, Object, bool, bool)? itemBuilder,
    required bool Function(Object)? disabledItemFn,
    required bool interceptCallBacks,
    required Widget Function(BuildContext, Object, bool, bool)? checkBoxBuilder,
    required void Function(List<Object> selectedItems, Object removedItem)?
    onItemRemoved,
    required TextEditingController? searchController,
    required ScrollController? scrollController,
  }) {
    return PopupPropsMultiSelection.menu(
      showSearchBox: showSearchBox,
      onItemRemoved: onItemRemoved,
      checkBoxBuilder: checkBoxBuilder,
      searchFieldProps: _textFieldProps(
        context,
        searchController: searchController,
        menuPropsColor: menuPropsColor,
        paddingTF: paddingTF,
        fillColorTF: fillColorTF,
        labelTextField: labelTextField,
        prefixIconTextFieldSearch: prefixIconTextFieldSearch,
        disable: disable,
      ),
      validationBuilder: (context, selectedItems) {
        return Padding(
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton.click(
                context,
                onTap: () => keyDropdown?.currentState?.popupOnValidate(),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "ตกลง",
                    style: AppTextStyle(
                      context,
                    ).kBodyDefault.copyWith(color: AppColors.instance.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listViewProps:
          listViewProps ??
          _listViewProps(context, scrollController: scrollController),
      scrollbarProps: _scrollbarProps(context, thumbColor: menuPropsColor),
      constraints: BoxConstraints(maxHeight: context.height * 0.6),
      containerBuilder: (context, popupWidget) {
        return Padding(
          padding: context.onlyBottomPaddingLow,
          child: popupWidget,
        );
      },
      loadingBuilder:
          (context, searchEntry) => Padding(
            padding: context.paddingLow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoActivityIndicator(
                  color: AppColors.instance.grey,
                  radius: context.iconLoading,
                ),
              ],
            ),
          ),
      searchDelay: const Duration(milliseconds: 300),
      fit: FlexFit.loose,
      menuProps: _menuProps(
        context,
        menuPropsColor: menuPropsColor,
        backgroundColor: backgroundColor,
      ),
      itemBuilder: itemBuilder,
      disabledItemFn: disabledItemFn,
      interceptCallBacks: interceptCallBacks,
      emptyBuilder: (_, searchEntry) => _emptyBuilder(context),
      errorBuilder:
          (_, searchEntry, exception) =>
              _errorBuilder(context, exception: exception),
    );
  }
}

DropDownDecoratorProps _dropDownDecoratorProps(
  BuildContext context, {
  required BoxConstraints? constraints,
  required TextAlign? textAlign,
  required Color? fillColor,
  required String? hintText,
  required Widget? prefixIcon,
  required String? labelText,
  required bool validator,
  required bool disable,
  required BorderRadius? borderRadius,
  required final BorderSide? borderSide,
  required InputBorder? border,
  required EdgeInsetsGeometry? contentPadding,
}) {
  return DropDownDecoratorProps(
    textAlign: textAlign,
    baseStyle: AppTextStyle(context).kBodyDefault,
    decoration: InputDecoration(
      isCollapsed: false,
      constraints: constraints,
      fillColor: fillColor ?? AppColors.instance.white,
      // filled: true,
      contentPadding:
          contentPadding ??
          const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
      hintText: hintText,
      hintStyle: AppTextStyle(context).kBodyDefault.copyWith(
        color: disable ? AppColors.instance.disable : AppColors.instance.grey,
      ),
      prefixIcon: prefixIcon,
      alignLabelWithHint: true,
      label:
          labelText != null
              ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (validator)
                    Text(
                      '* ',
                      style: AppTextStyle(
                        context,
                      ).kBody1.copyWith(color: AppColors.instance.red),
                    ),
                  Text(
                    labelText,
                    style:
                        disable
                            ? AppTextStyle(context).kBodyDefault.copyWith(
                              color: AppColors.instance.grey,
                            )
                            : AppTextStyle(context).kBodyDefault.copyWith(
                              color: AppColors.instance.grey,
                            ),
                  ),
                ],
              )
              : null,
      labelStyle: AppTextStyle(context).kBodyDefault,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: OutlineInputBorder(
        borderRadius:
            borderRadius ?? BorderRadius.circular(context.defaultValue),
        borderSide: borderSide ?? BorderSide(color: AppColors.instance.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius:
            borderRadius ?? BorderRadius.circular(context.defaultValue),
        borderSide: borderSide ?? BorderSide(color: AppColors.instance.red),
      ),
      disabledBorder: InputBorder.none,
      border: InputBorder.none,
      errorStyle: AppTextStyle(
        context,
      ).kBodyDefault.copyWith(color: AppColors.instance.red),
    ),
  );
}

Widget _emptyBuilder(BuildContext context) {
  return Padding(
    padding: context.paddingLow,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('ไม่พบข้อมูลในระบบ', style: AppTextStyle(context).kBodyDefault),
      ],
    ),
  );
}

Widget _errorBuilder(BuildContext context, {required dynamic exception}) {
  return Padding(
    padding: context.paddingLow,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            exception.toString(),
            style: AppTextStyle(context).kBodyDefault,
          ),
        ),
      ],
    ),
  );
}

TextFieldProps _textFieldProps(
  BuildContext context, {
  required TextEditingController? searchController,
  required Color? menuPropsColor,
  required EdgeInsets paddingTF,
  required Color? fillColorTF,
  required String? labelTextField,
  required Widget? prefixIconTextFieldSearch,
  required bool disable,
}) {
  return TextFieldProps(
    controller: searchController,
    maxLines: 2,
    padding: paddingTF,
    keyboardType: TextInputType.text,
    inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
    style: AppTextStyle(context).kBodyDefault,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.defaultValue),
      ),
      fillColor: fillColorTF ?? AppColors.instance.white,
      filled: true,
      contentPadding: context.paddingContent,
      label: Text(
        labelTextField ?? 'ค้นหา',
        style: AppTextStyle(
          context,
        ).kBodyDefault.copyWith(color: AppColors.instance.grey),
      ),
      prefixIcon: prefixIconTextFieldSearch,
      prefixIconColor:
          disable ? AppColors.instance.disable : AppColors.instance.grey,
      hintStyle: AppTextStyle(context).kBodyDefault,
      enabledBorder: OutlineInputBorder(
        borderSide:
            menuPropsColor == null
                ? BorderSide(color: AppColors.instance.grey)
                : BorderSide(color: menuPropsColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            menuPropsColor == null
                ? BorderSide(color: AppColors.instance.grey)
                : BorderSide(color: menuPropsColor),
      ),
      errorBorder: OutlineInputBorder(
        borderSide:
            menuPropsColor == null
                ? BorderSide(color: AppColors.instance.grey)
                : BorderSide(color: menuPropsColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            menuPropsColor == null
                ? BorderSide(color: AppColors.instance.grey)
                : BorderSide(color: menuPropsColor),
      ),
    ),
  );
}

ListViewProps _listViewProps(
  BuildContext context, {
  required ScrollController? scrollController,
}) {
  return ListViewProps(
    padding: context.onlyRightPaddingLow,
    controller: scrollController,
  );
}

ScrollbarProps _scrollbarProps(
  BuildContext context, {
  required Color? thumbColor,
}) {
  return ScrollbarProps(
    thumbColor: thumbColor ?? AppColors.instance.primary,
    radius: Radius.circular(context.defaultValue),
    thickness: 10,
    crossAxisMargin: 3,
    thumbVisibility: true,
  );
}

MenuProps _menuProps(
  BuildContext context, {
  required Color? menuPropsColor,
  required Color? backgroundColor,
}) {
  return MenuProps(
    backgroundColor: backgroundColor ?? AppColors.instance.white,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: menuPropsColor ?? AppColors.instance.white),
      borderRadius: BorderRadius.circular(context.defaultValue),
    ),
  );
}

String buildItemAsString(List<String?> listString) =>
    listString.map((e) => e?.replaceAll(RegExp(r'\s'), '')).join('');

Widget buildDropdownBuilder(
  BuildContext context, {
  required String? selectedItems,
  bool disable = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Text(
      emptyToDash(selectedItems),
      style:
          !disable
              ? selectedItems == null
                  ? AppTextStyle(
                    context,
                  ).kBodyDefault.copyWith(color: AppColors.instance.grey)
                  : AppTextStyle(context).kBodyDefault
              : AppTextStyle(
                context,
              ).kBodyDefault.copyWith(color: AppColors.instance.disable),
    ),
  );
}

Widget buildDropdownMultiBuilder(
  BuildContext context,
  List<dynamic>? selectedItems,
) {
  List<dynamic> list = selectedItems ?? [];
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child:
        list.isEmpty
            ? Text(
              'เลือก',
              style: AppTextStyle(
                context,
              ).kBodyDefault.copyWith(color: AppColors.instance.grey),
            )
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  list.asMap().entries.map((e) {
                    final data = emptyToDash(e.value);
                    final index = e.key;

                    return Text(
                      '${index + 1}. $data',
                      style: AppTextStyle(context).kBodyDefault,
                    );
                  }).toList(),
            ),
  );
}

Widget buildItemBuilder(
  BuildContext context, {
  String? text,
  bool disable = false,
  Widget? child,
  void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: context.paddingLow,
      child:
          child ??
          Text(
            text ?? '',
            style:
                !disable
                    ? AppTextStyle(context).kBodyDefault
                    : AppTextStyle(
                      context,
                    ).kBodyDefault.copyWith(color: AppColors.instance.disable),
          ),
    ),
  );
}
