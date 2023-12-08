import 'package:dartz/dartz.dart';
import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/login/data/model/Request_model.dart';
import 'package:ecommerce/Features/login/domain/repository/Signin_repo.dart';

import '../../../signup/domain/entities/UserEntity.dart';

class SignInUseCase{

  SignInRep signInRep;


  SignInUseCase(this.signInRep);

  Future<Either<UserEntity , Failures>> call(LoginRequestModel loginRequestModel) => signInRep.Signin(loginRequestModel);
}