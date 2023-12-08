import 'package:dartz/dartz.dart';
import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/home/data/model/AddToCartModel.dart';
import 'package:ecommerce/Features/home/data/model/GetAllBrandsModel.dart';
import 'package:ecommerce/Features/home/data/model/ProductsModel.dart';
import 'package:ecommerce/Features/home/data/model/get_all_categoreys.dart';
import 'package:ecommerce/Features/home/domain/entites/CategorAndBrandsEntity.dart';

abstract class HomeRemoteDs{


  Future<Either<Failures , GetAllCategoreysModel>>GetaCat();

  Future<Either<Failures , GetAllBrandsModel>>GetAllBrands();
  Future<Either<Failures , ProductsModel>>GetaAllProductss();
  Future<Either<Failures , AddToCartModel>>AddToCart(String id , String Token);



}