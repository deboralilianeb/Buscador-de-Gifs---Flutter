import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giphys/app/modules/gifs/edit_gif.dart';
import 'package:giphys/app/resources/utils.dart';
import 'package:transparent_image/transparent_image.dart';
import 'search_giphy_controller.dart';

class GifsSalvosPagePage extends StatefulWidget {
  final String title;
  const GifsSalvosPagePage({Key key, this.title = "Gifs Salvos Page"})
      : super(key: key);

  @override
  _GifsSalvosPagePageState createState() => _GifsSalvosPagePageState();
}

class _GifsSalvosPagePageState
    extends ModularState<GifsSalvosPagePage, SearchGiphyController> {
  bool carregou = false;

  @override
  void initState() {
    new Future.delayed(Duration(seconds: 2), () => controller.getGifsBd())
        .then((value) {
      if (mounted) {
        setState(() {
          carregou = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (carregou && controller.gifsSalvos != null)
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
    else if (controller.gifsSalvos == null && carregou == true) {
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
              child: Text("Nenhum Gif foi salvo",
                  style: TextStyle(color: cor_secundaria))));
    } else
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
