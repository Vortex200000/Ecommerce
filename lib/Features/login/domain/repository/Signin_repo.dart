import 'package:dartz/dartz.dart';
import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/login/data/model/Request_model.dart';
import 'package:ecommerce/Features/signup/domain/entities/UserEntity.dart';

abstract class SignInRep{

  Future<Either<UserEntity , Failures>>Signin(LoginRequestModel loginRequestModel);
}