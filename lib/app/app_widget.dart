import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:giphys/app/modules/searchGiphy/search_giphy_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchGiphyPage(),
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Search Giphys',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
