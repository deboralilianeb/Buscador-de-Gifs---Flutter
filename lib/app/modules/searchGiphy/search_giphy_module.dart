import 'search_giphy_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'search_giphy_page.dart';

class SearchGiphyModule extends ChildModule {
  @override
  List<Bind> get binds => [
         Bind((i) => SearchGiphyController()),

      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => SearchGiphyPage()),
      ];

  static Inject get to => Inject<SearchGiphyModule>.of();
}
