import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:save_palestine/data.dart';
import 'package:save_palestine/helper/helpers.dart';
import 'package:save_palestine/models/PostModel.dart';

class LanguagesDetail extends StatelessWidget {
  static const routeName = '/language-details';

  List<Widget> buildGrid(List<LinkPage> data) {
    return data
        .map((e) => ElevatedButton(
            onPressed: () {
              HelperMethods.launchURL(e.url);
            },
            child: Text(e.title)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final lang = ModalRoute.of(context).settings.arguments as String;
    final data = allData.firstWhere((element) => element.language == lang);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('$lang'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Container(
            child: Column(
              children: [
                ..._buildSectionHeader(context, 'Pages to post at'),
                Container(
                  width: double.infinity,
                  height: 150,
                  child: GridView.extent(
                    maxCrossAxisExtent: 150,
                    padding: const EdgeInsets.all(12),
                    childAspectRatio: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: buildGrid(data.pages),
                  ),
                ),
                ..._buildSectionHeader(context, 'Posts to post there.'),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, indx) =>
                        buildPost(ctx, data.comments[indx]),
                    itemCount: data.comments.length,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

Widget buildPost(BuildContext context, String comment) {
  return Card(
    color: Theme.of(context).primaryColor,
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            comment.replaceAllMapped('  ', (match) => ''),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          IconButton(
              icon: Icon(Icons.copy),
              color: Colors.white,
              onPressed: () {
                Clipboard.setData(
                    ClipboardData(text: _buildClipboardText(comment)));
                Fluttertoast.showToast(
                    msg: "Copied",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }),
          Text(
            '${comment.length} character',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          )
        ],
      ),
    ),
  );
}

String _buildClipboardText(String comment) {
  return '$comment \n #Gaza_Under_Attack';
}

List<Widget> _buildSectionHeader(BuildContext context, String s) {
  return [
    ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: Theme.of(context).primaryColorDark,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Text(
            s,
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
        ),
      ),
    ),
    SizedBox(
      height: 10,
    )
  ];
}
