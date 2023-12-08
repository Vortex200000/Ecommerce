import 'package:dartz/dartz.dart';
import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/login/data/model/Request_model.dart';
import 'package:ecommerce/Features/signup/data/model/UserMode.dart';

abstract class LoginRemoteDs{

Future<Either<UserMode , Failures>> SignIn(LoginRequestModel loginrequestModel);
}