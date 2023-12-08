import 'package:dartz/dartz.dart';
import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/home/domain/entites/ProductsEntity.dart';

import 'package:ecommerce/Features/home/domain/repository/Home_repo.dart';

class GetAllProductsUseCase{

    HomeRepo homeRepo;

    GetAllProductsUseCase(this.homeRepo);

    Future<Either<Failures,ProductsEntity>>call()=>homeRepo.GetAllProducts();


}