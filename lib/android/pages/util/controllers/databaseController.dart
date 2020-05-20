import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:meuInventario/android/pages/inventory/controller/inventoryController.dart';
import 'package:meuInventario/android/pages/inventory/model/item.dart';
import 'package:meuInventario/android/pages/profile/controller/profileController.dart';
import 'package:meuInventario/android/pages/profile/model/profile.dart';

part 'databaseController.g.dart';

class DatabaseController = _DatabaseControllerBase with _$DatabaseController;

abstract class _DatabaseControllerBase with Store {
  
  Firestore get _firestoreReference => _getDatabaseReference();

  InventoryController get _inventoryInstance => _getInventoryInstance();

  ProfileController get _profileInstance => _getProfileInstance();

  @action
  _getDatabaseReference(){
    return Firestore.instance;
  }

  @action
  _getInventoryInstance(){
    final inventoryInstance = GetIt.I.get<InventoryController>();
    return inventoryInstance;
  }

  @action
  _getProfileInstance(){
    final profileInstance = GetIt.I.get<ProfileController>();
    return profileInstance;
  }

  @action
  Future<Profile> getProfile(String uid) async {
    Profile newProfile;
     await Firestore.instance
        .collection("users")
        .document(uid)
        .get()
        .then((DocumentSnapshot ds) {

          newProfile = Profile(ds["name"], ds["email"], ds["sector"], ds["phone"], ds["uid"]);
          debugPrint("#Registro encontrado ${ds["uid"]}");
    });

      return newProfile;
  }

  @action
  getInventoryItens(String sector) async {
    var query = _getDatabaseReference().collection('inventories').document(sector).collection("inventory").getDocuments();
    await query.then((snap) {

      if (snap.documents.length > 0) {
        for (var doc in snap.documents) {
          var newItem = Item(code: doc["code"],name: doc["name"],quantity: doc["quantity"],description: doc["description"],wear: doc["wear"],creator: doc["creator"],time: doc["timeCreatted"]);
          _inventoryInstance.addOrUpdateItem(newItem);
        }
      }
    });
  }

  @action
  Future<String> getCurrentCode() async {
    String currentCode;
    await _firestoreReference.
        collection("inventories")
        .document(_profileInstance.sector)
        .get()
        .then((DocumentSnapshot ds) {
          debugPrint("#Code encontrado ${ds["currentCode"]}");
          currentCode = ds["currentCode"];
    });
    return currentCode;
  }

  @action
  Future<Item> detailItem(String url) async {
    Item currentItem;
    var urlSplitted = url.split("/"); //inventories/Ambulatório/inventory/#4

    await _firestoreReference.
        collection(urlSplitted[0])
        .document(urlSplitted[1])
        .collection(urlSplitted[2])
        .document(urlSplitted[3])
        .get()
        .then((DocumentSnapshot ds) {
          var newItem = Item(code: ds["code"],name: ds["name"],quantity: ds["quantity"],description: ds["description"],wear: ds["wear"],creator: ds["creator"],time: ds["timeCreatted"]);
          currentItem = newItem;
    });
    return currentItem;
  }

  @action
  Future<String> deleteItem(String url) async{
    var urlSplitted = url.split("/");
    var result = "";
    await _firestoreReference
        .collection(urlSplitted[0])
        .document(urlSplitted[1])
        .collection(urlSplitted[2])
        .document(urlSplitted[3]).delete().then((onResult){
          debugPrint("#Resultado: Sucesso no apagar");
          result = "Sucesso";

        }).catchError((onError){
          debugPrint("#Resultado: Erro no apagar");
          result = "Ocorreu um erro inesperado, tente novamente.";
        });
    return result;
  }

  @action
  addItem(int index) async{
    var now = new DateTime.now();
    var timeFormatted = "${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute}";
    await _firestoreReference.collection("inventories").document(_profileInstance.sector).collection("inventory")
    .document("#$index")
    .setData({
        'code': "#$index",
        'name': _inventoryInstance.newItem.name,
        'quantity': _inventoryInstance.newItem.quantity,
        'description': _inventoryInstance.newItem.description,
        'wear': _inventoryInstance.newItem.wear,
        'creator': ("${_profileInstance.email}/${_profileInstance.sector}"),
        'timeCreatted': timeFormatted
    }).then( (docRed){
        debugPrint("Sucesso");
        _updateCurrentCode("#$index");
    }).catchError((error){
        debugPrint("Ocorreu um erro inesperado, tente novamente.");
    });
  }
        
  _updateCurrentCode(String newCode) {
     _firestoreReference.
        collection("inventories")
        .document(_profileInstance.sector)
        .setData({
        'currentCode': newCode,
      });
  }


}