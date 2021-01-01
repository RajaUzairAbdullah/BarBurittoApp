import 'package:barburrito_app/screens/order.dart';
import 'package:barburrito_app/screens/welcomePage.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:async';

const URL = "https://www.instagram.com/burritobar_it/";

class InstaWebViewPage extends StatefulWidget {
  static String route = "InstaWebViewPage";
  @override
  _InstaWebViewPageState createState() => _InstaWebViewPageState();
}

class _InstaWebViewPageState extends State<InstaWebViewPage> {
  int _currentIndex = 2;
final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColorStart: Color(0xffC00014),
        backgroundColorEnd: Color(0xffC00014),
        title: Text("Instagram Page", style: TextStyle(fontSize: 20.0)),
      ),
      body: new WebviewScaffold(
        url: URL,
        withJavascript: true,
        withLocalStorage: true,
      ),
              bottomNavigationBar: CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: Color(0xffC00014),
          strokeColor: Color(0xffC00014),
          unSelectedColor: Color(0xffacacac),
          backgroundColor: Colors.white,
          items: [
            CustomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Orders"),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.lightbulb_outline),
              title: Text("Instagram"),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              if (_currentIndex == 0) {
              Navigator.pushReplacementNamed(context, OrderPage.route);
            }else if (_currentIndex == 1) {
              Navigator.pushReplacementNamed(context, WelcomePage.route);
            }
            });
            
          },
        )
    );
  }
}
