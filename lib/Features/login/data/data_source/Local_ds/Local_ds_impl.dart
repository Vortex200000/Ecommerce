import 'package:ecommerce/Core/cache/shared_pref.dart';
import 'package:ecommerce/Features/login/data/data_source/Local_ds/Local_ds.dart';

class LoginLocaldsimpl implements Loginlocalds {
  @override
  cacheToken(String Token) {
    SharedPreff.SaveToken(Data: Token, Key: "token");
  }

  @override
  getToken() {
SharedPreff.GetToken(Key: "token");
  }
}
