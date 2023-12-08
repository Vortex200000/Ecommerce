import 'package:ecommerce/Features/signup/data/model/Reqquest_Model.dart';
import 'package:ecommerce/Features/signup/domain/entities/UserEntity.dart';

abstract class SignupRep{
// this is the sign up reposetory which hold all the functions of use cases i have in my signup page
// this class is an apstract class which only hold the intialization and the names of the function i will use in
// my use cases this function should be implemnted in the signup/data/repository/signup_repo_implemitation
// which will implement the fucnction
// important note** in every use case class that belong to the sign_up page an opject of SignupRep class
// must be intialized and must be taken in the constructor
// the function calling from SignupRep is mad in the usecase class which will have call() arrow function
// that will call the fucntion i need from the opject taken from the SignipRep class
  Future<UserEntity>signup(RequestModel requestModel);
}