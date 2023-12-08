
import 'package:ecommerce/Core/utils/app_images.dart';
import 'package:ecommerce/Core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
        ],
        title: Text(AppStrings.card,
            style: Theme.of(context).textTheme.bodyMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 113.h,
              width: 398.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: AppColor.mainColor),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppImages.cardItem),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: Text(
                          "Nike Air Jordon",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.textColor),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 7.5,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "Orange| Size: 40",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "EGP 3,500",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.textColor),
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const InkWell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.delete,
                            color: AppColor.mainColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: 110.w,
                        height: 40.h,
                        margin: const EdgeInsets.only(right: 8, top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.mainColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 20,
                              child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.white),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    size: 20,
                                    color: Colors.white,
                                  )),
                            ),
                            Text(
                              "1",
                              style: TextStyle(color: Colors.white),
                            ),
                            InkWell(
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 20,
                                child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 2, color: Colors.white),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 567.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.mainColor),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "EGP 3,500",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.textColor),
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.mainColor,
                        fixedSize: Size(270.w, 48.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {},
                    child: Text(AppStrings.checkOut))
              ],
            ),
          ],
        ),
      ),
    );
  }
}