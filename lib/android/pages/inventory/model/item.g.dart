// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Item on ItemBase, Store {
  final _$codeAtom = Atom(name: 'ItemBase.code');

  @override
  String get code {
    _$codeAtom.context.enforceReadPolicy(_$codeAtom);
    _$codeAtom.reportObserved();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.context.conditionallyRunInAction(() {
      super.code = value;
      _$codeAtom.reportChanged();
    }, _$codeAtom, name: '${_$codeAtom.name}_set');
  }

  final _$nameAtom = Atom(name: 'ItemBase.name');

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

  final _$quantityAtom = Atom(name: 'ItemBase.quantity');

  @override
  String get quantity {
    _$quantityAtom.context.enforceReadPolicy(_$quantityAtom);
    _$quantityAtom.reportObserved();
    return super.quantity;
  }

  @override
  set quantity(String value) {
    _$quantityAtom.context.conditionallyRunInAction(() {
      super.quantity = value;
      _$quantityAtom.reportChanged();
    }, _$quantityAtom, name: '${_$quantityAtom.name}_set');
  }

  final _$descriptionAtom = Atom(name: 'ItemBase.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$wearAtom = Atom(name: 'ItemBase.wear');

  @override
  String get wear {
    _$wearAtom.context.enforceReadPolicy(_$wearAtom);
    _$wearAtom.reportObserved();
    return super.wear;
  }

  @override
  set wear(String value) {
    _$wearAtom.context.conditionallyRunInAction(() {
      super.wear = value;
      _$wearAtom.reportChanged();
    }, _$wearAtom, name: '${_$wearAtom.name}_set');
  }

  final _$creatorAtom = Atom(name: 'ItemBase.creator');

  @override
  String get creator {
    _$creatorAtom.context.enforceReadPolicy(_$creatorAtom);
    _$creatorAtom.reportObserved();
    return super.creator;
  }

  @override
  set creator(String value) {
    _$creatorAtom.context.conditionallyRunInAction(() {
      super.creator = value;
      _$creatorAtom.reportChanged();
    }, _$creatorAtom, name: '${_$creatorAtom.name}_set');
  }

  final _$timeAtom = Atom(name: 'ItemBase.time');

  @override
  String get time {
    _$timeAtom.context.enforceReadPolicy(_$timeAtom);
    _$timeAtom.reportObserved();
    return super.time;
  }

  @override
  set time(String value) {
    _$timeAtom.context.conditionallyRunInAction(() {
      super.time = value;
      _$timeAtom.reportChanged();
    }, _$timeAtom, name: '${_$timeAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'code: ${code.toString()},name: ${name.toString()},quantity: ${quantity.toString()},description: ${description.toString()},wear: ${wear.toString()},creator: ${creator.toString()},time: ${time.toString()}';
    return '{$string}';
  }
}
