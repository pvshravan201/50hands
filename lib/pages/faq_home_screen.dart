import 'package:flutter/material.dart';
import 'package:coronaApp/pages/canada_faq.dart';
import 'package:coronaApp/pages/chat_bot.dart';
import 'general.dart';
import 'package:coronaApp/pages/india_faq.dart';
import 'package:coronaApp/pages/usa_faq.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:coronaApp/pages/general.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<String> categories = ['General', 'Canada', 'India', 'USA'];
  Widget wow = GeneralData();
  Future<void> _launched;
  String toLaunch = 'https://50hands.org/';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "FAQ' s",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          elevation: 0.0,
          leading: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 4, 0, 0),
                child: Image(image: AssetImage('assets/images/nila_chatbot.png')),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ChatBot()));
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.laptop_windows,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _launched = _launchInBrowser(toLaunch);
                });
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 55.0,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(20),
                //     bottomRight: Radius.circular(20)),
                //color: Colors.blue,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          if (index == 0) {
                            wow = GeneralData();
                          } else if (index == 1) {
                            wow = CanadaFAQ();
                          } else if (index == 2) {
                            wow = IndiaFAQ();
                          } else {
                            wow = USAFAQ();
                          }
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 12.0,
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: index == selectedIndex
                                ? Colors.white
                                : Colors.white54,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: wow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
