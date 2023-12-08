import 'package:ecommerce/Core/utils/app_colors.dart';
import 'package:ecommerce/Core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarr extends StatefulWidget {



Function onClearTap;


SearchBarr(this.onClearTap);

  @override
  State<SearchBarr> createState() => _SearchBarrState();
}

class _SearchBarrState extends State<SearchBarr> {
  // const SearchBarr({super.key});
bool myflag = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 338.w,
      height: 50.h,
      child: TextField(
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: AppStrings.hintText,
          hintStyle: const TextStyle(height: 1),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColor.mainColor,
            size: 30,
          ),
          suffixIcon: InkWell(
              onTap: () {
               widget.onClearTap(myflag);
               setState(() {

               });
              },
              child: const Icon(Icons.clear , size: 30 , color: AppColor.mainColor,)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColor.mainColor),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: AppColor.mainColor)),
        ),
      ),
    );
  }
}
