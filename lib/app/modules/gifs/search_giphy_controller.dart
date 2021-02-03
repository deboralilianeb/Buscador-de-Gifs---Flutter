import 'dart:convert';
import 'package:giphys/app/resources/guard.dart';
import 'package:giphys/app/resources/sqlite.dart';
import 'package:giphys/app/classes/gif.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

part 'search_giphy_controller.g.dart';

@Injectable()
class SearchGiphyController = _SearchGiphyControllerBase
    with _$SearchGiphyController;

abstract class _SearchGiphyControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @observable
  String _search;

  @action
  void setSearch(String search) => _search = search;

  String get search => _search;

  @observable
  int _offset;

  @action
  void setOffset(int offset) => _offset = offset;

  int get offset => _offset;

  @observable
  List<Gif> _gifsSalvos;

  @action
  void setgifsSalvos(List<Gif> gifsSalvos) => _gifsSalvos = gifsSalvos;

  List<Gif> get gifsSalvos => _gifsSalvos;

  Future<Map> getGifs() async {
    http.Response response;

    if (_search == null || _search == "")
      response = await http
          .get( "https://api.giphy.com/v1/gifs/trending?api_key=$APIKEY");
    else {
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=$APIKEY&q=$_search&offset=$_offset&limit=39&rating=g");
    }
    return json.decode(response.body);
  }

  int getCount(List data, String _search) {
    if (_search == null || _search == "") {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(CREATE_GIFS_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

  Future create(Gif model) async {
    try {
      final Database db = await _getDatabase();

      await db.insert(
        "gifs",
        model.toMap(),
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<void> getGifsBd() async {
    final Database db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('gifs');
    List<Gif> gifs = new List<Gif>();

    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        gifs.add(Gif(
          url: maps[i]['url'],
          autor: maps[i]['autor'],
          titulo: maps[i]['titulo'],
        ));
      }

      setgifsSalvos(gifs);
    } 
  }

  Future update(Gif model) async {
    try {
      final Database db = await _getDatabase();

      await db.update(
        'gifs',
        model.toMap(),
        where: "url = ?",
        whereArgs: [model.url],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future delete(String url) async {
    try {
      final Database db = await _getDatabase();
      await db.delete(
        'gifs',
        where: "url = ?",
        whereArgs: [url],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  bool verificaGifSAlvo(List<Gif> gifs, String urlAtual) {

    if(gifs==null){
      return true;
    }
    for (int i = 0; i < gifs.length; i++) {
      if (gifs[i].url == urlAtual) return false;
    }
    return true;
  }
}
