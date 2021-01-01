import 'package:barburrito_app/screens/insta_webview.dart';
import 'package:barburrito_app/screens/order.dart';
import 'package:barburrito_app/screens/welcomePage.dart';

getroutes(){
  return {
    WelcomePage.route : (context) => WelcomePage(),
    OrderPage.route : (context) => OrderPage(),
    InstaWebViewPage.route : (context) => InstaWebViewPage(),
  };
}