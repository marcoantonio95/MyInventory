

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:meuInventario/android/pages/inventory/controller/inventoryController.dart';

class AddDialog extends StatelessWidget {
  
  const AddDialog({Key key, context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("Construiu do WIdget");
    inventoryController = GetIt.I.get<InventoryController>();
    addDialog(context);
  }

}
BuildContext context;
InventoryController inventoryController;

 Widget _textField({String title,onChanged, String Function() errorText}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$title:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              onChanged: onChanged,
              keyboardType: title == "Nome" ? TextInputType.text : TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true,
                  errorText: errorText == null ? null : errorText()
                  )
                )
        ],
      ),
    );
  }

  Widget _textaArea({String title,onChanged, String Function() errorText}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$title:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: onChanged,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true,
                  errorText: errorText == null ? null : errorText()
                  )
                )
        ],
      ),
    );
  }

  Widget _sectorDropDown({onChanged}) {
     inventoryController.newItem.changeWear(inventoryController.wearList.first);
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: new BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Selecione o estado:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          DropdownButton<String>(
            isExpanded: true,
             items : inventoryController.wearList.map((String dropDownStringItem) {
               return DropdownMenuItem<String>(
                 value: dropDownStringItem,
                 child: Text(dropDownStringItem),
                );
             }).toList(),
             
             onChanged: ( String novoItemSelecionado) {
              inventoryController.newItem.changeWear(novoItemSelecionado);
             },
             value: inventoryController.newItem.wear == null? inventoryController.wearList.first : inventoryController.newItem.wear
           )
        ],
      ),
    );
  }

//TODO: Reatividade  
   Widget _formWidget() {
    return Column(
      children: <Widget>[
        Observer(builder: (_){
          return  _textField(title: "Nome",
          errorText: inventoryController.validateName,
          onChanged: inventoryController.newItem.changeName,
          );
        },),
    
        Observer(builder: (_){
          return  _textField(title: "Quantidade",
          errorText: inventoryController.validateQuantity,
          onChanged: inventoryController.newItem.changeQuantity,
          );
        },),

        Observer(builder: (_){
          return  _textaArea(title: "Descrição: (Opcional)",
          onChanged: inventoryController.newItem.changeDescription,
          );
        },),
      
       _sectorDropDown()
      
      ],
    );
  }

  hideLoading(){
    print("Fechou");
    Navigator.pop(context);
  }



//TODO: Deixar esse loading mais bonito // Fechar o popUP e depois atualizar a
  Widget _showForm2(BuildContext context){
    return AlertDialog (
        title: Text('Adicionar ao Inventário:'),
        content: 
        Observer(builder: (_){
        return inventoryController.isLoading ? 
        SpinKitThreeBounce(color: Colors.red, size: 50,) :
        SingleChildScrollView(
        child: _formWidget());
        }),   
        actions: 
        inventoryController.isLoading ? [] : <Widget>[
          FlatButton(
            child: Text('Fechar'),
            onPressed: () {
              Navigator.pop(context);}),
          FlatButton(
            child: Text('Adicionar'),
            onPressed: inventoryController.isValid ? (){
              inventoryController.addItem();
            print("St2 ${inventoryController.isLoading}");
           } : null,
          )
        ],
      );
  }

  addDialog(BuildContext context){
    
    inventoryController.setNewItem();
  return  
    showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return 
      Observer(builder: (_){
        return _showForm2(context);
      });
    },
  );
}


