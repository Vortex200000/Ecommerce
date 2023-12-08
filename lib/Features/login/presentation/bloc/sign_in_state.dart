part of 'sign_in_bloc.dart';

@immutable
class SignInState {
  ScreenState? signinstate;
  UserEntity? signinuserEntity;
  Failures? signinfailures;

  SignInState({this.signinstate, this.signinuserEntity, this.signinfailures});

  CopyWith(
      {ScreenState? loginstate, UserEntity? loginuser, Failures? loginFail}) {
    return SignInState(
        signinstate: loginstate ?? this.signinstate,
        signinuserEntity: loginuser ?? this.signinuserEntity,
        signinfailures: loginFail ?? this.signinfailures);
  }
}

class SignInInitial extends SignInState {
  SignInInitial() : super(signinstate: ScreenState.init);
}
