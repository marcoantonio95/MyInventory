import 'package:mobx/mobx.dart';

part 'item.g.dart';

class Item = ItemBase with _$Item;

abstract class ItemBase with Store {
  @observable
  ItemBase({this.code,this.name,this.quantity,this.wear,this.description,this.creator,this.time});

  @observable
  String code;
  changeCode(String newcode) => code = newcode;
  
  @observable
  String name; 
  changeName(String newName) => name = newName;

  @observable
  String quantity;
  changeQuantity(String newQuantity) => quantity = newQuantity;

  @observable
  String description;
  changeDescription(String newDescription) => description = newDescription;

  @observable
  String wear;
  changeWear(String newWear) => wear = newWear;

  @observable
  String creator;
  changeCreator(String newCreator) => creator = newCreator;

  @observable
  String time;
  changeTime(String newTime) => time = newTime;
}