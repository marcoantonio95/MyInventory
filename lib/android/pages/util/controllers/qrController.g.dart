// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qrController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QrController on _QrControllerBase, Store {
  final _$showQRAtom = Atom(name: '_QrControllerBase.showQR');

  @override
  bool get showQR {
    _$showQRAtom.context.enforceReadPolicy(_$showQRAtom);
    _$showQRAtom.reportObserved();
    return super.showQR;
  }

  @override
  set showQR(bool value) {
    _$showQRAtom.context.conditionallyRunInAction(() {
      super.showQR = value;
      _$showQRAtom.reportChanged();
    }, _$showQRAtom, name: '${_$showQRAtom.name}_set');
  }

  final _$currentQrStringAtom = Atom(name: '_QrControllerBase.currentQrString');

  @override
  String get currentQrString {
    _$currentQrStringAtom.context.enforceReadPolicy(_$currentQrStringAtom);
    _$currentQrStringAtom.reportObserved();
    return super.currentQrString;
  }

  @override
  set currentQrString(String value) {
    _$currentQrStringAtom.context.conditionallyRunInAction(() {
      super.currentQrString = value;
      _$currentQrStringAtom.reportChanged();
    }, _$currentQrStringAtom, name: '${_$currentQrStringAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'showQR: ${showQR.toString()},currentQrString: ${currentQrString.toString()}';
    return '{$string}';
  }
}
