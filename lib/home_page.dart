import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  final SharedPreferences prefs;
  MyHomePage({Key key, this.prefs});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      print('Launching $url...');
      await launch(url);
    } else {
      print('Error launching $url!');
    }
  }

  @override
  Widget build(BuildContext context) {
    var name = widget.prefs.getString('name');

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: (Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      child: Image.asset('assets/now.png'),
                    ),
                    onTap: () {
                      launchURL('https://nowmozilla.club/');
                    },
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 120.0,
                      width: 120.0,
                      child: Image.asset('assets/acm.png'),
                    ),
                    onTap: () {
                      launchURL('https://mpstme.acm.org/#slide=1');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Welcome, $name!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'To the Flutter Workshop\nby NOW Mozilla Club\n& ACM MPSTME',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15.0,
              ),
              RaisedButton(
                child: Text('Change theme'),
                onPressed: () {
                  changeBrightness();
                },
              ),
            ],
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        splashColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) {
              return MyFirebasePage();
            }),
          );
        },
      ),
    );
  }
}
