import 'package:flutter/material.dart';
import 'package:linkedln/pages/home_page.dart';
import 'package:linkedln/pages/init_page.dart';
import 'package:linkedln/pages/publication_page.dart';

Map<String, WidgetBuilder> getRoutesApp() {
  return <String, WidgetBuilder>{
    '/homePage': (_) => HomePage(),
    '/initPage': (_) => InitPage(),
    '/publicationPage': (_) => PublicationPage(),
  };
}
