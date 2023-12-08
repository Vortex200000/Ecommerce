import 'package:dartz/dartz.dart';
import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/home/data/model/get_all_categoreys.dart';
import 'package:ecommerce/Features/home/domain/entites/CategorAndBrandsEntity.dart';
import 'package:ecommerce/Features/home/domain/repository/Home_repo.dart';

class Getallcatusecase {
    HomeRepo homeRepo;

    Getallcatusecase(this.homeRepo);

    Future<Either<Failures , CategorAndBrandsEntity>>call()=>homeRepo.GetAllCat();

}