// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventoryController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InventoryController on _InventoryControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;
  Computed<List<Item>> _$listFilteredComputed;

  @override
  List<Item> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<Item>>(() => super.listFiltered))
      .value;

  final _$newItemAtom = Atom(name: '_InventoryControllerBase.newItem');

  @override
  Item get newItem {
    _$newItemAtom.context.enforceReadPolicy(_$newItemAtom);
    _$newItemAtom.reportObserved();
    return super.newItem;
  }

  @override
  set newItem(Item value) {
    _$newItemAtom.context.conditionallyRunInAction(() {
      super.newItem = value;
      _$newItemAtom.reportChanged();
    }, _$newItemAtom, name: '${_$newItemAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_InventoryControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$listItemAtom = Atom(name: '_InventoryControllerBase.listItem');

  @override
  ObservableList<Item> get listItem {
    _$listItemAtom.context.enforceReadPolicy(_$listItemAtom);
    _$listItemAtom.reportObserved();
    return super.listItem;
  }

  @override
  set listItem(ObservableList<Item> value) {
    _$listItemAtom.context.conditionallyRunInAction(() {
      super.listItem = value;
      _$listItemAtom.reportChanged();
    }, _$listItemAtom, name: '${_$listItemAtom.name}_set');
  }

  final _$showSearchAtom = Atom(name: '_InventoryControllerBase.showSearch');

  @override
  bool get showSearch {
    _$showSearchAtom.context.enforceReadPolicy(_$showSearchAtom);
    _$showSearchAtom.reportObserved();
    return super.showSearch;
  }

  @override
  set showSearch(bool value) {
    _$showSearchAtom.context.conditionallyRunInAction(() {
      super.showSearch = value;
      _$showSearchAtom.reportChanged();
    }, _$showSearchAtom, name: '${_$showSearchAtom.name}_set');
  }

  final _$filterAtom = Atom(name: '_InventoryControllerBase.filter');

  @override
  String get filter {
    _$filterAtom.context.enforceReadPolicy(_$filterAtom);
    _$filterAtom.reportObserved();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.context.conditionallyRunInAction(() {
      super.filter = value;
      _$filterAtom.reportChanged();
    }, _$filterAtom, name: '${_$filterAtom.name}_set');
  }

  final _$removeItemAsyncAction = AsyncAction('removeItem');

  @override
  Future removeItem(Item newItem) {
    return _$removeItemAsyncAction.run(() => super.removeItem(newItem));
  }

  final _$addItemAsyncAction = AsyncAction('addItem');

  @override
  Future addItem() {
    return _$addItemAsyncAction.run(() => super.addItem());
  }

  final _$_InventoryControllerBaseActionController =
      ActionController(name: '_InventoryControllerBase');

  @override
  dynamic setLoading(bool newStatus) {
    final _$actionInfo =
        _$_InventoryControllerBaseActionController.startAction();
    try {
      return super.setLoading(newStatus);
    } finally {
      _$_InventoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeFilter(String newFilter) {
    final _$actionInfo =
        _$_InventoryControllerBaseActionController.startAction();
    try {
      return super.changeFilter(newFilter);
    } finally {
      _$_InventoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSearch(bool newSearch) {
    final _$actionInfo =
        _$_InventoryControllerBaseActionController.startAction();
    try {
      return super.setSearch(newSearch);
    } finally {
      _$_InventoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNewItem() {
    final _$actionInfo =
        _$_InventoryControllerBaseActionController.startAction();
    try {
      return super.setNewItem();
    } finally {
      _$_InventoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getInventoryItens(String sector) {
    final _$actionInfo =
        _$_InventoryControllerBaseActionController.startAction();
    try {
      return super.getInventoryItens(sector);
    } finally {
      _$_InventoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic refreshList() {
    final _$actionInfo =
        _$_InventoryControllerBaseActionController.startAction();
    try {
      return super.refreshList();
    } finally {
      _$_InventoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addOrUpdateItem(Item newItem) {
    final _$actionInfo =
        _$_InventoryControllerBaseActionController.startAction();
    try {
      return super.addOrUpdateItem(newItem);
    } finally {
      _$_InventoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getItem(Item item) {
    final _$actionInfo =
        _$_InventoryControllerBaseActionController.startAction();
    try {
      return super.getItem(item);
    } finally {
      _$_InventoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateItem(int index, Item itemUpdate) {
    final _$actionInfo =
        _$_InventoryControllerBaseActionController.startAction();
    try {
      return super.updateItem(index, itemUpdate);
    } finally {
      _$_InventoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getWearList() {
    final _$actionInfo =
        _$_InventoryControllerBaseActionController.startAction();
    try {
      return super.getWearList();
    } finally {
      _$_InventoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'newItem: ${newItem.toString()},isLoading: ${isLoading.toString()},listItem: ${listItem.toString()},showSearch: ${showSearch.toString()},filter: ${filter.toString()},isValid: ${isValid.toString()},listFiltered: ${listFiltered.toString()}';
    return '{$string}';
  }
}
