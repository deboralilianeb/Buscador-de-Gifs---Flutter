import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giphys/app/classes/gif.dart';
import 'package:giphys/app/modules/gifs/search_giphy_controller.dart';
import 'package:giphys/app/resources/utils.dart';
import 'package:toast/toast.dart';

class EditGifPage extends StatefulWidget {
  final Gif gif;
  const EditGifPage({Key key, this.gif}) : super(key: key);

  @override
  _EditGifPageState createState() => _EditGifPageState();
}

class _EditGifPageState
    extends ModularState<EditGifPage, SearchGiphyController> {
  var dataCriacao;
  var dataExibicao;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tituloGifTaskController =
        TextEditingController(text: widget.gif.titulo);
    var autorTaskController = TextEditingController(text: widget.gif.autor);
    /*dataCriacao = widget.gifData["import_datetime"];
    var dataSemHora = dataCriacao.toString().split(' ');
    var data1 = dataSemHora[0].toString().split("-");
    dataExibicao = data1[2] + "-" + data1[1] + "-" + data1[0];*/
    return Scaffold(
        appBar: AppBar(
          title: Text("Editar detalhes do Gif"),
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
                        color: cor_secundaria,
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
                          Container(
                            child: Image.network(widget.gif.url),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: TextFormField(
                              maxLines: null,
                              controller: tituloGifTaskController,
                              decoration: InputDecoration(
                                labelText: 'Titulo do Gif',
                                labelStyle: TextStyle(
                                  fontSize: 10,
                                  color: cor_principal,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              controller: autorTaskController,
                              decoration: InputDecoration(
                                labelText: 'Postado por: ',
                                labelStyle: TextStyle(
                                  fontSize: 10,
                                  color: cor_principal,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 50,
                            color: cor_principal,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  IconButton(
                                      color: cor_principal,
                                      icon: Icon(Icons.save),
                                      tooltip: 'Salvar Alterações',
                                      onPressed: () {
                                        if (tituloGifTaskController.text ==
                                                widget.gif.titulo &&
                                            autorTaskController.text ==
                                                widget.gif.autor) {
                                          Toast.show(
                                              "Nenhuma alteração foi feita",
                                              context,
                                              gravity: Toast.CENTER,
                                              duration: Toast.LENGTH_LONG,
                                              backgroundColor: cor_principal,
                                              textColor: cor_secundaria);
                                        } else {
                                          Gif newGif = new Gif();
                                          newGif.autor =
                                              autorTaskController.text;
                                          newGif.titulo =
                                              tituloGifTaskController.text;
                                          newGif.url = widget.gif.url;

                                          print(newGif.autor);

                                          controller
                                              .update(newGif)
                                              .then((value) {
                                            Toast.show(
                                                "Alterações Salvas com sucesso",
                                                context,
                                                gravity: Toast.CENTER,
                                                duration: Toast.LENGTH_LONG);

                                            Navigator.pop(context);
                                          }).catchError((onError) {
                                            Toast.show(
                                                'Erro ao fazer alterações',
                                                context);
                                            print(
                                                '[ERROR] :: Erro ao salvar alterações() :: $onError');
                                            Navigator.pop(context);
                                          });
                                        }
                                      }),
                                  Text(
                                    'Salvar Alerações',
                                    style: TextStyle(color: cor_principal),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  IconButton(
                                    color: Colors.red,
                                    icon: Icon(Icons.delete),
                                    tooltip: 'Excluir Gif',
                                    onPressed: () {
                                      controller
                                          .delete(widget.gif.url)
                                          .then((value) {
                                        Toast.show(
                                            "Gif Excluido com sucesso", context,
                                            gravity: Toast.CENTER,
                                            duration: Toast.LENGTH_LONG);

                                        Navigator.pop(context);
                                      }).catchError((onError) {
                                        Toast.show(
                                            'Erro ao Excluir Gif', context);
                                        print(
                                            '[ERROR] :: Erro ao salvar alterações() :: $onError');
                                        Navigator.pop(context);
                                      });
                                      setState(() {});
                                    },
                                  ),
                                  Text(
                                    'Excluir',
                                    style: TextStyle(color: cor_principal),
                                  )
                                ],
                              )
                            ],
                          ),
                        ]))))));
  }
}
