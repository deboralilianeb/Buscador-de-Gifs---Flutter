import 'dart:convert';

import 'package:giphys/app/modules/resources/guard.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

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
  String _search ;

  @action
  void setSearch(String search) =>
      _search = search;

  String get search => _search;

  @observable
  int _offset ;

  @action
  void setOffset(int offset) =>
      _offset = offset;

  int get offset => _offset;



Future<Map> getGifs() async {
    http.Response response;
   
    if (_search == null || _search == "")
      response = await http.get(
          "https://api.giphy.com/v1/gifs/trending?api_key=$APIKEY");
    else{
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

}
