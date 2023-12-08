import 'package:ecommerce/Config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Core/utils/styles.dart';

class MyApp extends StatelessWidget {
  String start;
   MyApp(this.start , {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: start,
        onGenerateRoute: (settings) => AppRouter.onGenerate(settings),
        theme: AppStyles.lightTheme,
      ),
    );
  }
}  