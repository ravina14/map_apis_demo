import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_color.dart';

class AppThemes {
  AppThemes._();
  static final light = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor,
                                        secondary: AppColor.subtitleColor),
      useMaterial3: true,
      scaffoldBackgroundColor: AppColor.bgColor,
      fontFamily: GoogleFonts.solway().fontFamily,
      appBarTheme: AppBarTheme(
        color: AppColor.primaryColor,
        centerTitle: true,
        elevation: 3.0,
        titleTextStyle: TextStyle(
            fontFamily: GoogleFonts.solway().fontFamily,
            color: AppColor.appBarTitleColor,
            fontSize: 25.0,
            fontWeight: FontWeight.bold),
        iconTheme: const IconThemeData(
          color: AppColor.appBarIconColor,
        ),
        actionsIconTheme: const IconThemeData(
          color: AppColor.appBarIconColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.customBtnBgColor,
            foregroundColor: AppColor.customBtnTextColor,
            minimumSize: Size(double.infinity, 50.h),
            textStyle: TextStyle(
                fontFamily: GoogleFonts.solway().fontFamily,
                color: AppColor.customBtnTextColor,
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold)),
      ),
      );

  static final dark = ThemeData(
      scaffoldBackgroundColor: AppColor.darkBgColor,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColor.darkPrimaryColor,
                                        primaryContainer: AppColor.darkBgColor,
                                        secondaryContainer: AppColor.darkAppBarIconColor,
                                        secondary: AppColor.darkSubtitleColor),
      useMaterial3: true,
      fontFamily: GoogleFonts.solway().fontFamily,
      appBarTheme: AppBarTheme(
        color: AppColor.primaryColor,
        centerTitle: true,
        elevation: 3.0,
        titleTextStyle: TextStyle(
            fontFamily: GoogleFonts.solway().fontFamily,
            color: AppColor.darkAppBarTitleColor,
            fontSize: 25.0,
            fontWeight: FontWeight.bold),
        iconTheme: const IconThemeData(
          color: AppColor.darkAppBarIconColor,
        ),
        actionsIconTheme: const IconThemeData(
          color: AppColor.darkAppBarIconColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.darkCustomBtnBgColor,
            foregroundColor: AppColor.darkCustomBtnTextColor,
            minimumSize: Size(double.infinity, 50.h),
            textStyle: TextStyle(
                fontFamily: GoogleFonts.solway().fontFamily,
                color: AppColor.customBtnTextColor,
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold)),
      ),
      
    );
}
