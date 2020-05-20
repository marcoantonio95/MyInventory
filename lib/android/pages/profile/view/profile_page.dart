import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:meuInventario/android/pages/authentication/controller/authController.dart';
import 'package:meuInventario/android/pages/profile/controller/profileController.dart';
import 'package:meuInventario/android/pages/util/controllers/themeController.dart';

  ProfileController profileController;

  ThemeController themeController;
  Widget _customAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.settings),
        onPressed: () {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Material(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Wrap(
            children: <Widget>[
              ListTile(
                title: Text('Apagar luz',
                textAlign: TextAlign.center),
                onTap: () => _changeToDarkMode(),
              ),
              Divider(),
              ListTile(
                title: Text('Sobre',
                textAlign: TextAlign.center),
                onTap: () => _neverSatisfied(context)
              ),
              Divider(),
              ListTile(
                title: Text('Sair',
                textAlign: TextAlign.center,
                style:  TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold
                  ),
                ),
                onTap: () => _signOut(context),
                ),
              ],
              ),
            );
          },
        );
      }
    )
  ],
  );
  }

  _changeToDarkMode(){
    themeController.changeData();
  }

  _signOut(BuildContext context) {
    try {
      AuthController authController = GetIt.I.get<AuthController>();
      authController.signOut().then((onValue){
        Navigator.popAndPushNamed(context, "/welcome");
      });

    } catch (e) {
      print(e);
    }
  }


Future<void> _neverSatisfied(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Sobre'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Este app tem o intuito de mostrar algumas funcionalidades do flutter'), //TODO: Correct the text
              Text('Versão: 1.0.0'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Fechar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  Widget _nameTextField(){
    return Observer(builder: (_) => 
     Text( profileController.name.isEmpty ? "Carregando..." : profileController.name,
      style: TextStyle(
        fontFamily: 'SourceSansPro',
        fontSize: 25,
      ),
    )
  );
  }


  Widget _emailCard(){
    return Observer(builder: (_) => 
     Card(
      margin:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: Icon(
          Icons.email,
        ),
        title: Text(
          profileController.email.isEmpty ? "Carregando..." : profileController.email,
          style:
              TextStyle(fontFamily: 'Roboto', fontSize: 20.0),
        ),
      )
    )
    );
  }

  Widget _phoneCard(){
     return Observer(builder: (_) => 
     Card(
      margin:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: Icon(
          Icons.phone,
        ),
        title: Text(
          profileController.phone.isEmpty ? "Carregando..." : profileController.phone,
          style:
              TextStyle(fontFamily: 'Roboto', fontSize: 20.0),
        ),
      )
      )
    );
  }

  Widget _sectorCard(){
    return Observer(builder: (_) => 
    Card(
      margin:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: Icon(
          Icons.work,
        ),
        title: Text(
          profileController.sector.isEmpty ? "Carregando..." : profileController.sector,
          style:
              TextStyle(fontFamily: 'Roboto', fontSize: 20.0),
        ),
        )
      )
    );
  }
class ProfilePage extends StatelessWidget {
  
 @override
  Widget build(BuildContext context) {
    themeController = GetIt.I.get<ThemeController>();
    profileController = GetIt.I.get<ProfileController>();
    profileController.getProfileInfos();
    return Scaffold(
      backgroundColor: Colors.red[700],
      appBar: _customAppBar(context), 
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
            ),
              SizedBox(
              height: 20.0,
            ),
            _nameTextField(),
            SizedBox(
              height: 20.0,
              width: 200,
            ),
            _emailCard(),
            _phoneCard(),
            _sectorCard()
              ],
          ),
        ),
      ),
    );
  }

}
