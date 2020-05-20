import 'package:mobx/mobx.dart';

part 'account.g.dart';

class Account = AccountBase with _$Account;

abstract class AccountBase with Store {

  @observable
  String name; 
  changeName(String newName) => name = newName;

  @observable
  String email;
  changeEmail(String newEmail) => email = newEmail;

  @observable
  String password;
  changePassword(String newPassword) => password = newPassword;

  @observable
  String sector;
  changeSector(String newSector) => sector = newSector;

  @observable
  String phone;
  changePhone(String newPhone) => phone = newPhone;


}