import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/Core/api/api_manager.dart';
import 'package:ecommerce/Core/api/end_points.dart';
import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/login/data/data_source/RemoteDs/Remote_ds.dart';
import 'package:ecommerce/Features/login/data/model/Request_model.dart';
import 'package:ecommerce/Features/signup/data/model/UserMode.dart';

class Login_Remote_ds_impl implements LoginRemoteDs {
  ApiManager apiManager;

  Login_Remote_ds_impl(this.apiManager);

  @override
  Future<Either<UserMode, Failures>> SignIn(
      LoginRequestModel loginrequestModel) async {
    try {
      Response response = await apiManager.postData(
          endPoint: EndPoints.SIGN_IN, body: loginrequestModel.tojson());
      UserMode userMode = UserMode.fromJson(response.data);
      return Left(userMode);
    } catch (e) {
      return Right(RemoteFailures(e.toString()));
    }
  }
}
