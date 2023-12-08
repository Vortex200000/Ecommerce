import 'package:dio/dio.dart';
import 'package:ecommerce/Core/api/api_manager.dart';
import 'package:ecommerce/Core/api/end_points.dart';
import 'package:ecommerce/Features/signup/data/data_sources/remote_data_source/remote_ds.dart';
import 'package:ecommerce/Features/signup/data/model/UserMode.dart';

import '../../model/Reqquest_Model.dart';

class SignUpRemoteDsImplemntation implements SignupRemoteDs{
  ApiManager apiManager;

  SignUpRemoteDsImplemntation(this.apiManager);

  @override
  Future<UserMode> signup(RequestModel requestModel) async{
    try{

      Response response = await apiManager.postData(endPoint: EndPoints.SIGNUP_END_POINT, body: requestModel.ToJason());

      UserMode userMode = UserMode.fromJson(response.data);
      return userMode;

    }catch(e){

      throw Exception();
    }
  }
    

}