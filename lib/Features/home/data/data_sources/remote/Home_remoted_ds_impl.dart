import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/Core/api/api_manager.dart';
import 'package:ecommerce/Core/api/end_points.dart';
import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/home/data/data_sources/remote/Home_remote_ds.dart';
import 'package:ecommerce/Features/home/data/model/AddToCartModel.dart';
import 'package:ecommerce/Features/home/data/model/GetAllBrandsModel.dart';
import 'package:ecommerce/Features/home/data/model/ProductsModel.dart';
import 'package:ecommerce/Features/home/data/model/get_all_categoreys.dart';

class HomeRemoteDsImpl implements HomeRemoteDs {
  ApiManager apiManager;

  HomeRemoteDsImpl(this.apiManager);

  @override
  Future<Either<Failures, GetAllCategoreysModel>> GetaCat() async {
    try {
      Response response =
          await apiManager.getData(endPoint: EndPoints.GET_ALL_CAT);

      GetAllCategoreysModel getAllCategoreysModel =
          GetAllCategoreysModel.fromJson(response.data);
      return Right(getAllCategoreysModel);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetAllBrandsModel>> GetAllBrands() async {
    try {
      Response response =
          await apiManager.getData(endPoint: EndPoints.GET_ALL_BRANDS);
      GetAllBrandsModel getAllBrandsModel =
          GetAllBrandsModel.fromJson(response.data);
      return Right(getAllBrandsModel);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductsModel>> GetaAllProductss() async {
    try {
      Response response =
          await apiManager.getData(endPoint: EndPoints.GET_ALL_PRODUCTS);
      ProductsModel productsModel = ProductsModel.fromJson(response.data);
      return Right(productsModel);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddToCartModel>> AddToCart(String id , String Token) async {
    try {
      Response response =
          await apiManager.postData(endPoint: EndPoints.CART, body: {"productId": id} , Token: Token);

      AddToCartModel addToCartModel = AddToCartModel.fromJson(response.data);
      return Right(addToCartModel);
     } catch (e) {
      return Left(RemoteFailures(e.toString()));

    }
  }
}
