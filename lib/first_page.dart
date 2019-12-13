import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_workshop/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatelessWidget {
    final BuildContext context;
    FirstPage({Key: });

    void firstPageChecker() async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        bool isNameSaved = prefs.getBool('isNameSaved') ?? false;

        if(isNameSaved){
            Navigator.push(context, MaterialPageRoute(builder: (context){
                return MyHomePage();
            }));
        }
        }



  @override
  void initState() {
    firstPageChecker();
  }
  Widget build(BuildContext context) {
    return Container();
  }
}
