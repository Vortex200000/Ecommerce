import 'package:dartz/dartz.dart';
import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/home/data/data_sources/remote/Home_remote_ds.dart';
import 'package:ecommerce/Features/home/data/model/AddToCartModel.dart';
import 'package:ecommerce/Features/home/data/model/GetAllBrandsModel.dart';
import 'package:ecommerce/Features/home/data/model/get_all_categoreys.dart';
import 'package:ecommerce/Features/home/domain/entites/CategorAndBrandsEntity.dart';

import 'package:ecommerce/Features/home/domain/entites/ProductsEntity.dart';
import 'package:ecommerce/Features/home/domain/repository/Home_repo.dart';
import 'package:ecommerce/Features/login/data/data_source/Local_ds/Local_ds.dart';

class HomeRepoImp implements HomeRepo {


  HomeRemoteDs homeRemoteDs;
  Loginlocalds  loginlocalds;

  HomeRepoImp(this.homeRemoteDs ,this.loginlocalds );

  @override
  //**
  Future<Either<Failures, CategorAndBrandsEntity>> GetAllCat() {
    return homeRemoteDs.GetaCat();
  }

  @override
  Future<Either<Failures, CategorAndBrandsEntity>> GetAllBrand() {
    return homeRemoteDs.GetAllBrands();
  }

  @override
  int MoveIndex(int index) {
    return index;
  }

  @override
  Future<Either<Failures, ProductsEntity>> GetAllProducts() {
   return homeRemoteDs.GetaAllProductss();
  }

  @override
  Future<Either<Failures, AddToCartModel>> AddToCart(String id , String token) {
    token = loginlocalds.getToken();

   return homeRemoteDs.AddToCart(id, token);
  }




}
