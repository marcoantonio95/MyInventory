import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:meuInventario/android/pages/authentication/controller/authController.dart';
import 'package:meuInventario/android/pages/profile/model/profile.dart';
import 'package:meuInventario/android/pages/util/controllers/databaseController.dart';
part 'profileController.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
 
  DatabaseController get databaseController => _getDatabaseInstance();
  AuthController get _authController => _getAuthInstance();
  Profile _foundProfile;
  Profile get _currentProfile => _getCurrentProfile();

  @observable
  String name = "Carregando...";
  @observable
  String email = "Carregando...";
  @observable
  String phone = "Carregando...";
  @observable
  String sector = "Carregando...";
  @observable
  String uid = "Carregando...";

  @action
  _setName(String newNome) => name = newNome;
  @action
  _setEmail(String newEmail) => email = newEmail;
  @action
  _setPhone(String newPhone) => phone = newPhone;
  @action
  _setSector(String newSector) => sector = newSector;
  @action
  _setUid(String newUid) => uid = newUid;

  @action
  _getDatabaseInstance(){
    return GetIt.I.get<DatabaseController>();
  }

  @action
  _getAuthInstance(){
    return GetIt.I.get<AuthController>();
  }
   
  @action
  _getCurrentProfile(){
    return _foundProfile;
  }

  @action
  _setCurrentProfile(Profile newProfile){
    _foundProfile = newProfile;
  } 

  getProfileInfos() async {
    String uid = "";
    await _authController.getCurrentUser().then((fireUser) {
      if(fireUser.uid != null){
        uid = fireUser.uid;
      _setProfile(uid);
      }
    });
  }

  _setProfile(String uid) async{
    await databaseController.getProfile(uid).then((profile){
        _setProfileInfos(profile);
      });
  }

  _setProfileInfos(Profile newProfile){
    Profile currentProfile = _currentProfile;
    if (currentProfile == null){
      _setCurrentProfile(newProfile);
      _setProfileTextFields();
    } else if (currentProfile != newProfile){
      _setCurrentProfile(newProfile);
      _setProfileTextFields();
    }
  }

  _validateProfile(Profile profileInvalid){
    if(profileInvalid.name.isNotEmpty ||profileInvalid.email.isNotEmpty ||profileInvalid.phone.isNotEmpty ||profileInvalid.sector.isNotEmpty ||profileInvalid.uid.isNotEmpty){
      return true;
    } else {
      return false;
    }
  }

  _setProfileTextFields(){
    Profile profileAux = _currentProfile;
    if(_validateProfile(profileAux)){
    _setName(profileAux.name);
    _setEmail(profileAux.email);
    _setPhone(profileAux.phone);
    _setSector(profileAux.sector);
    _setUid(profileAux.uid);
    }
  }

}