import 'package:ecommerce/Features/signup/domain/entities/UserEntity.dart';

class UserMode extends UserEntity {
  UserMode({
      this.message, 
      super.user,
      super.token,});

  UserMode.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDataModel.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;

  @override
  // TODO: implement props
  List<Object?> get props => [super.props , message];


}

class UserDataModel extends UserDataEntity {
  UserDataModel({
      super.name,
      super.email,
      this.role,});

  UserDataModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;

  @override
  // TODO: implement props
  List<Object?> get props => [super.props , role];


}