import 'package:ecommerce/Core/api/api_manager.dart';
import 'package:ecommerce/Core/utils/app_colors.dart';
import 'package:ecommerce/Core/utils/app_images.dart';
import 'package:ecommerce/Core/utils/app_strings.dart';
import 'package:ecommerce/Features/home/data/data_sources/remote/Home_remoted_ds_impl.dart';
import 'package:ecommerce/Features/home/data/repository/Home_repo_impl.dart';
import 'package:ecommerce/Features/home/domain/use_cases/Get_All_UseCases.dart';
import 'package:ecommerce/Features/home/domain/use_cases/Get_All_brands.dart';
import 'package:ecommerce/Features/home/domain/use_cases/Geta_All_Products_UseCase.dart';
import 'package:ecommerce/Features/home/domain/use_cases/move_index_usecase.dart';
import 'package:ecommerce/Features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce/Features/home/presentation/bloc/home_event.dart';
import 'package:ecommerce/Features/home/presentation/bloc/home_state.dart';
import 'package:ecommerce/Features/home/presentation/pages/ProductItem.dart';
import 'package:ecommerce/Features/login/data/data_source/Local_ds/Local_ds_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(
          GetAllBrandsUseCase(
            HomeRepoImp(
                HomeRemoteDsImpl(
                  ApiManager(),
                ),
                LoginLocaldsimpl()),
          ),
          Getallcatusecase(
            HomeRepoImp(
                HomeRemoteDsImpl(
                  ApiManager(),
                ),
                LoginLocaldsimpl()),
          ),
          MoveIndexUseCase(
            HomeRepoImp(
                HomeRemoteDsImpl(
                  ApiManager(),
                ),
                LoginLocaldsimpl()),
          ),
          GetAllProductsUseCase(
              HomeRepoImp(HomeRemoteDsImpl(ApiManager()), LoginLocaldsimpl())))
        ..add(HomeProductsEvent()),
      child: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {
          if (state.homescreenstate == Homescreenstate.loading) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Center(child: CircularProgressIndicator()),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                );
              },
            );
          } else if (state.homescreenstate ==
              Homescreenstate.getProductsError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("An Error Occured"),
                content: Text(state.homefailures?.message ?? ""),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ok"))
                ],
              ),
            );
          } else if (state.homescreenstate ==
              Homescreenstate.getProductsSucsess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(AppImages.routeName)),
                SizedBox(
                  height: 18.h,
                ),
                Row(
                  children: [
                    SizedBox(
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
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: AppColor.mainColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(color: AppColor.mainColor)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    InkWell(
                        onTap: () {
                          // Navigator.pushNamed(context, RoutesName.cardScreen);
                        },
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColor.mainColor,
                        )),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      crossAxisCount: 2,
                    ),
                    itemCount: state.Products?.length != null
                        ? state.Products?.length
                        : 10,
                    itemBuilder: (context, index) => state.Products != null
                        ? ProductItem(state.Products ?? [], index)
                        : Center(child: CircularProgressIndicator()),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
