part of 'sign_up_bloc.dart';
// this class contains all the events i will make or all the actions the user will make in the signup class
@immutable
abstract class SignUpEvent {}

class SignUpFetchEvent extends SignUpEvent {}

class SignUpButtonClick extends SignUpEvent{}

// class SignUpPostEvent extends SignUpEvent {}

