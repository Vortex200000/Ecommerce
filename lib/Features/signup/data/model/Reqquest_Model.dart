import 'package:equatable/equatable.dart';

class RequestModel extends Equatable{ // equataple removes the redundancy
  String name;
  String email;
  String password;
  String phone;

  RequestModel({required this.name, required this.email, required this.password, required this.phone});

   Map<String , dynamic>ToJason(){
    return {

        "name": name,
        "email": email,
        "password": password,
        "rePassword": password,
        "phone":phone

    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name , email , password , phone];
}