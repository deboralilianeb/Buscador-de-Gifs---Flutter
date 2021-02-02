import 'package:giphys/app/modules/gifs/search_giphy_controller.dart';
import 'package:giphys/app/modules/gifs/search_giphy_page.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:giphys/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
      Bind((i) => AppController()),
      Bind((i) => SearchGiphyController()), 
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: AppModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
