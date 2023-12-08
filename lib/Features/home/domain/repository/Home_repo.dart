import 'package:dartz/dartz.dart';
import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/home/data/model/AddToCartModel.dart';
import 'package:ecommerce/Features/home/data/model/GetAllBrandsModel.dart';
import 'package:ecommerce/Features/home/data/model/get_all_categoreys.dart';
import 'package:ecommerce/Features/home/domain/entites/CategorAndBrandsEntity.dart';
import 'package:ecommerce/Features/home/domain/entites/ProductsEntity.dart';


abstract class HomeRepo{


    Future<Either<Failures,  CategorAndBrandsEntity>>GetAllCat();
    Future<Either<Failures , CategorAndBrandsEntity>>GetAllBrand();
    int MoveIndex(int index);
    Future<Either<Failures , ProductsEntity>>GetAllProducts();

    Future<Either<Failures , AddToCartModel>>AddToCart(String id , String Token);

}