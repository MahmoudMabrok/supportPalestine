import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  final controller = TextEditingController();

  String computedString = "";

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void reArrangeHashTags(String text) {
    var list = text.split("\n");
    list.shuffle();

    String f = list.join("\n");

    controller.text = f;
  }

  @override
  Widget build(BuildContext context) {
    var window = MediaQuery.of(context);
    var height = window.size.height;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 22, horizontal: 16),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor, // set border color
            ), // set border width
            borderRadius: BorderRadius.circular(8), // set rounded corner radius
          ),
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 8,
            controller: controller,
            decoration:
                InputDecoration.collapsed(hintText: 'add your posts/hastages'),
          ),
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                reArrangeHashTags(controller.text);
              },
              child: Container(
                constraints: BoxConstraints(minWidth: 64),
                child: Center(
                  child: Text('Re arrange'),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                copy(controller.text);
              },
              child: Container(
                constraints: BoxConstraints(minWidth: 64),
                child: Center(
                  child: Text('Copy'),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  void copy(String text) async {
    if (text == null || text.isEmpty) {
      showToast("type something to copy", backgroundColor: Colors.red);
      return;
    }
    await Clipboard.setData(ClipboardData(text: controller.text));
    showToast("Copied");
  }

  void showToast(String msg, {Color backgroundColor = Colors.green}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: backgroundColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
