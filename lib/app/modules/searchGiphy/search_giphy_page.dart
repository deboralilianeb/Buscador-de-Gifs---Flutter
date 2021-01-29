import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giphys/app/modules/resources/utils.dart';
import 'package:giphys/app/modules/searchGiphy/detailsGif.dart';
import 'package:transparent_image/transparent_image.dart';
import 'search_giphy_controller.dart';

class SearchGiphyPage extends StatefulWidget {
  final String title;
  const SearchGiphyPage({Key key, this.title = "SearchGiphy"})
      : super(key: key);

  @override
  _SearchGiphyPageState createState() => _SearchGiphyPageState();
}

class _SearchGiphyPageState
    extends ModularState<SearchGiphyPage, SearchGiphyController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    controller.getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cor_principal,
        title: Text(
          "Search Gifs",
          style: TextStyle(color: cor_secundaria),
        ),
        centerTitle: true,
      ),
      backgroundColor: cor_principal,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: cor_secundaria, width: 1.0),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: cor_secundaria, width: 1.0),
                ),
                labelText: "Buscar gifs...",
                labelStyle: TextStyle(color: cor_secundaria),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(
                color: cor_secundaria,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
              onSubmitted: (text) {
                setState(() {
                  controller.setSearch(text);
                  controller.setOffset(0);
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: controller.getGifs(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(cor_secundaria),
                        strokeWidth: 5.0,
                      ),
                    );
                  default:
                    if (snapshot.hasError)
                      return Container();
                    else
                      return _createGifsTable(context, snapshot);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _createGifsTable(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: controller.getCount(snapshot.data["data"], controller.search),
      itemBuilder: (context, index) {
        if ((controller.search == null || controller.search == "") ||
            index < snapshot.data["data"].length) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsGifPage(
                            gifData: snapshot.data["data"][index],
                          )));
            },
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: snapshot.data["data"][index]["images"]["fixed_height"]
                  ["url"],
              height: 300.0,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              print(controller.offset);
              print(controller.search);
              setState(() {
                int aux = controller.offset;
                controller.setOffset(aux + 19);
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 70.0,
                ),
                Text(
                  "Carregar mais...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
