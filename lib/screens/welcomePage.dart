import 'package:barburrito_app/screens/insta_webview.dart';
import 'package:barburrito_app/screens/order.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  static String route = "WelcomePage";
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  int _currentIndex = 1;
  Widget _logo() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      child: Image.asset(
        "assets/images/applogo.png",
        height: MediaQuery.of(context).size.width * 0.6,
      ),
    );
  }

  Widget _heading() {
    return (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: 'BUILD YOUR OWN ',
              style: GoogleFonts.frederickaTheGreat(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: MediaQuery.of(context).size.width * 0.09,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
              ),
            ),
            TextSpan(
              text: 'BU',
              style: GoogleFonts.frederickaTheGreat(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: MediaQuery.of(context).size.width * 0.09,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
              ),
            ),
            TextSpan(
              text: 'RR',
              style: GoogleFonts.frederickaTheGreat(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: MediaQuery.of(context).size.width * 0.09,
                fontWeight: FontWeight.w700,
                color: Color(0xffC00014),
              ),
            ),
            TextSpan(
              text: 'ITO',
              style: GoogleFonts.frederickaTheGreat(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: MediaQuery.of(context).size.width * 0.09,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
              ),
            )
          ]),
        ),
        SizedBox(height: 30),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: 'O',
              style: GoogleFonts.frederickaTheGreat(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: MediaQuery.of(context).size.width * 0.09,
                fontWeight: FontWeight.w700,
                color: Color(0xffC00014),
              ),
            ),
            TextSpan(
              text: 'rder ',
              style: GoogleFonts.frederickaTheGreat(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: MediaQuery.of(context).size.width * 0.09,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
              ),
            ),
            TextSpan(
              text: 'O',
              style: GoogleFonts.frederickaTheGreat(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: MediaQuery.of(context).size.width * 0.09,
                fontWeight: FontWeight.w700,
                color: Color(0xffC00014),
              ),
            ),
            TextSpan(
              text: 'n',
              style: GoogleFonts.frederickaTheGreat(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: MediaQuery.of(context).size.width * 0.09,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
              ),
            ),
          ]),
        ),
        // Text('Order On',
        //     textAlign: TextAlign.center,
        //     style: GoogleFonts.frederickaTheGreat(
        //       textStyle: Theme.of(context).textTheme.caption,
        //       fontSize: MediaQuery.of(context).size.width * 0.09,
        //       fontWeight: FontWeight.w700,
        //       color: Color(0xff004253),
        //     )),
      ],
    ));
  }

  Widget _resturantview(String image) {
    return Container(
      width: 60.0,
      height: 60.0,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _logo(),
                _heading(),
                SizedBox(height: MediaQuery.of(context).size.width * 0.2),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Wrap(
                      spacing: 15.0,
                      runSpacing: 10.0,
                      alignment: WrapAlignment.center,
                      children: [
                        _resturantview('assets/images/glovo.png'),
                        _resturantview('assets/images/deliveroo1.png'),
                        _resturantview('assets/images/justeat.png'),
                        _resturantview('assets/images/mymenu.png'),
                        _resturantview('assets/images/ubereats.png')
                      ]),
                )
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
              if (_currentIndex == 0) {
              print("Home");
              Navigator.pushReplacementNamed(context, OrderPage.route);
            }else if (_currentIndex == 2) {
              print("Home");
              Navigator.pushReplacementNamed(context, InstaWebViewPage.route);
            }
            });
            
          },
        )
    );
  }
}
