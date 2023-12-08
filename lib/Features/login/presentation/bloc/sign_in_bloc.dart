import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/Core/api/api_manager.dart';
import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/login/data/data_source/Local_ds/Local_ds.dart';
import 'package:ecommerce/Features/login/data/data_source/Local_ds/Local_ds_impl.dart';
import 'package:ecommerce/Features/login/data/data_source/RemoteDs/Remote_ds.dart';
import 'package:ecommerce/Features/login/data/data_source/RemoteDs/Remote_ds_impl.dart';
import 'package:ecommerce/Features/login/data/model/Request_model.dart';
import 'package:ecommerce/Features/login/data/repository/Signin_repo_implemintation.dart';
import 'package:ecommerce/Features/login/domain/repository/Signin_repo.dart';
import 'package:ecommerce/Features/login/domain/use_cases/Signin_usecase.dart';
import 'package:ecommerce/Features/signup/domain/entities/UserEntity.dart';
import 'package:ecommerce/Features/signup/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  SignInBloc() : super(SignInInitial()) {

    on<SignInEvent>((event, emit) async {
      if (event is LoginButtonClick) {
        emit(state.CopyWith(loginstate: ScreenState.loading));

        ApiManager apiManager = ApiManager();
        LoginRemoteDs loginRemoteDs = Login_Remote_ds_impl(apiManager);
        Loginlocalds loginlocalds = LoginLocaldsimpl();
        SignInRep signInRep = SignInRepoImpl(loginRemoteDs, loginlocalds);
        SignInUseCase signInUseCase = SignInUseCase(signInRep);

        LoginRequestModel loginRequestModel = LoginRequestModel(
            email: EmailController.text, password: PasswordController.text);

        var result = await signInUseCase.call(loginRequestModel);

        result.fold((l) {
          emit(state.CopyWith(loginstate: ScreenState.sucess , loginuser: l));
        }, (r) {

          emit(state.CopyWith(loginstate: ScreenState.failure , loginFail: RemoteFailures(r.toString())));

        });

        // try {
        //
        //
        // } catch (e) {
        //
        //
        //
        // }
      }
    });
  }
}
