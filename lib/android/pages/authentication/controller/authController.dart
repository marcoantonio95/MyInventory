

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:meuInventario/android/pages/authentication/controller/signinController.dart';
import 'package:meuInventario/android/pages/authentication/controller/signupController.dart';

part 'authController.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {

FirebaseAuth get firebaseAuth => getAuthInstance();

Firestore get databaseReference => _getDatabaseReference();


@action
Future<FirebaseUser> getCurrentUser() async{
  Future<FirebaseUser> user =  firebaseAuth.currentUser();
  return user;
}

@action
getAuthInstance(){
  return FirebaseAuth.instance;
}

@action
_getDatabaseReference(){
  return Firestore.instance;
}

@action
 Future signIn() async {
   final signInController = GetIt.I.get<SignInController>();
   FirebaseAuth _firebaseAuth = firebaseAuth;

  _firebaseAuth.signInWithEmailAndPassword(
  email: signInController.getCurrentEmail(), password: signInController.getCurrentPassword()).then((result){
    signInController.resultCallback("Sucesso", false);
  }).catchError((error){
    var errorMessage = "";
      switch (error.code) {
      case "ERROR_INVALID_EMAIL":
        errorMessage = "O seu endereço de email parece estar incorreto.";
      break;
      case "ERROR_WRONG_PASSWORD":
        errorMessage = "Sua senha está incorreta.";
        break;
      case "ERROR_USER_NOT_FOUND":
        errorMessage = "O usuário com este email não existe.";
        break;
      case "ERROR_USER_DISABLED":
        errorMessage = "O usuário com este email foi desativado.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        errorMessage = "Muitas requisições. Tente mais tarde.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        errorMessage = "O login com email e senha não está ativado.";
        break;
      default:
        errorMessage = "Ocorreu um erro inesperado, tente novamente mais tarde.";
            }
        debugPrint(errorMessage);
        signInController.resultCallback(errorMessage, false);
      }
    );
  }

  @action
  Future signUp() async {
  final controller = GetIt.I.get<SignUpController>();
  FirebaseAuth _firebaseAuth = firebaseAuth;

    await _firebaseAuth.createUserWithEmailAndPassword(
    email: controller.account.email, password: controller.account.password).then( (result){
        createProfile(result.user, controller);
    }).catchError((error){
      var errorMessage = "";
    switch (error.code) {
        case "ERROR_OPERATION_NOT_ALLOWED":
        errorMessage = "Contas anônimas não estão ativadas.";
        break;
      case "ERROR_WEAK_PASSWORD":
        errorMessage = "Sua senha é muito fraca.";
        break;
      case "ERROR_INVALID_EMAIL":
        errorMessage = "Seu email não é válido.";
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        errorMessage = "O email já está sendo usado em uma outra conta.";
        break;
      case "ERROR_INVALID_CREDENTIAL":
        errorMessage = "Email ou senha inválida.";
        break;
      default:
       errorMessage = "Ocorreu um erro inesperado, tente novamente mais tarde.";
    }
    debugPrint(errorMessage);
    controller.resultCallback(errorMessage, false);
    });
  }

  @action
  Future createProfile(FirebaseUser user,SignUpController controller) async {
    Firestore _databaseReference = databaseReference;
    await _databaseReference.collection("users")
      .document(user.uid)
      .setData({
        'email': controller.account.email,
        'name': controller.account.name,
        'phone': controller.account.phone,
        'sector': controller.account.sector,
        'uid': user.uid
      }).then( (docRed){
        controller.resultCallback("Sucesso", false);
      }).catchError((error){
        controller.resultCallback("Ocorreu um erro inesperado, tente novamente.", false);
      });
  }

  @action
  Future signOut() async{
    FirebaseAuth _firebaseAuth = firebaseAuth;
    _firebaseAuth.signOut();
  }

}