//
// import 'package:ecommerce/Core/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
//
//
// class AppStyles {
//   static ThemeData LightThemedata = ThemeData(
//       scaffoldBackgroundColor: Colors.white,
//     // AppColor.BackGround,
//       textTheme: TextTheme(
//           bodyLarge: GoogleFonts.poppins(
//               fontWeight: FontWeight.w600,
//               fontSize: 24.sp,
//               color: Colors.white),
//           bodyMedium: GoogleFonts.poppins(fontSize: 18.sp, color: Colors.white),
//           bodySmall: GoogleFonts.poppins(
//               fontWeight: FontWeight.w300,
//               fontSize: 16.sp,
//               color: Colors.white)),
//
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       unselectedItemColor: Colors.white,
//       selectedItemColor: AppColor.mainColor,
//       backgroundColor: AppColor.mainColor,
//       type: BottomNavigationBarType.fixed,
//       showUnselectedLabels: false,
//       showSelectedLabels: false,
//     ),
//
//     appBarTheme: AppBarTheme(
//       centerTitle: true,
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       iconTheme: IconThemeData(color: AppColor.mainColor),
//     ),
//
//   );
// }

import 'package:ecommerce/Core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.white,
      selectedItemColor: AppColor.mainColor,
      backgroundColor: AppColor.mainColor,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColor.mainColor),
    ),
    textTheme: TextTheme(
        bodyMedium: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.textColor),
        bodySmall: GoogleFonts.poppins(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.textColor,
        ),
        bodyLarge: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.textColor
        )),
  );
}
