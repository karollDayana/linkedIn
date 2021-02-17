import 'package:flutter/material.dart';
import 'package:linkedln/providers/menu_provider.dart';
import 'package:linkedln/providers/publications_provider.dart';
import 'package:linkedln/routes/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MenuProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PublicationsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'LinkedIn App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/homePage',
        routes: getRoutesApp(),
      ),
    );
  }
}
