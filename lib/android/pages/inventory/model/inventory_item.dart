
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:meuInventario/android/pages/inventory/controller/inventoryController.dart';
import 'package:meuInventario/android/pages/inventory/model/item.dart';
import 'package:meuInventario/android/pages/util/controllers/databaseController.dart';
import 'package:meuInventario/android/pages/util/controllers/qrController.dart';

class ItemInventory extends StatelessWidget{

  final Item item;

  const ItemInventory({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_){
      return ListTile(
      title: Text(item.name.isNotEmpty ? "${item.quantity}x ${item.name}" : "Carregando..."),
      subtitle: Text(item.code.isNotEmpty ? item.code : "Carregando..." ),
      trailing: Wrap(
      children: <Widget>[
        IconButton(
        icon:Icon(Icons.info),
        onPressed: (){_detailsDialoag(context, item);}
        ),
        ],
      ),
    )  ;
    });
  }
  
}
String sector;
bool showQr = false;

//TODO: Transformar isso em uma class pq usa na home tbm
 _detailsDialoag(BuildContext context, Item item){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return 
        Observer(builder: (_){
          return AlertDialog (
          title: Text('Detalhes:',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
          backgroundColor: Colors.red[700],
          content: 
          Observer(builder: (_){
          return 
          SingleChildScrollView(
          child: showQr ? _formQrcode : _formWidget(item,context));
          }),   
        );
        });
      },
    );
  }

   Widget _formWidget(Item item,BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("${item.code}",textAlign: TextAlign.left,),
         _itemCard("Nome:",item.name),
        _itemCard("Quantidade:",item.quantity),
        _itemCard("Descrição:",item.description),
        _creatorCard(item.creator,item.time),
        _showQRButton(context,item),
        _deleteButton(context,item),
        _closeButton(context)
      ],
    );
  }

   Widget _formQrcode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("QRCODE",textAlign: TextAlign.left,),
      ],
    );
  }


  Widget _itemCard(String name,String text){
      return Card(
        child: ListTile(
          title: Text(
            "$name $text",
            style:
                TextStyle(fontFamily: 'Roboto', fontSize: 15.0),
          ),
        )
      );
  }

  Widget _creatorCard(String creator, String time){
      return Card(
        child: ListTile(

          title: Text(
            "Criador:",
            textAlign: TextAlign.center,
            style:
                TextStyle(fontFamily: 'Roboto', fontSize: 15.0),
          ),
          subtitle: Text("${_getCreatorInfo(creator)[0]} ${_getCreatorInfo(creator)[1]} $time")
          ,
        )
      );
  }

  //TODO: MOBX PARA PARA O MESMO DIALOG
  _showQRButton(BuildContext context,Item item){
    return RaisedButton(
      onPressed: () {
        var qrController = GetIt.I.get<QrController>(); //TODO: Colocar na controller
        qrController.currentQrString = "inventories/$sector/inventory/${item.code}";
        print("O qr code atual é ${qrController.currentQrString}");
        Navigator.popAndPushNamed(context, "/generate");
      },
      child: const Text('Ver QrCode', style: TextStyle(fontSize: 16)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(05.0)),
    );
  }

  _deleteButton(BuildContext context,Item item){
    return RaisedButton(
      onPressed: () {
        var databaseController = GetIt.I.get<DatabaseController>();//TODO: Colocar na controller
        var inventoryController = GetIt.I.get<InventoryController>();//TODO: Colocar na controller
        var url = "inventories/$sector/inventory/${item.code}";
        databaseController.deleteItem(url).then((onValue){
          if(onValue == "Sucesso"){
            print("Item excluido com sucesso");
            inventoryController.removeItem(item).then((onValue){
              debugPrint("Removeu da lista offline");
              Navigator.pop(context);
            });
          }
        });
      },
      child: const Text('Apagar item', style: TextStyle(fontSize: 16)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(05.0)),
    );
  }

  _closeButton(BuildContext context){
    return FlatButton(
      onPressed: () {
        Navigator.pop(context)
      ;},
      child: const Text('Fechar', style: TextStyle(fontSize: 16)),
    );
  }

   _getCreatorInfo(String info){
    
    var splittedText = info.split("/");
    sector = splittedText[1];
    return splittedText;
  }

