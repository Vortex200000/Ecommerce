import 'package:ecommerce/Features/signup/data/model/UserMode.dart';

import '../../model/Reqquest_Model.dart';

abstract class SignupRemoteDs{
 Future<UserMode>signup(RequestModel requestModel);
}