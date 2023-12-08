import 'package:dartz/dartz.dart';
import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/login/data/data_source/RemoteDs/Remote_ds.dart';
import 'package:ecommerce/Features/login/data/model/Request_model.dart';
import 'package:ecommerce/Features/login/domain/repository/Signin_repo.dart';
import 'package:ecommerce/Features/signup/domain/entities/UserEntity.dart';
import 'package:ecommerce/Features/login/data/data_source/Local_ds/Local_ds.dart';


class SignInRepoImpl implements SignInRep {
  LoginRemoteDs loginRemoteDs;
  Loginlocalds loginlocalds;


  SignInRepoImpl(this.loginRemoteDs , this.loginlocalds);

  @override
  Future<Either<UserEntity, Failures>> Signin(
      LoginRequestModel loginRequestModel) async{

      var res = await loginRemoteDs.SignIn(loginRequestModel);
      res.fold((l) => {

        loginlocalds.cacheToken(l.token??"")

      }, (r) => {});

      return res;

  }
}
