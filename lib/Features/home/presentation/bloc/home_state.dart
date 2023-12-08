import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/home/data/model/GetAllBrandsModel.dart';
import 'package:ecommerce/Features/home/data/model/get_all_categoreys.dart';
import 'package:ecommerce/Features/home/domain/entites/CategorAndBrandsEntity.dart';
import 'package:ecommerce/Features/home/domain/entites/ProductsEntity.dart';
import 'package:flutter/foundation.dart';

enum Homescreenstate {
  init,
  loading,
  getbrandserror,
  getbrandssucsess,
  getcaterror,
  getcatsucsess,
  getProductsSucsess,
  getProductsError,
  addTocartError,
  addTocartSucsess
}

@immutable
class HomePageState {
  Homescreenstate? homescreenstate;
  Failures? homefailures;
  List<DataEntity>? categoryes;
  List<DataEntity>? Brands;
  int? index = 0;
  List<ProductsDataEntity>? Products;

  HomePageState(
      {this.homescreenstate,
      this.homefailures,
      this.categoryes,
      this.Brands,
      this.index,
      this.Products});

  HomePageState CopyWith(
      {Homescreenstate? homescreenstates,
      Failures? homefailuress,
      List<DataEntity>? Categoryes,
      List<DataEntity>? brands,
      int? indexx,
      List<ProductsDataEntity>? Productss}) {
    return HomePageState(
        homescreenstate: homescreenstates ?? this.homescreenstate,
        homefailures: homefailuress ?? this.homefailures,
        categoryes: Categoryes ?? this.categoryes,
        Brands: brands ?? this.Brands,
        index: indexx ?? this.index,
        Products: Productss ?? this.Products);
  }
}

class HomePageInitial extends HomePageState {
  HomePageInitial() : super(homescreenstate: Homescreenstate.init);
}
