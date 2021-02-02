import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giphys/app/classes/gif.dart';
import 'package:giphys/app/modules/gifs/search_giphy_controller.dart';
import 'package:giphys/app/modules/gifs/search_giphy_page.dart';
import 'package:giphys/app/resources/utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:toast/toast.dart';

class DetailsGifPage extends StatefulWidget {
  final Map gifData;
  final List<Gif> gifSalvos;
  const DetailsGifPage({Key key, this.gifData, this.gifSalvos})
      : super(key: key);

  @override
  _DetailsGifPageState createState() => _DetailsGifPageState();
}

class _DetailsGifPageState
    extends ModularState<DetailsGifPage, SearchGiphyController> {
  var dataCriacao;
  var dataExibicao;

  @override
  Widget build(BuildContext context) {
    dataCriacao = widget.gifData["import_datetime"];
    var dataSemHora = dataCriacao.toString().split(' ');
    var data1 = dataSemHora[0].toString().split("-");
    dataExibicao = data1[2] + "-" + data1[1] + "-" + data1[0];

    return Scaffold(
        appBar: AppBar(
          title: Text("Detalhes do Gif"),
          //title: Text(widget.gifData["title"]),
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
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    decoration: BoxDecoration(
                        color: cor_principal,
                        border: Border.all(color: cor_secundaria, width: 3.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: cor_secundaria,
                              offset: Offset(1, 3))
                        ]),
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                    child: Text(widget.gifData["title"],
                                        style: TextStyle(
                                            color: cor_secundaria,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)))
                              ]),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Image.network(widget.gifData["images"]
                                ["fixed_height"]["url"]),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Postado por: ",
                                    style: TextStyle(
                                        color: cor_secundaria,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Flexible(
                                    child: Text(
                                        widget.gifData["username"] != ""
                                            ? widget.gifData["username"]
                                                .toString()
                                                .toUpperCase()
                                            : "Desconhecido",
                                        style: TextStyle(
                                            color: cor_secundaria,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)))
                              ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Criado em: ",
                                    style: TextStyle(
                                        color: cor_secundaria,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Flexible(
                                    child: Text(dataExibicao,
                                        style: TextStyle(
                                            color: cor_secundaria,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)))
                              ]),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            height: 10,
                            color: cor_secundaria,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  IconButton(
                                    color: cor_secundaria,
                                    icon: Icon(Icons.save),
                                    tooltip: 'Salvar Gif',
                                    onPressed: () async {
                                      print(widget.gifSalvos);
                                      if (controller.verificaGifSAlvo(
                                        widget.gifSalvos,
                                        widget.gifData["images"]["fixed_height"]
                                                ["url"]
                                            .toString(),
                                      )) {
                                        controller
                                            .create(Gif(
                                                autor: widget.gifData[
                                                            "username"] !=
                                                        ""
                                                    ? widget
                                                        .gifData["username"]
                                                        .toString()
                                                        .toUpperCase()
                                                    : "Desconhecido",
                                                url: widget.gifData["images"]
                                                    ["fixed_height"]["url"],
                                                titulo:
                                                    widget.gifData["title"]))
                                            .then((value) {
                                          Toast.show(
                                              "Gif Salvo com sucesso", context,
                                              gravity: Toast.CENTER,
                                              duration: Toast.LENGTH_LONG,
                                              backgroundColor: cor_secundaria,
                                              textColor: cor_principal);

                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SearchGiphyPage()),
                                              (Route<dynamic> route) => false);
                                        }).catchError((onError) {
                                          print(
                                              'Erro ao salvar Gif  >> $onError');
                                          Toast.show(
                                              "Esse GIF já foi Salvo", context);
                                        });
                                      } else {
                                        Toast.show(
                                            "Esse Gif já foi salvo", context,
                                            gravity: Toast.CENTER,
                                            duration: Toast.LENGTH_LONG,
                                            backgroundColor: cor_secundaria,
                                            textColor: cor_principal);
                                      }
                                    },
                                  ),
                                  Text(
                                    'Salvar',
                                    style: TextStyle(color: cor_secundaria),
                                  )
                                ],
                              )
                            ],
                          ),
                        ]))))));
  }
}
