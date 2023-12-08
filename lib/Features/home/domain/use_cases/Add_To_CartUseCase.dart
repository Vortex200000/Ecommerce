import 'package:dartz/dartz.dart';
import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/home/data/model/AddToCartModel.dart';
import 'package:ecommerce/Features/home/domain/repository/Home_repo.dart';

class AddToCartUseCase{
HomeRepo homeRepo;

AddToCartUseCase(this.homeRepo);

Future<Either<Failures, AddToCartModel>>call(String id , String Token)=>homeRepo.AddToCart(id, Token);

}