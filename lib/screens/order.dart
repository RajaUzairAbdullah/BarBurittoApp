import 'package:barburrito_app/screens/insta_webview.dart';
import 'package:barburrito_app/screens/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class OrderPage extends StatefulWidget {
  static String route = "OrderPage";
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int _currentIndex = 0;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _logo() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      child: Image.asset(
        "assets/images/applogo.png",
        height: MediaQuery.of(context).size.width * 0.6,
      ),
    );
  }

  Widget _resturantview(String image) {
    return Container(
      width: 65.0,
      height: 65.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(image),
        ),
        border: Border.all(
          color: Colors.black54,
          width: 2.0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        color: Colors.white,
      ),
    );
  }

  Widget _linkbutton(String title, String url, double size) {
    return Expanded(
      child: Material(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: InkWell(
            splashColor: Color(0xffED838E),
            child: Container(
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Color(0xffC00014), width: 2),
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Flexible(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: size,
                        color: Color(0xffC00014),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            onTap: () {
              print("$url");
              _launchInBrowser(url);
            },
          ),
        ),
      ),
    );
  }

  Widget _precaution() {
    return Text(
      'Choose location closer to your delivery address',
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
      textAlign: TextAlign.end,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColorStart: Color(0xffC00014),
          backgroundColorEnd: Color(0xffC00014),
          title: Text("Orders Page", style: TextStyle(fontSize: 20.0)),
        ),
        body: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _logo(),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _resturantview('assets/images/glovo.png'),
                              Expanded(
                                  child: Column(
                                children: [
                                  Row(children: [
                                    _linkbutton(
                                        "Visit",
                                        "https://glovoapp.com/en/mil/store/burrito-bar-mil/",
                                        12),
                                  ]),
                                  SizedBox(height: 10),
                                  _precaution()
                                ],
                              )),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _resturantview('assets/images/deliveroo1.png'),
                              Expanded(
                                  child: Column(
                                children: [
                                  Row(children: [
                                    _linkbutton(
                                        "PORTA ROMANA",
                                        "https://deliveroo.it/menu/milano/porta-venezia/burrito-brothers?day=today&geohash=u0nd8u5p5t1d&time=1700",
                                        12),
                                    _linkbutton(
                                        "PORTA VENEZIA",
                                        "https://deliveroo.it/en/menu/milano/isola/burrito-brothers",
                                        12),
                                    _linkbutton(
                                        "SAN SIRO",
                                        "https://deliveroo.it/it/menu/milano/milano-fiera-city-life/burrito-brothers-milano-san-siro",
                                        12),
                                  ]),
                                  SizedBox(height: 10),
                                  _precaution()
                                ],
                              )),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _resturantview('assets/images/justeat.png'),
                              Expanded(
                                  child: Column(
                                children: [
                                  Row(children: [
                                    _linkbutton(
                                        "PORTA ROMANA",
                                        "https://www.justeat.it/restaurants-burrito-bar-porta-romana-milanoje",
                                        12),
                                    _linkbutton(
                                        "PORTA VENEZIA",
                                        "https://www.justeat.it/restaurants-burrito-bar-milano",
                                        12),
                                    _linkbutton(
                                        "SAN SIRO",
                                        "https://www.justeat.it/restaurants-burrito-bar---milano-milano",
                                        12),
                                  ]),
                                  SizedBox(height: 10),
                                  _precaution()
                                ],
                              )),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _resturantview('assets/images/mymenu.png'),
                              Expanded(
                                  child: Column(
                                children: [
                                  Row(children: [
                                    _linkbutton(
                                        "PORTA ROMANA",
                                        "https://milano.mymenu.it/ristoranti/burrito-bar-bocconi/",
                                        12),
                                    _linkbutton(
                                        "PORTA VENEZIA",
                                        "https://milano.mymenu.it/ristoranti/burrito-bar-pta-venezia/",
                                        12),
                                  ]),
                                  SizedBox(height: 10),
                                  _precaution()
                                ],
                              )),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _resturantview('assets/images/ubereats.png'),
                              Expanded(
                                  child: Column(
                                children: [
                                  Row(children: [
                                    _linkbutton(
                                        "PORTA ROMANA",
                                        "https://www.ubereats.com/it-en/milano/food-delivery/burrito-bar-bligny/7UBmB0ewSjK25w0LnBEwaQ",
                                        12),
                                    _linkbutton(
                                        "PORTA VENEZIA",
                                        "https://www.ubereats.com/it-en/milano/food-delivery/burrito-bar-casati/XgpXwMC8TXW9bpb40Lj03Q",
                                        12),
                                    _linkbutton(
                                        "SAN SIRO",
                                        "https://www.ubereats.com/it/milano/food-delivery/burrito-bar-san-siro/CXEmmFhrTO2FHBGtvH07bg",
                                        12),
                                  ]),
                                  SizedBox(height: 10),
                                  _precaution()
                                ],
                              )),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            )),
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
              if (_currentIndex == 1) {
              Navigator.pushReplacementNamed(context, WelcomePage.route);
            }else if (_currentIndex == 2) {
              print("Home");
              Navigator.pushReplacementNamed(context, InstaWebViewPage.route);
            }
            });
            
          },
        ));
  }
}
