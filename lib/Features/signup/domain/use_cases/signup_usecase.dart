import 'package:ecommerce/Features/signup/domain/entities/UserEntity.dart';
import 'package:ecommerce/Features/signup/domain/repository/Signup_repo.dart';

import '../../data/model/Reqquest_Model.dart';

class SignupUseCase{
  SignupRep signupRep;

  SignupUseCase(this.signupRep);

  Future<UserEntity> call(RequestModel requestModel)=>signupRep.signup(requestModel);
}