import 'package:ecommerce/Core/api/api_manager.dart';
import 'package:ecommerce/Core/error/failures.dart';
import 'package:ecommerce/Features/signup/data/data_sources/remote_data_source/remote_ds.dart';
import 'package:ecommerce/Features/signup/data/data_sources/remote_data_source/remote_ds_implemntation.dart';
import 'package:ecommerce/Features/signup/data/model/Reqquest_Model.dart';
import 'package:ecommerce/Features/signup/data/repository/Signup_repo_implemintation.dart';
import 'package:ecommerce/Features/signup/domain/entities/UserEntity.dart';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/Features/signup/domain/repository/Signup_repo.dart';
import 'package:ecommerce/Features/signup/domain/use_cases/signup_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
    static  SignUpBloc  get(context)=>BlocProvider.of(context);
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is SignUpButtonClick) {
        emit(state.copwith(screenState: ScreenState.loading));

        ApiManager apiManager = ApiManager();

        SignupRemoteDs remoteDs = SignUpRemoteDsImplemntation(apiManager);

        SignupRep signUprep = SignupRepImplementation(remoteDs);
        SignupUseCase signupUseCase = SignupUseCase(signUprep);

        RequestModel requestModel = RequestModel(
            name: "Ahmed",
            email: "omaressam555555@gmail.com",
            password: "Amed@123",
            phone: "01010007000");
        try {
          UserEntity userEntity = await signupUseCase.call(requestModel);
          emit(state.copwith(
              screenState: ScreenState.sucess, userEntity: userEntity));
        } catch (e) {
          emit(state.copwith(
              screenState: ScreenState.failure,
              failures: RemoteFailures(e.toString())));
        }
      }
    });
  }
}
