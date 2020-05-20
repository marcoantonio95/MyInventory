import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:meuInventario/android/pages/authentication/controller/signupController.dart';
import 'package:meuInventario/android/pages/authentication/model/account.dart';
import 'package:meuInventario/android/pages/util/widget/loading_page.dart';

class SignUpPage extends StatefulWidget {
 
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var maskTextInputFormatter = MaskTextInputFormatter(mask: "+55 (##) 9####-####");
  final signupController = GetIt.I.get<SignUpController>();
  String _errorSignUp = "";
  var _itemSelecionado = 'Administrativo';
  bool _showLoading = false;

  @override
  void initState() {
    debugPrint("initiated ${this}");
    signupController.configStreams();
    super.initState();
  }

  @override
  void dispose() {
    debugPrint("Disposed ${this}");
    signupController.dispose();
    super.dispose();
  }

   Widget _instructionsWidget() {
   return Container(
        margin: EdgeInsets.only(top: 10, bottom: 20),
        child: Column(
          children: <Widget>[
            Text(
              'Acesso rápido com Touch ID',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(
              height: 20,
            ),
            Image(height: 150,width: 150, image: Image.asset('lib/assets/ic_register.png').image),
            SizedBox(
              height: 50,
            ),
            Text(
              'Insira seus dados:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ));
  }

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
Widget _textFieldPassword({onChanged, String Function() errorText}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Senha:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              onChanged: onChanged,
              obscureText: true,
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
 Widget _textFieldPhone({onChanged, String Function() errorText}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Telefone:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
             TextField(
              onChanged: onChanged,
              inputFormatters: [maskTextInputFormatter],
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true,
                  errorText: errorText == null ? null : errorText()
                  ),
             )
        ],
      ),
    );
  }

//Change on change to controler
Widget _sectorDropDown({onChanged}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: new BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Selecione o setor:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          DropdownButton<String>(
            isExpanded: true,
             items : signupController.sectors.map((String dropDownStringItem) {
               return DropdownMenuItem<String>(
                 value: dropDownStringItem,
                 child: Text(dropDownStringItem),
                );
             }).toList(),
             
             onChanged: ( String novoItemSelecionado) {
               _dropDownItemSelected(novoItemSelecionado);
             },
             value: _itemSelecionado
             
           )
        ],
      ),
    );
  }

 void _dropDownItemSelected(String novoItem){
       setState(() {
        this._itemSelecionado = novoItem;
        signupController.account.changeSector(this._itemSelecionado);
       });
   }

Widget _formWidget() {
    return Column(
      children: <Widget>[
        Observer(builder: (_){
          return  _textField(title: "Nome",
          errorText: signupController.validateUsername,
          onChanged: signupController.account.changeName,
          );
        },),
    
        Observer(builder: (_){
          return  _textField(title: "Email",
          errorText: signupController.validateEmail,
          onChanged: signupController.account.changeEmail,
          );
        },),

        Observer(builder: (_){
          return  _textFieldPassword(
          errorText: signupController.validatePassword,
          onChanged: signupController.account.changePassword
          );
        },),

        Observer(builder: (_){
          return  _textFieldPhone(onChanged: signupController.account.changePhone,
          errorText: signupController.validatePhone,
          );
        },),

       _sectorDropDown()
      ],
    );
  }


  Widget _submitWidget() {
    return InkWell(
      onTap: () {
        _register();
      },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.red,Colors.red])),
      child: Text(
        'Registrar-se',
        style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
      ),
      ),
     );
  }

  void _register() async {
  signupController.context = context;
  signupController.setLoading(true);
  signupController.signup();
  }

Widget _errorLabel(){
    signupController.outputResult.listen( (result){
        if(result != _errorSignUp){
          setState(() {
            _setError(result);
            _errorSignUp = result;
          });
        } 
    }) ;

    if (_errorSignUp != "" || _errorSignUp.isNotEmpty){
      return  Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Text(_errorSignUp,
        style:
        TextStyle(color: Colors.red),
      )
     );
    } else {
      return SizedBox(
        height: 1,
        );
      } 
  }

  _setError(String erro){
    signupController.account = new Account();
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Já possui uma conta ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.popAndPushNamed(context,"/login");
            },
            child: Text(
              'Acessar',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    signupController.outputLoading.listen( (result){
        if(result != _showLoading){
          setState(() {
            _showLoading = result;
          });
        } 
    }) ;

   return _showLoading ? LoadingPage() : Scaffold(

       appBar: new AppBar(
          title: new Text('Registrar-se'),
        ),
      body: Center (
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child:Center(
            
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: <Widget>[
  
                      _instructionsWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      _formWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      _submitWidget(),
                      _errorLabel(),
                       SizedBox(
                        height: 20,
                      ),
                       Align(
                        alignment: Alignment.bottomCenter,
                        child: _loginAccountLabel(),
                      ),
            ],
            ),
            
          )
        )
        
    )
    );

  }
}