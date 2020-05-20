import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meuInventario/android/pages/authentication/controller/signinController.dart';
import 'package:meuInventario/android/pages/util/widget/loading_page.dart';
class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SignInController signInController;
  bool _showLoading = false;
  String _errorLogin = "";

  @override
  void initState() {
    debugPrint("#Initiated $this");
    signInController = GetIt.I.get<SignInController>();
    
    signInController.configStreams();
    super.initState();
  }

  @override
  void dispose() {
    debugPrint("#Disposed $this");
    signInController.dispose();
    super.dispose();
  }

  Widget _backButtonWidget() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Voltar',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _instructionsWidget() {
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: <Widget>[
         
            Image(height: 150,width: 150, image: Image.asset('lib/assets/ic_chestopen.png').image),
            SizedBox(
              height: 20,
            ),
            Text(
              'Acessar sua conta:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ));
  }

  Widget _entryField(String title, {bool isPassword = false}) {
  return Container(
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
          TextFormField(
           controller: getController(title),
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
                  validator: (value) {
          
                    if (value.isEmpty) {
                      return 'O campo não pode estar vazio';
                    }
            
                    return null;
                  },
                  )
        ],
      ),
    );
  }

  getController(String title){
   if (title == "Email"){
      return _emailController;
    } else {
      return _passwordController;
    }
  }

  Widget _signInForm() {
   return Form(
            key: _formKey,
     child: Column(
      children: <Widget>[
        _entryField("Email"),
        _entryField("Senha", isPassword: true),
      ],
      ),
    );
  }

  Widget _submitButton() {
      return InkWell(
      onTap: () {
        if (_formKey.currentState.validate()) {
       _login();
        }
      },
    child: Container(
      width: MediaQuery.of(context).size.width,
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
              colors: [Colors.red[700], Colors.red[600]])),
      child: Text(
        'Acessar',
        style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      ),
    );
  }


  _login() async {
    signInController.setCurrentInfo(_emailController.text,_passwordController.text);
    signInController.setLoading(true);
    signInController.signIn();
  }

  Widget _forgetLabel(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerRight,
      child: Text('Esqueceu sua senha?',
      style:
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('ou'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Acessar com Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _errorLabel(){
    signInController.outputResult.listen( (result){
        if(result != _errorLogin && result != "Sucesso"){
            setState(() {
            _errorLogin = result;
          });
        } else  if(result != _errorLogin && result == "Sucesso"){
            setState(() {
            Navigator.popAndPushNamed(context, "/home");
          });
        }   
    }) ;

    if (_errorLogin != "" || _errorLogin.isNotEmpty){
      return  Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Text(_errorLogin,
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

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Não possui uma conta?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.popAndPushNamed(context, "/createaccountpage");
            },
            child: Text(
              'Registre-se',
              style: TextStyle(
                  color: Colors.red[700],
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
   signInController.outputLoading.listen( (result){
        if(result != _showLoading){
          setState(() {
            _showLoading = result;
          });
        } 
    }) ;

   return _showLoading ? LoadingPage() : Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                      _instructionsWidget(),
                      SizedBox(
                        height: 10,
                      ),
                      _signInForm(),
                      SizedBox(
                        height: 20,
                      ),
                      _submitButton(),
                      _forgetLabel(),
                      _errorLabel(),
                      _divider(),
                      _facebookButton(),
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _createAccountLabel(),
                ),
                Positioned(top: 40, left: 0, child: _backButtonWidget()),
               
              ],
            ),
          )
        )
      );
  }
}