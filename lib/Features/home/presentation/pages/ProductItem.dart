import 'package:ecommerce/Config/routes/routes.dart';
import 'package:ecommerce/Core/api/api_manager.dart';
import 'package:ecommerce/Core/utils/app_colors.dart';
import 'package:ecommerce/Core/utils/app_images.dart';
import 'package:ecommerce/Features/home/data/data_sources/remote/Home_remoted_ds_impl.dart';
import 'package:ecommerce/Features/home/data/repository/Home_repo_impl.dart';
import 'package:ecommerce/Features/home/domain/entites/ProductsEntity.dart';
import 'package:ecommerce/Features/home/domain/use_cases/Get_All_UseCases.dart';
import 'package:ecommerce/Features/home/domain/use_cases/Get_All_brands.dart';
import 'package:ecommerce/Features/home/domain/use_cases/Geta_All_Products_UseCase.dart';
import 'package:ecommerce/Features/home/domain/use_cases/move_index_usecase.dart';
import 'package:ecommerce/Features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce/Features/home/presentation/bloc/home_event.dart';
import 'package:ecommerce/Features/home/presentation/bloc/home_state.dart';
import 'package:ecommerce/Features/home/presentation/pages/DetailsModel.dart';
import 'package:ecommerce/Features/home/presentation/pages/Product_Details.dart';
import 'package:ecommerce/Features/login/data/data_source/Local_ds/Local_ds_impl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  // const ProductItem({super.key});

  List<ProductsDataEntity> Products;
  int index;
  List<int>Integers = [1,
  2,3];

  ProductItem(this.Products, this.index);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(
          GetAllBrandsUseCase(
            HomeRepoImp(
              HomeRemoteDsImpl(
                ApiManager(),
              ),LoginLocaldsimpl()
            ),
          ),
          Getallcatusecase(
            HomeRepoImp(
              HomeRemoteDsImpl(
                ApiManager(),
              ),LoginLocaldsimpl()
            ),
          ),
          MoveIndexUseCase(
            HomeRepoImp(
              HomeRemoteDsImpl(
                ApiManager(),
              ),LoginLocaldsimpl()
            ),
          ),
          GetAllProductsUseCase(HomeRepoImp(HomeRemoteDsImpl(ApiManager()),LoginLocaldsimpl())))
        ..add(HomeProductsEvent()),
      child: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return InkWell(
            onTap: () {
              HomePageBloc.get(context).add(HomeProductsEvent());
              // Navigator.of(context).pushNamed(
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => ProductDetails(Products[index]),
              //   ),
              //
              // );
Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetails(Products[index]),));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Color(0x2C004182), width: 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.zero,
                                bottomLeft: Radius.zero),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          Products[index].imageCover ?? ""),
                                      fit: BoxFit.cover)),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {},
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Container(
                                height: 25.h,
                                width: 25.w,
                                padding: EdgeInsets.all(4),
                                child: Image.asset(AppImages.faveBlue),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${Products[index].title ?? ""}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 14),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "EGP ${Products[index].price ?? ""}",
                                  //${Products[index].price?.toDouble()??""}
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontSize: 14),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Expanded(
                                  child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Text(
                                          "2000 EGP",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontSize: 14,
                                                  color: Color.fromRGBO(
                                                      0, 65, 130, 0.60)),
                                        ),
                                        Container(
                                          width: 70.w,
                                          height: 1.h,
                                          color:
                                              Color.fromRGBO(0, 65, 130, 0.60),
                                        )
                                      ]),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Review (${Products[index].ratingsQuantity ?? ""})",
                                  // ${Products[index].ratingsQuantity?.toDouble()??""}
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontSize: 14),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () {},
                                    child: Container(
                                      child: Center(
                                          child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColor.mainColor,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
