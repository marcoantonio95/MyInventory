import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:meuInventario/android/pages/inventory/model/item.dart';
import 'package:meuInventario/android/pages/inventory/view/inventory_page.dart';
import 'package:meuInventario/android/pages/profile/view/profile_page.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:meuInventario/android/pages/util/controllers/databaseController.dart';
import 'package:meuInventario/android/pages/util/controllers/qrController.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  int _currentIndex = 1;
  String sector;
  bool showQr = false;
  final databaseController = GetIt.I.get<DatabaseController>(); //TODO: Colocar na homecontroller

  List<Widget> _tabList = [
    InventoryPage(),
    ProfilePage(),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length,initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

    Future scan() async {
    try {
      var result = await BarcodeScanner.scan();
      //setState(() => this.barcode = result.rawContent);
      if (result.rawContent != null){
          print("Resulta ${result.rawContent}");
          await databaseController.detailItem(result.rawContent).then((onValue){ //TODO: Colocar na homecontroller
            if (onValue != null){
              Item currentItem = onValue;
              print("O ITEM FOI ENCONTRA ${currentItem.name}");
              _detailsDialoag(context, currentItem);
            }
            
          });
      }
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        // setState(() {
        //   this.barcode = 'The user did not grant the camera permission!';
        // });
      } else {
        // setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      // setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      // setState(() => this.barcode = 'Unknown error: $e');
    }
  }

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
        var qrController = GetIt.I.get<QrController>();
        qrController.currentQrString = "inventories/$sector/inventory/${item.code}";
        Navigator.popAndPushNamed(context, "/generate");
      },
      child: const Text('Ver QrCode', style: TextStyle(fontSize: 16)),
      color: Colors.white,
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: _tabList,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (currentIndex){

          setState(() {
            _currentIndex = currentIndex;
          });
            _tabController.animateTo(_currentIndex);
        },
        items: [
          BottomNavigationBarItem(
            title: Text("Inventário"),
            icon: Icon(Icons.list),
          ),
      
          BottomNavigationBarItem(
            title: Text("Perfil"),
            icon: Icon(Icons.person)
          )
        ],
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
          // Navigator.pushNamed(context, "/scan");
          scan();
        },
        child: Icon(Icons.camera),
      )
    );
  }
}