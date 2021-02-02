import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giphys/app/classes/gif.dart';
import 'package:giphys/app/modules/gifs/edit_gif.dart';
import 'package:giphys/app/resources/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transparent_image/transparent_image.dart';
import 'search_giphy_controller.dart';

class GifsSalvosPagePage extends StatefulWidget {
  final String title;
  final List<Gif> gifsSalvos;
  const GifsSalvosPagePage(
      {Key key, this.title = "Gifs Salvos Page", this.gifsSalvos})
      : super(key: key);

  @override
  _GifsSalvosPagePageState createState() => _GifsSalvosPagePageState();
}

class _GifsSalvosPagePageState
    extends ModularState<GifsSalvosPagePage, SearchGiphyController> {

  bool carregou = false;

  @override
  Widget build(BuildContext context) {
      new Future.delayed(Duration(seconds: 2), () => controller.getGifsBd())
        .then((value) {
      setState(() {
        carregou = true;
      });
    });
    if (carregou)
      return Scaffold(
        appBar: AppBar(
          backgroundColor: cor_principal,
          title: Text(
            "Gifs salvos",
            style: TextStyle(color: cor_secundaria),
          ),
          centerTitle: true,
        ),
        backgroundColor: cor_principal,
        body: Column(
          children: <Widget>[
            Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.all(10.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: controller.gifsSalvos.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditGifPage(
                                        gif: controller.gifsSalvos[index],
                                      )));
                        },
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: controller.gifsSalvos[index].url,
                          height: 300.0,
                          fit: BoxFit.cover,
                        ),
                      );
                    }))
          ],
        ),
      );
    else
      return Scaffold(
          appBar: AppBar(
            backgroundColor: cor_principal,
            title: Text(
              "Gifs salvos",
              style: TextStyle(color: cor_secundaria),
            ),
            centerTitle: true,
          ),
          backgroundColor: cor_principal,
          body: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          ));
  }
}
