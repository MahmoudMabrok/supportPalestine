import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Save Palestine',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Save Palestine'),
            ),
            body: HomePage()));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controle = TextEditingController();

  var computedString = "";

  void reArrangeHashtages(String text) {
    var list = text.split("\n");
    list.shuffle();

    String f = list.join("\n");
    /*  setState(() {
      computedString = f;

    });*/
    controle.text = f;
  }

  @override
  Widget build(BuildContext context) {
    var window = MediaQuery.of(context);
    var height = window.size.height;
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(),
            height: height * 0.2,
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: controle,
              decoration: InputDecoration.collapsed(
                  hintText: 'add your posts/hastages'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                reArrangeHashtages(controle.text);
              },
              child: Text('Re arrange'))
        ],
      ),
    );
  }
}
