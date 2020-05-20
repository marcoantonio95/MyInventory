import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:meuInventario/android/pages/inventory/model/item.dart';
import 'package:meuInventario/android/pages/util/controllers/databaseController.dart';
part 'inventoryController.g.dart';

class InventoryController = _InventoryControllerBase with _$InventoryController;

abstract class _InventoryControllerBase with Store {
  
  List<String> get wearList => getWearList();

  DatabaseController get _databaseController => _getDatabaseInstance();

  @observable
  var newItem = new Item();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Item> listItem = new ObservableList<Item>();

  String _sector;

  @observable
  bool showSearch = false;

  @observable
  String filter = "";

  @computed
  bool get isValid {
    return validateName() == null && validateQuantity() == null;
  }

  @computed
  List<Item> get listFiltered {
    if(filter.isEmpty){
      return listItem;
    } else {
      return listItem.where((item) => item.name.toLowerCase().contains(filter)).toList();
    }
  }

  _getDatabaseInstance(){
     final databaseController = GetIt.I.get<DatabaseController>();
    return databaseController;
  }

  @action
  setLoading(bool newStatus) => isLoading = newStatus;

  @action
  changeFilter(String newFilter) => filter = newFilter;

  @action
  setSearch(bool newSearch) => showSearch = newSearch;

  @action
  setNewItem(){
    newItem = new Item();
  }

  @action
  getInventoryItens(String sector){
    _sector = sector;
    final databaseController = _databaseController;
    databaseController.getInventoryItens(sector);
    
  }

  @action
  refreshList(){
    listItem = new ObservableList<Item>();
    getInventoryItens(_sector);
  }

  @action
  removeItem(Item newItem) async{
    var index = listItem.indexWhere((itemAux) => itemAux.code == newItem.code);

    listItem.removeAt(index);
  }

  @action
  addItem() async {
     setLoading(true);
   var currentIndex = await _databaseController.getCurrentCode().then( (currentIndex){
     isLoading = false;
    var text = currentIndex.replaceFirst("#", "");
    int index = ((int.parse(text))+1);

    _databaseController.addItem(index).then((onValue){

      print("Item adicionado com sucesso");
       setLoading(false);
    });
   });
  }
  
  @action
  addOrUpdateItem(Item newItem){
  var contains = listItem.firstWhere((item) => item.code == newItem.code, orElse: () => null);

  if (contains == null) {
    getItem(newItem);
  } else {
    var index = listItem.indexWhere((itemAux) => itemAux.code == newItem.code);
    var oldItem = listItem.elementAt(index);

  if(oldItem.name != newItem.name || oldItem.quantity != newItem.quantity || oldItem.description != newItem.description || oldItem.wear != newItem.wear ){
    updateItem(index,newItem);
    }
  } 
  
  }

  @action
  getItem(Item item){
    listItem.add(item);
  }

  @action
  updateItem(int index ,Item itemUpdate){
    listItem.removeAt(index);
    listItem.insert(index, itemUpdate);
  }

  @action
  getWearList(){
    var wearList =['Novo','Mais ou menos','Velho'];
    return wearList;
  }

  String validateName(){
    if (newItem.name == null){
      return "Este campo é obrigatório.";
    } else if (newItem.name == "") {
      return "Este campo é obrigatório.";

    } else if (newItem.name.length < 3){
      return "Deve conter no minimo 3 caracteres.";
    }
    return null;
  }

  String validateQuantity(){
     if (newItem.quantity == null){
      return "Este campo é obrigatório.";
    } else if (newItem.quantity == "") {
      return "Este campo é obrigatório.";
    }
    return null;
  }

  
}