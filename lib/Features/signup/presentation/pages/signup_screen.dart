

import 'package:ecommerce/Core/utils/app_colors.dart';
import 'package:ecommerce/Core/utils/app_images.dart';
import 'package:ecommerce/Core/utils/app_strings.dart';
import 'package:ecommerce/Features/signup/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signup extends StatelessWidget {
  // const SignupScreen({super.key});
  static var signkey = GlobalKey<FormState>();
  var Fullnamecontroller = TextEditingController();
  var Emailcontroller = TextEditingController();
  var Phonecontroller = TextEditingController();
  var Passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => SignUpBloc(),
  child: BlocConsumer<SignUpBloc, SignUpState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      body: Form(
        key: signkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 97.w, right: 96.r, top: 85.h),
                child: Image.asset(AppImages.RouteImage),
              ),
              SizedBox(
                height: 46.9.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.Fullname,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 24.h,
                    ),
                    TextFormField(
                        controller: Fullnamecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.errorname;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          // label: Text('enter your name' , style: GoogleFonts.poppins(fontWeight: FontWeight.w300),),
                          hintText: AppStrings.EnterFullname,
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
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)),
                              borderSide:
                              BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)),
                              borderSide:
                              BorderSide(color: Colors.transparent)),
                          focusedErrorBorder: OutlineInputBorder(
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
                    Text(AppStrings.Mobile,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 24.h,
                    ),
                    TextFormField(
                        controller: Phonecontroller,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.errormobile;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          // label: Text('enter your name' , style: GoogleFonts.poppins(fontWeight: FontWeight.w300),),
                          hintText: AppStrings.entermobile,
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
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)),
                              borderSide:
                              BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)),
                              borderSide:
                              BorderSide(color: Colors.transparent)),
                          focusedErrorBorder: OutlineInputBorder(
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
                    Text(AppStrings.Email,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 24.h,
                    ),
                    TextFormField(
                        controller: Emailcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.erroremail;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          // label: Text('enter your name' , style: GoogleFonts.poppins(fontWeight: FontWeight.w300),),
                          hintText: AppStrings.enteryouremail,
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
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)),
                              borderSide:
                              BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)),
                              borderSide:
                              BorderSide(color: Colors.transparent)),
                          focusedErrorBorder: OutlineInputBorder(
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
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 24.h,
                    ),
                    TextFormField(
                        controller: Passwordcontroller,
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
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(
                                  right: 16.w, top: 20.h, bottom: 20.h),
                              child: ImageIcon(
                                AssetImage(AppImages.HideImage),
                                color: Colors.grey,
                              ),
                            ))),
                    SizedBox(
                      height: 56.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              // Write The Function Here
                              if (signkey.currentState!.validate()) {

                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 23.h, top: 23.h),
                              child: Text(
                                AppStrings.SignUp,
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
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 89.h,
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




//   BlocProvider(
    //   create: (context) => SignUpBloc(),
    //   child: BlocConsumer<SignUpBloc, SignUpState>(
    //     listener: (context, state) {
    //       if (state.screenState == ScreenState.failure) {
    //         showDialog(
    //           context: context,
    //           builder: (context) => AlertDialog(
    //             title: Text("Error"),
    //             content: Text(state.failures?.message ?? ""),
    //           ),
    //         );
    //       }
    //     },
    //     builder: (context, state) {
    //       return Scaffold(
    //         appBar: AppBar(
    //           title: Text("SignUp"),
    //         ),
    //         floatingActionButton: FloatingActionButton(
    //           onPressed: () {
    //             SignUpBloc.get(context).add(SignUpButtonClicked());
    //           },
    //         ),
    //         body: Container(
    //           child: Center(
    //             child: Text(state.entity?.user?.name ?? "Hllo"),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );














// import 'package:ecommerce/Features/signup/domain/entities/UserEntity.dart';
// import 'package:ecommerce/Features/signup/presentation/bloc/sign_up_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class Signupp extends StatelessWidget {
//   const Signupp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SignUpBloc(),
//       child: BlocConsumer<SignUpBloc, SignUpState>(
//         listener: (context, state) {
//           if(state.screenState == ScreenState.failure)
//             {
//               showDialog(context: context, builder: (context) => AlertDialog(title: Text(state.failures?.message??"")),);
//             }
//           if(state.screenState == ScreenState.sucess)
//             {
//               Text("hi");
//             }
//         },
//         builder: (context, state) {
//           return Scaffold(
//
//             appBar: AppBar(
//
//               title: const Text("sign up"),
//
//             ),
//
//             floatingActionButton: FloatingActionButton(onPressed: () {
//               SignUpBloc.get(context).add(SignUpButtonClick());
//             }),
//
//             body:  Container(child:  Center(child: Text(state.entity?.user?.name??"hello"),),),
//           );
//         },
//       ),
//     );
//   }
// }
