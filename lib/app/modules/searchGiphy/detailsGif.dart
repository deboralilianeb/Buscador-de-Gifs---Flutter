import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giphys/app/modules/searchGiphy/search_giphy_controller.dart';

class DetailsGifPage extends StatefulWidget {
  final Map gifData;
  const DetailsGifPage({Key key, this.gifData})
      : super(key: key);

  @override
  _DetailsGifPageState createState() => _DetailsGifPageState();
}

class _DetailsGifPageState
    extends ModularState<DetailsGifPage, SearchGiphyController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: Text(widget.gifData["title"]),
        /*actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(widget.gifData["images"]["fixed_height"]["url"]);
            },
          )
        ],*/
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Container( 
        
         child:   Image.network(widget.gifData["images"]["fixed_height"]["url"]),
      ),
    ));     

    }}