import 'package:poon_estock_application/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    fontFamily: "Kanit",
    textTheme: GoogleFonts.kanitTextTheme(),
    useMaterial3: true,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.instance.primary,
      selectionColor: AppColors.instance.primary,
      selectionHandleColor: AppColors.instance.primary,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.instance.primary,
    ),
    scaffoldBackgroundColor: AppColors.instance.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.instance.white,
      surfaceTintColor: AppColors.instance.white,
      foregroundColor: AppColors.instance.white,
    ),
    checkboxTheme: CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fillColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.instance.green;
        }
        return AppColors.instance.grey;
      }),
      side: BorderSide(width: 1, color: AppColors.instance.grey),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.checkBox),
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelPadding: EdgeInsets.zero,
      indicatorSize: TabBarIndicatorSize.tab,
      overlayColor: WidgetStatePropertyAll(AppColors.instance.white),
      dividerColor: Colors.transparent,
      indicatorColor: AppColors.instance.primary,
    ),
  );
}
