import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class CostumeTextFormField extends StatelessWidget {
  final String hintText;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CostumeTextFormField(
      {super.key, required this.hintText, this.prefixIcon, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.h,
      child: TextFormField(
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(height: 1.h),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColor.mainColor),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColor.mainColor)),
        ),
      ),
    );
  }
}

class CostumeText extends StatelessWidget {
  final String profileText;

  const CostumeText(this.profileText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      profileText,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}