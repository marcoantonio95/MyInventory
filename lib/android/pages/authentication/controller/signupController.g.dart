// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signupController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpController on SignupControllerBase, Store {
  final _$accountAtom = Atom(name: 'SignupControllerBase.account');

  @override
  Account get account {
    _$accountAtom.context.enforceReadPolicy(_$accountAtom);
    _$accountAtom.reportObserved();
    return super.account;
  }

  @override
  set account(Account value) {
    _$accountAtom.context.conditionallyRunInAction(() {
      super.account = value;
      _$accountAtom.reportChanged();
    }, _$accountAtom, name: '${_$accountAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'account: ${account.toString()}';
    return '{$string}';
  }
}
