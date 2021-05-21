import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  var controle = TextEditingController();

  var computedString = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state.toString());
  }

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
