import 'package:ecommerce/Config/routes/routes.dart';
import 'package:ecommerce/Core/utils/app_colors.dart';
import 'package:ecommerce/Core/utils/app_images.dart';
import 'package:ecommerce/Features/login/presentation/bloc/sign_in_bloc.dart';
import 'package:ecommerce/Features/signup/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/app_strings.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({super.key});

  static var logkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state.signinstate == ScreenState.loading) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(child: CircularProgressIndicator()),
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            );
          } else if (state.signinstate == ScreenState.failure) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("An Error Occured"),
                content: Text(state.signinfailures?.message ?? ""),
                actions: [
                  ElevatedButton(onPressed: (){

                    Navigator.pop(context);
                  }, child: Text("Ok"))
                ],
              ),
            );
          } else if (state.signinstate == ScreenState.sucess) {
            Navigator.pushNamed(context, RoutesName.home);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: logkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 97.w, right: 96.r, top: 91.h),
                      child: Image.asset(AppImages.RouteImage),
                    ),
                    SizedBox(
                      height: 86.9.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.WelcomeBack,
                              style: Theme.of(context).textTheme.bodyLarge),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(AppStrings.PleaseSignIn,
                              style: Theme.of(context).textTheme.bodySmall),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(AppStrings.Username,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  )),
                          SizedBox(
                            height: 24.h,
                          ),
                          TextFormField(
                            controller: BlocProvider.of<SignInBloc>(context).EmailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.errorloginuser;
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                // label: Text('enter your name' , style: GoogleFonts.poppins(fontWeight: FontWeight.w300),),
                                hintText: AppStrings.entername,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w100,
                                      color: AppColor.blackfont,
                                    ),
                                filled: true,
                                fillColor: Colors.white,
                                focusColor: Colors.transparent,
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                              )),
                          SizedBox(
                            height: 32.h,
                          ),
                          Text(AppStrings.Password,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  )),
                          SizedBox(
                            height: 24.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextFormField(
                                controller: BlocProvider.of<SignInBloc>(context).PasswordController,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return AppStrings.errorloginpassword;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: AppStrings.enterpassword,
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w300,
                                              color: AppColor.blackfont),
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusColor: Colors.transparent,
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(color: Colors.transparent)),
                                      suffixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            right: 16.w,
                                            top: 20.h,
                                            bottom: 20.h),
                                        child: ImageIcon(
                                          AssetImage(AppImages.HideImage),
                                          color: Colors.grey,
                                        ),
                                      ))),
                              SizedBox(
                                height: 16.h,
                              ),
                              InkWell(
                                  onTap: () {
                                    // Write The Function Here
                                  },
                                  child: Text(AppStrings.forgotPass,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w400)))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 56.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 17.w, right: 15.w),
                      child: ElevatedButton(
                          onPressed: () {
                            // Write The Function Here
                            if (logkey.currentState!.validate()) {
                              BlocProvider.of<SignInBloc>(context)
                                  .add(LoginButtonClick());
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 23.h, top: 23.h),
                            child: Text(
                              AppStrings.Login,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: AppColor.BackGround,
                                      fontSize: 20.sp),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 32.h),
                      child: Center(
                        child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RoutesName.signup);
                              // Write The Function Here
                            },
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: AppStrings.DontHaveAcc,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              TextSpan(text: " " + "Create One.")
                            ]))),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
