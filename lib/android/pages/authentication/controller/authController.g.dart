// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on AuthControllerBase, Store {
  final _$getCurrentUserAsyncAction = AsyncAction('getCurrentUser');

  @override
  Future<FirebaseUser> getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  final _$signInAsyncAction = AsyncAction('signIn');

  @override
  Future<dynamic> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  final _$signUpAsyncAction = AsyncAction('signUp');

  @override
  Future<dynamic> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  final _$createProfileAsyncAction = AsyncAction('createProfile');

  @override
  Future<dynamic> createProfile(
      FirebaseUser user, SignUpController controller) {
    return _$createProfileAsyncAction
        .run(() => super.createProfile(user, controller));
  }

  final _$signOutAsyncAction = AsyncAction('signOut');

  @override
  Future<dynamic> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$AuthControllerBaseActionController =
      ActionController(name: 'AuthControllerBase');

  @override
  dynamic getAuthInstance() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction();
    try {
      return super.getAuthInstance();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _getDatabaseReference() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction();
    try {
      return super._getDatabaseReference();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = '';
    return '{$string}';
  }
}
