import 'package:dartz/dartz.dart';
import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/home/data/model/GetAllBrandsModel.dart';
import 'package:ecommerce/Features/home/domain/entites/CategorAndBrandsEntity.dart';
import 'package:ecommerce/Features/home/domain/repository/Home_repo.dart';

class GetAllBrandsUseCase{

  HomeRepo homeRepo;

  GetAllBrandsUseCase(this.homeRepo);

  Future<Either<Failures , CategorAndBrandsEntity>> Call()=>homeRepo.GetAllBrand();

}