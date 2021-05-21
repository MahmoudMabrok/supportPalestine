import 'package:flutter/material.dart';
import 'package:save_palestine/screens/languages_detail.dart';
import 'package:save_palestine/screens/list_languages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stand with Palestine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => ListLanguages(),
        LanguagesDetail.routeName: (ctx) => LanguagesDetail()
      },
    );
  }
}
