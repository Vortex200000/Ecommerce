import 'package:ecommerce/Core/utils/app_images.dart';
import 'package:ecommerce/Core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Image.asset(AppImages.routeName)),
            SizedBox(
              height: 24.h,
            ),
            const CostumeText("${AppStrings.welcome} Mohamed"),
            SizedBox(
              height: 66.h,
            ),
            const CostumeText(AppStrings.yourFullName),
            SizedBox(
              height: 16.h,
            ),
            const CostumeTextFormField(
              hintText: AppStrings.yourFullName,
              suffixIcon: Icon(Icons.edit),
            ),
            SizedBox(
              height: 16.h,
            ),
            const CostumeText(AppStrings.yourEmail),
            SizedBox(
              height: 16.h,
            ),
            const CostumeTextFormField(
              hintText: AppStrings.yourEmail,
              suffixIcon: Icon(Icons.edit),
            ),
            SizedBox(
              height: 16.h,
            ),
            const CostumeText(AppStrings.yourPassword),
            SizedBox(
              height: 16.h,
            ),
            const CostumeTextFormField(
              hintText: AppStrings.yourPassword,
              suffixIcon: Icon(Icons.edit),
            ),
            SizedBox(
              height: 16.h,
            ),
            const CostumeText(AppStrings.yourMobileNumber),
            SizedBox(
              height: 16.h,
            ),
            const CostumeTextFormField(
              hintText: AppStrings.yourMobileNumber,
              suffixIcon: Icon(Icons.edit),
            ),
            SizedBox(
              height: 16.h,
            ),
            const CostumeText(AppStrings.yourAddress),
            SizedBox(
              height: 16.h,
            ),
            const CostumeTextFormField(
              hintText: AppStrings.yourAddress,
              suffixIcon: Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}
