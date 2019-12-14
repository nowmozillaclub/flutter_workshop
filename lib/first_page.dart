import 'package:flutter/material.dart';
import 'package:flutter_workshop/home_page.dart';
import 'package:flutter_workshop/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  void firstPageChecker() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

    if (isFirstLaunch) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return MyIntroPage(prefs: prefs);
      }), (Route<dynamic> route) => false);
    } else {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return MyHomePage(prefs: prefs);
      }), (Route<dynamic> route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    firstPageChecker();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
