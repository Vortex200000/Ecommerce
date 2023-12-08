import 'package:ecommerce/Core/api/api_manager.dart';
import 'package:ecommerce/Core/utils/app_images.dart';
import 'package:ecommerce/Features/home/data/data_sources/remote/Home_remoted_ds_impl.dart';
import 'package:ecommerce/Features/home/data/repository/Home_repo_impl.dart';
import 'package:ecommerce/Features/home/domain/use_cases/Get_All_UseCases.dart';
import 'package:ecommerce/Features/home/domain/use_cases/Get_All_brands.dart';
import 'package:ecommerce/Features/home/domain/use_cases/Geta_All_Products_UseCase.dart';
import 'package:ecommerce/Features/home/domain/use_cases/move_index_usecase.dart';
import 'package:ecommerce/Features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce/Features/home/presentation/bloc/home_event.dart';
import 'package:ecommerce/Features/home/presentation/bloc/home_state.dart';
import 'package:ecommerce/Features/home/presentation/pages/Products.dart';
import 'package:ecommerce/Features/login/data/data_source/Local_ds/Local_ds_impl.dart';
import 'package:ecommerce/Features/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(
          GetAllBrandsUseCase(
              HomeRepoImp(HomeRemoteDsImpl(ApiManager()), LoginLocaldsimpl())),
          Getallcatusecase(
              HomeRepoImp(HomeRemoteDsImpl(ApiManager()), LoginLocaldsimpl())),
          MoveIndexUseCase(
              HomeRepoImp(HomeRemoteDsImpl(ApiManager()), LoginLocaldsimpl())),
          GetAllProductsUseCase(
              HomeRepoImp(HomeRemoteDsImpl(ApiManager()), LoginLocaldsimpl())))
        ..add(HomeNavIndexChange()),
      child: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)),
              child: BottomNavigationBar(
                currentIndex: state.index ?? 0,
                onTap: (value) {
                  state.index = value;
                  HomePageBloc.get(context).add(HomeNavIndexChange());
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: state.index == 0
                                  ? Colors.white
                                  : Colors.transparent,
                              shape: BoxShape.circle),
                          child:
                              ImageIcon(AssetImage(AppImages.homeIconImage))),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: state.index == 1
                                  ? Colors.white
                                  : Colors.transparent,
                              shape: BoxShape.circle),
                          child: ImageIcon(
                              AssetImage(AppImages.categoryIconImage))),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: state.index == 2
                                  ? Colors.white
                                  : Colors.transparent,
                              shape: BoxShape.circle),
                          child:
                              ImageIcon(AssetImage(AppImages.faveIconImage))),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: state.index == 3
                                  ? Colors.white
                                  : Colors.transparent,
                              shape: BoxShape.circle),
                          child: ImageIcon(
                              AssetImage(AppImages.profileIconImage))),
                      label: ""),
                ],
              ),
            ),
            extendBody: true,
            body: Center(child: bottomNavBarScreens[state.index ?? 0]),
          );
        },
      ),
    );
  }
}

List<Widget> bottomNavBarScreens = [
  HomePage(),
  Products(),
  Text("3"),
  ProfileScreen(),
];
