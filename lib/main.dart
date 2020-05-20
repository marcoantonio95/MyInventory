import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meuInventario/android/pages/authentication/controller/authController.dart';
import 'package:meuInventario/android/pages/authentication/controller/signinController.dart';
import 'package:meuInventario/android/pages/authentication/controller/signupController.dart';
import 'package:meuInventario/android/pages/inventory/controller/inventoryController.dart';
import 'package:meuInventario/android/pages/profile/controller/profileController.dart';
import 'package:meuInventario/android/pages/util/controllers/databaseController.dart';
import 'package:meuInventario/android/pages/util/controllers/qrController.dart';
import 'package:meuInventario/android/pages/util/controllers/themeController.dart';

import 'dart:io' show Platform;

import 'package:meuInventario/ios/app.dart';
import 'package:meuInventario/android/app.dart';


void startConfig(){
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<AuthController>(AuthController());
  getIt.registerSingleton<DatabaseController>(DatabaseController());
  getIt.registerSingleton<ThemeController>(ThemeController());
  getIt.registerSingleton<SignUpController>(SignUpController()); //TODO: MAKE SignUpController LAZY
  getIt.registerLazySingleton<SignInController>(() => new SignInController());
  getIt.registerLazySingleton<ProfileController>(() => new ProfileController());
  getIt.registerLazySingleton<InventoryController>(() => new InventoryController());
  getIt.registerLazySingleton<QrController>(() => new QrController());
  runApp(AndroidApp());
}

void main() => Platform.isIOS ? runApp(IOSApp()) : startConfig();

