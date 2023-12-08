import 'package:carousel_slider/carousel_slider.dart';

import 'package:ecommerce/Config/routes/routes.dart';
import 'package:ecommerce/Core/api/api_manager.dart';
import 'package:ecommerce/Core/utils/app_colors.dart';
import 'package:ecommerce/Core/utils/app_images.dart';
import 'package:ecommerce/Core/utils/app_strings.dart';
import 'package:ecommerce/Features/home/data/data_sources/remote/Home_remoted_ds_impl.dart';
import 'package:ecommerce/Features/home/data/model/GetAllBrandsModel.dart';
import 'package:ecommerce/Features/home/data/model/get_all_categoreys.dart';
import 'package:ecommerce/Features/home/data/repository/Home_repo_impl.dart';
import 'package:ecommerce/Features/home/domain/use_cases/Get_All_UseCases.dart';
import 'package:ecommerce/Features/home/domain/use_cases/Get_All_brands.dart';
import 'package:ecommerce/Features/home/domain/use_cases/Geta_All_Products_UseCase.dart';
import 'package:ecommerce/Features/home/domain/use_cases/move_index_usecase.dart';
import 'package:ecommerce/Features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce/Features/home/presentation/bloc/home_event.dart';
import 'package:ecommerce/Features/home/presentation/bloc/home_state.dart';
import 'package:ecommerce/Features/home/presentation/pages/home_appliance.dart';
import 'package:ecommerce/Features/login/data/data_source/Local_ds/Local_ds_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_items.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;
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
        ..add(HomeGetBrandsEvent())
        ..add(HomeGetCategoryesEvent()),
      child: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {
          if (state.homescreenstate == Homescreenstate.loading) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(child: CircularProgressIndicator()),
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            );
          } else if (state.homescreenstate == Homescreenstate.getcaterror ||
              state.homescreenstate == Homescreenstate.getbrandserror) {
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
          } else if (state.homescreenstate == Homescreenstate.getcatsucsess ||
              state.homescreenstate == Homescreenstate.getbrandssucsess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 30),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
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
                                borderSide: const BorderSide(
                                    color: AppColor.mainColor)),
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
                  CarouselSlider(
                      items: [
                        Image.asset(
                          AppImages.adOne,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                        Image.asset(AppImages.adTow),
                        Image.asset(AppImages.adThree),
                      ],
                      options: CarouselOptions(
                        animateToClosest: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(
                          seconds: 3,
                        ),
                        autoPlayAnimationDuration: const Duration(
                          seconds: 1,
                        ),

                        viewportFraction: 1.0,
                        enlargeCenterPage: true,
                        enlargeFactor: 4,
                        //enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      )),
                  Row(
                    children: [
                      Text(AppStrings.categories, style: textStyle.bodyMedium),
                      Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text(AppStrings.viewAll,
                              style: textStyle.bodySmall))
                    ],
                  ),
                  SizedBox(
                    height: 320.h,
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.2, crossAxisCount: 2),
                      itemCount: state.categoryes?.length != null
                          ? state.categoryes?.length
                          : 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => state.categoryes != null
                          ? CategoryItems(state.categoryes ?? [], index)
                          : Center(child: CircularProgressIndicator()),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    AppStrings.homeAppliance,
                    textAlign: TextAlign.start,
                    style: textStyle.bodyMedium,
                  ),
                  GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16),
                      itemCount: state.Brands?.length != null
                          ? state.Brands?.length
                          : 10,
                      itemBuilder: (context, index) => state.Brands != null
                          ? HomeApplianceItems(state.Brands ?? [], index)
                          : Center(child: CircularProgressIndicator())),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
