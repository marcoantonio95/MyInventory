// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'databaseController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DatabaseController on _DatabaseControllerBase, Store {
  final _$getProfileAsyncAction = AsyncAction('getProfile');

  @override
  Future<Profile> getProfile(String uid) {
    return _$getProfileAsyncAction.run(() => super.getProfile(uid));
  }

  final _$getInventoryItensAsyncAction = AsyncAction('getInventoryItens');

  @override
  Future getInventoryItens(String sector) {
    return _$getInventoryItensAsyncAction
        .run(() => super.getInventoryItens(sector));
  }

  final _$getCurrentCodeAsyncAction = AsyncAction('getCurrentCode');

  @override
  Future<String> getCurrentCode() {
    return _$getCurrentCodeAsyncAction.run(() => super.getCurrentCode());
  }

  final _$detailItemAsyncAction = AsyncAction('detailItem');

  @override
  Future<Item> detailItem(String url) {
    return _$detailItemAsyncAction.run(() => super.detailItem(url));
  }

  final _$deleteItemAsyncAction = AsyncAction('deleteItem');

  @override
  Future<String> deleteItem(String url) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(url));
  }

  final _$addItemAsyncAction = AsyncAction('addItem');

  @override
  Future addItem(int index) {
    return _$addItemAsyncAction.run(() => super.addItem(index));
  }

  final _$_DatabaseControllerBaseActionController =
      ActionController(name: '_DatabaseControllerBase');

  @override
  dynamic _getDatabaseReference() {
    final _$actionInfo =
        _$_DatabaseControllerBaseActionController.startAction();
    try {
      return super._getDatabaseReference();
    } finally {
      _$_DatabaseControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _getInventoryInstance() {
    final _$actionInfo =
        _$_DatabaseControllerBaseActionController.startAction();
    try {
      return super._getInventoryInstance();
    } finally {
      _$_DatabaseControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _getProfileInstance() {
    final _$actionInfo =
        _$_DatabaseControllerBaseActionController.startAction();
    try {
      return super._getProfileInstance();
    } finally {
      _$_DatabaseControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = '';
    return '{$string}';
  }
}
