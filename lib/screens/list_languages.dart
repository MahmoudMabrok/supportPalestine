import 'package:flutter/material.dart';
import 'package:save_palestine/data.dart';
import 'package:save_palestine/helper/helpers.dart';
import 'package:save_palestine/screens/languages_detail.dart';

class ListLanguages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Stand with Palestine'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Please select a language',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 26),
                ),
                SizedBox(
                  height: 10,
                ),
                ...languagesOfPosts.map((e) => InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(LanguagesDetail.routeName, arguments: e);
                      },
                      focusColor: Colors.deepPurple,
                      child: Card(
                        elevation: 4,
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            e,
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    HelperMethods.launchURL(
                        'https://m.facebook.com/story.php?story_fbid=4060454960683412&id=100001568430877');
                  },
                  child: Text(
                      'All data comes from brothers, i found them on facebook, click me to see them'),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      HelperMethods.launchURL(
                          'https://www.linkedin.com/in/mahmoud-mabrouk-fouad/');
                    },
                    child: Text('Developed by Mahmoud ^_^')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
