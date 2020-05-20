// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'themeController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeController on _ThemeControllerBase, Store {
  final _$themeDataAtom = Atom(name: '_ThemeControllerBase.themeData');

  @override
  ThemeData get themeData {
    _$themeDataAtom.context.enforceReadPolicy(_$themeDataAtom);
    _$themeDataAtom.reportObserved();
    return super.themeData;
  }

  @override
  set themeData(ThemeData value) {
    _$themeDataAtom.context.conditionallyRunInAction(() {
      super.themeData = value;
      _$themeDataAtom.reportChanged();
    }, _$themeDataAtom, name: '${_$themeDataAtom.name}_set');
  }

  final _$_ThemeControllerBaseActionController =
      ActionController(name: '_ThemeControllerBase');

  @override
  dynamic changeData() {
    final _$actionInfo = _$_ThemeControllerBaseActionController.startAction();
    try {
      return super.changeData();
    } finally {
      _$_ThemeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'themeData: ${themeData.toString()}';
    return '{$string}';
  }
}
