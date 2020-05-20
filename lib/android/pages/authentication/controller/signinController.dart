
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:meuInventario/android/pages/authentication/controller/authController.dart';
import 'package:rxdart/subjects.dart';

part 'signinController.g.dart';
class SignInController = SignInControllerBase with _$SignInController;

abstract class SignInControllerBase with Store{
  //TODO: Make object of listenner
  BehaviorSubject<bool> _loadingController = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<String> _resultController = BehaviorSubject<String>.seeded("");
  Stream<bool> outputLoading;
  Stream<String> outputResult;
  Sink<bool> inputLoading;
  Sink<String> inputResult;

  //TODO: USE MOBX NOT RX
  //TODO: SECURITY WARNING
  //Current infos 
  String _currentEmail;
  String get currentEmail => getCurrentEmail(); 
  String _currentPassword;
  String get currentPassword => getCurrentPassword(); 

  configStreams(){
    outputLoading = _loadingController.stream;
    inputLoading = _loadingController.sink;
    outputResult = _resultController.stream;
    inputResult = _resultController.sink;
  }

  setCurrentInfo(String email, String password){
    _currentEmail = email;
    _currentPassword = password;
  }

  getCurrentEmail(){
    return _currentEmail;
  }

  getCurrentPassword(){
    return _currentPassword;
  }

  signIn(){
    final authController = GetIt.I.get<AuthController>();
      authController.signIn();
  }

    resultCallback(String result,bool show){
       print("callback signIn $result $show");

       setLoading(show);
       setResult(result);
    }

    setLoading(bool show){
      inputLoading.add(show);
    }

    setResult(String result){
      inputResult.add(result);
    }

    dispose(){
      _loadingController.close();
      _resultController.close();
    }

}