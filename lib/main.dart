import 'package:bloc/bloc.dart';
import 'package:ecommerce/Core/cache/shared_pref.dart';
import 'package:ecommerce/Core/utils/observer.dart';
import 'package:ecommerce/My_App.dart';
import 'package:flutter/material.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
 await SharedPreff.init();
  String start;
  String ?token =  SharedPreff.GetToken(Key: "token");

  if(token == null)
    {
      start = "/";
    }
  else{
    start = "home";}
  runApp( MyApp(start));
}


