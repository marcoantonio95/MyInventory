import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'themeController.g.dart';

class ThemeController = _ThemeControllerBase with _$ThemeController;

abstract class _ThemeControllerBase with Store {
  
  static final darkTheme = ThemeData(
  primarySwatch: Colors.red,
  primaryColor: Colors.red,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.red,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF212121),     //  <-- dark color
    textTheme: ButtonTextTheme.primary
  )
);

  static final lightTheme = ThemeData(
  primarySwatch: Colors.red,
  primaryColor: Colors.red,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.red,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.white,     //  <-- dark color
    textTheme: ButtonTextTheme.primary
  )
);

  @observable
  ThemeData themeData = lightTheme;

  @action
  changeData() {
    themeData == lightTheme
        ? themeData = darkTheme
        : themeData = lightTheme;
    
    debugPrint("#Theme Altered! To $themeData");
  }

}