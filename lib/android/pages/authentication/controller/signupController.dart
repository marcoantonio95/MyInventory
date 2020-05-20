import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meuInventario/android/pages/authentication/controller/authController.dart';
import 'package:meuInventario/android/pages/authentication/model/account.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mobx/mobx.dart';
part 'signupController.g.dart';

class SignUpController = SignupControllerBase with _$SignUpController;

abstract class SignupControllerBase with Store {

  @observable
  var account = Account();

  List<String> get sectors => getSectorList();

  BuildContext context;

  //TODO: REMOVE RX
  BehaviorSubject<bool> _loadingController;
  BehaviorSubject<String> _resultController;
  Stream<bool> outputLoading;
  Stream<String> outputResult;
  Sink<bool> inputLoading;
  Sink<String> inputResult;

  configStreams(){
    _loadingController = BehaviorSubject<bool>.seeded(false);
    _resultController = BehaviorSubject<String>.seeded("");
    outputLoading = _loadingController.stream;
    inputLoading = _loadingController.sink;
    outputResult = _resultController.stream;
    inputResult = _resultController.sink;
  }

  getSectorList(){
    var sectors =['Administrativo','Engenharia','T.I','Ambulatório','Segurança','Manutenção'];
    return sectors;
  }

  String validateUsername(){
    if (account.name == null){
      return "Este campo é obrigatório.";
    } else if (account.name.length < 3){
      return "Deve conter no minimo 3 caracteres.";
    }
    return null;
  }

  String validatePassword(){
     if (account.password == null){
      return "Este campo é obrigatório.";
    } else if (account.password.length <= 5){
      return "Deve conter no minimo 6 caracteres.";
    }
    return null;
  }

  String validateEmail(){
    if (account.email == null){
      return "Este campo é obrigatório.";
    } else if (!account.email.contains("@") || !account.email.contains(".")){
      return "Este não é um email válido.";
    }
    return null;
  }

  String validatePhone(){
    if (account.phone == null){
      return "Este campo é obrigatório.";
    } 

    return null;
  }

   String validateSector(){
    if (account.sector == null){
      return "Este campo é obrigatório.";
    } 
    return null;
  }

    signup(){

      if (validateUsername() == null || validateEmail() == null || validatePassword() == null || validatePhone() == null || validateSector() == null){
        final authController = GetIt.I.get<AuthController>();
        authController.signUp();
      }
    }

    resultCallback(String result,bool show){
       if(result == "Sucesso" && show == false){
         Navigator.popAndPushNamed(context, "/home");
       } else if (result != "Sucesso" && show == false){
        setLoading(show);
        setResult(result);
       }
    }

    setLoading(bool show){
      inputLoading.add(show);
    }

    setResult(String result){
      inputResult.add(result);
    }

    dispose(){
      inputLoading.close();
      inputResult.close();
      _loadingController.close();
      _resultController.close();
      account = new Account();
    }
}