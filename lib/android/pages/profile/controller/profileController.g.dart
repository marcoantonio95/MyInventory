// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileController on _ProfileControllerBase, Store {
  final _$nameAtom = Atom(name: '_ProfileControllerBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_ProfileControllerBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$phoneAtom = Atom(name: '_ProfileControllerBase.phone');

  @override
  String get phone {
    _$phoneAtom.context.enforceReadPolicy(_$phoneAtom);
    _$phoneAtom.reportObserved();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.context.conditionallyRunInAction(() {
      super.phone = value;
      _$phoneAtom.reportChanged();
    }, _$phoneAtom, name: '${_$phoneAtom.name}_set');
  }

  final _$sectorAtom = Atom(name: '_ProfileControllerBase.sector');

  @override
  String get sector {
    _$sectorAtom.context.enforceReadPolicy(_$sectorAtom);
    _$sectorAtom.reportObserved();
    return super.sector;
  }

  @override
  set sector(String value) {
    _$sectorAtom.context.conditionallyRunInAction(() {
      super.sector = value;
      _$sectorAtom.reportChanged();
    }, _$sectorAtom, name: '${_$sectorAtom.name}_set');
  }

  final _$uidAtom = Atom(name: '_ProfileControllerBase.uid');

  @override
  String get uid {
    _$uidAtom.context.enforceReadPolicy(_$uidAtom);
    _$uidAtom.reportObserved();
    return super.uid;
  }

  @override
  set uid(String value) {
    _$uidAtom.context.conditionallyRunInAction(() {
      super.uid = value;
      _$uidAtom.reportChanged();
    }, _$uidAtom, name: '${_$uidAtom.name}_set');
  }

  final _$_ProfileControllerBaseActionController =
      ActionController(name: '_ProfileControllerBase');

  @override
  dynamic _setName(String newNome) {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction();
    try {
      return super._setName(newNome);
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setEmail(String newEmail) {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction();
    try {
      return super._setEmail(newEmail);
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setPhone(String newPhone) {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction();
    try {
      return super._setPhone(newPhone);
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setSector(String newSector) {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction();
    try {
      return super._setSector(newSector);
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setUid(String newUid) {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction();
    try {
      return super._setUid(newUid);
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _getDatabaseInstance() {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction();
    try {
      return super._getDatabaseInstance();
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _getAuthInstance() {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction();
    try {
      return super._getAuthInstance();
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _getCurrentProfile() {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction();
    try {
      return super._getCurrentProfile();
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setCurrentProfile(Profile newProfile) {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction();
    try {
      return super._setCurrentProfile(newProfile);
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'name: ${name.toString()},email: ${email.toString()},phone: ${phone.toString()},sector: ${sector.toString()},uid: ${uid.toString()}';
    return '{$string}';
  }
}
