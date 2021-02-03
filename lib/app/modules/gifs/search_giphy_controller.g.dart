// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_giphy_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchGiphyController on _SearchGiphyControllerBase, Store {
  final _$valueAtom = Atom(name: '_SearchGiphyControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_searchAtom = Atom(name: '_SearchGiphyControllerBase._search');

  @override
  String get _search {
    _$_searchAtom.reportRead();
    return super._search;
  }

  @override
  set _search(String value) {
    _$_searchAtom.reportWrite(value, super._search, () {
      super._search = value;
    });
  }

  final _$_offsetAtom = Atom(name: '_SearchGiphyControllerBase._offset');

  @override
  int get _offset {
    _$_offsetAtom.reportRead();
    return super._offset;
  }

  @override
  set _offset(int value) {
    _$_offsetAtom.reportWrite(value, super._offset, () {
      super._offset = value;
    });
  }

  final _$_gifsSalvosAtom =
      Atom(name: '_SearchGiphyControllerBase._gifsSalvos');

  @override
  List<Gif> get _gifsSalvos {
    _$_gifsSalvosAtom.reportRead();
    return super._gifsSalvos;
  }

  @override
  set _gifsSalvos(List<Gif> value) {
    _$_gifsSalvosAtom.reportWrite(value, super._gifsSalvos, () {
      super._gifsSalvos = value;
    });
  }

  final _$_SearchGiphyControllerBaseActionController =
      ActionController(name: '_SearchGiphyControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_SearchGiphyControllerBaseActionController
        .startAction(name: '_SearchGiphyControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_SearchGiphyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String search) {
    final _$actionInfo = _$_SearchGiphyControllerBaseActionController
        .startAction(name: '_SearchGiphyControllerBase.setSearch');
    try {
      return super.setSearch(search);
    } finally {
      _$_SearchGiphyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOffset(int offset) {
    final _$actionInfo = _$_SearchGiphyControllerBaseActionController
        .startAction(name: '_SearchGiphyControllerBase.setOffset');
    try {
      return super.setOffset(offset);
    } finally {
      _$_SearchGiphyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setgifsSalvos(List<Gif> gifsSalvos) {
    final _$actionInfo = _$_SearchGiphyControllerBaseActionController
        .startAction(name: '_SearchGiphyControllerBase.setgifsSalvos');
    try {
      return super.setgifsSalvos(gifsSalvos);
    } finally {
      _$_SearchGiphyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
