import 'package:giphys/app/modules/searchGiphy/search_giphy_controller.dart';
import 'package:giphys/app/modules/searchGiphy/search_giphy_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:giphys/app/app_widget.dart';
import 'package:giphys/app/modules/home/home_module.dart';

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
