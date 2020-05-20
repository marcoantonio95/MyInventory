import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:meuInventario/android/pages/inventory/controller/inventoryController.dart';
import 'package:meuInventario/android/pages/inventory/model/inventory_item.dart';
import 'package:meuInventario/android/pages/inventory/view/addDialog.dart';
import 'package:meuInventario/android/pages/profile/controller/profileController.dart';
import 'package:meuInventario/android/pages/util/controllers/themeController.dart';

class InventoryPage extends StatelessWidget {
  final profileController = GetIt.I.get<ProfileController>();
  final inventoryController = GetIt.I.get<InventoryController>();
  final themeController = GetIt.I.get<ThemeController>();

  Widget _defaultAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: themeController.themeData.accentColor,
    elevation: 0,
    centerTitle: true,
    title: Text("Inventário",textAlign: TextAlign.center),
    leading: IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        _filterDialog(context);
      }
    ),
    actions: <Widget>[
      IconButton(
      icon: Icon(Icons.add),
      onPressed: () => AddDialog(context: context).build(context)
    )
  ],
  );
  }

Widget _textField({String title,onChanged}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                  labelText: "",
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true,
                  )
                )
        ],
      ),
    );
  }

Future<void> _filterDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Filtrar',textAlign: TextAlign.center),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Observer(builder: (_){
                return  _textField(title: "",
                onChanged: inventoryController.changeFilter,
                );
              },)
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(onPressed: (){
            inventoryController.changeFilter("");
             Navigator.of(context).pop();
          }, child: Text("Limpar")),
          RaisedButton(
            child: Text('Filtrar!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    inventoryController.getInventoryItens(profileController.sector);
    return Scaffold(
      appBar: _defaultAppBar(context),
      body: inventoryController.listFiltered != null ?
      Observer(builder: (_){
        return        
        ListView.builder(
        itemCount: inventoryController.listFiltered.length,
        itemBuilder: (_, index){
          var item = inventoryController.listFiltered[index];
          return ItemInventory(item: item);
        });
      }) : Text("Carregando")
    );
  }
}
