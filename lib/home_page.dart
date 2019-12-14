import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                  Container(
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset('assets/now.png'),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    height: 120.0,
                    width: 120.0,
                    child: Image.asset('assets/acm.png'),
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
            ],
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.brightness_5),
        splashColor: Colors.blue,
        onPressed: () {
          changeBrightness();
        },
      ),
    );
  }
}
