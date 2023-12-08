import 'package:ecommerce/Features/signup/domain/entities/UserEntity.dart';
import 'package:ecommerce/Features/signup/domain/repository/Signup_repo.dart';

import '../data_sources/remote_data_source/remote_ds.dart';
import '../model/Reqquest_Model.dart';

class SignupRepImplementation implements SignupRep{
  SignupRemoteDs remoteDs;


  SignupRepImplementation(this.remoteDs);

  @override
  Future<UserEntity> signup(RequestModel requestModel) {
    try{

      return remoteDs.signup(requestModel);
    }catch(e)
    {

      throw Exception();
    }

  }

}