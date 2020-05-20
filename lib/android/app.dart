import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:meuInventario/android/pages/authentication/controller/authController.dart';
import 'package:meuInventario/android/pages/authentication/view/login_page.dart';
import 'package:meuInventario/android/pages/authentication/view/signup_page.dart';
import 'package:meuInventario/android/pages/authentication/view/welcome_page.dart';
import 'package:meuInventario/android/pages/home_page.dart';
import 'package:meuInventario/android/pages/inventory/view/inventory_page.dart';
import 'package:meuInventario/android/pages/profile/view/profile_page.dart';
import 'package:meuInventario/android/pages/util/controllers/themeController.dart';
import 'package:meuInventario/android/pages/util/widget/loading_page.dart';
import 'package:meuInventario/android/pages/util/widget/qrcode_page.dart';
import 'package:meuInventario/android/pages/util/widget/scan_screen.dart';

class AndroidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final authController = GetIt.I.get<AuthController>(); 
  final themeController = GetIt.I.get<ThemeController>(); 
  
  return Observer(builder: (_) => 
     MaterialApp(
       routes: {
        "/welcome" : (context) => WelcomePage(),
        "/login" : (context) => LoginPage(),
        "/home" : (context) => HomePage(),
        "/profile" : (context) => ProfilePage(),
        "/inventory" : (context) => InventoryPage(),
        "/createaccountpage" : (context) => SignUpPage(),
        "/loading" : (context) => LoadingPage(),
       "/generate" : (context) => GeneratePage(),
       "/scan" :  (context) => ScanScreen(),
      },
      theme: themeController.themeData,
      home: FutureBuilder<FirebaseUser>(
        future: authController.getCurrentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) { 
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.error != null) {
              debugPrint("error on homepage ${snapshot.error}");
            }
            return snapshot.hasData ? HomePage() : WelcomePage();
          } else {
            return LoadingPage();
            }
          },
        ),
      ),
    );
  }
}