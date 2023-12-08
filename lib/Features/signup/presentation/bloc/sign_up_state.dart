part of 'sign_up_bloc.dart';

enum ScreenState { init, loading, sucess, failure }

@immutable
class SignUpState {
  ScreenState? screenState;
  UserEntity? entity;
  Failures? failures;

  SignUpState({this.screenState, this.entity, this.failures});

  SignUpState copwith(
      {UserEntity? userEntity, ScreenState? screenState, Failures? failures}) {
    return SignUpState(
        screenState: screenState ?? this.screenState,
        entity: userEntity ?? entity,
        failures: failures ?? this.failures);
  }
}

class SignUpInitial extends SignUpState {

  SignUpInitial():super(
      screenState: ScreenState.init

  );
}

// class SignUpFetchingState extends SignUpState {}
//
// class SignUpFetchingFailureState extends SignUpState {
// final String message;
//
//   SignUpFetchingFailureState(this.message);
// }
//
// class SignUpFetchingSuccessState extends SignUpState {
//   final List<SignUpModel> response;
//     SignUpFetchingSuccessState(this.response);
//
//
// }
//
// class SignUpPostingState extends SignUpState {}
//
// class SignUpPostingFailureState extends SignUpState {
// final String message;
//
//   SignUpPostingFailureState(this.message);
// }
//
// class SignUpPostingSuccessState extends SignUpState {
//   final List<SignUpModel> response;
//     SignUpPostingSuccessState(this.response);
//
// }
