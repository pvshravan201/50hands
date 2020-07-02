import 'package:coronaApp/widgets/launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'screen_kunj.dart';

class FeatureList extends StatefulWidget {
  @override
  _FeatureListState createState() => _FeatureListState();
}

class _FeatureListState extends State<FeatureList> {
  List tabName = ['Covid Insights', 'Around Me', 'Jobs', 'Blogs'];

  List desc = [
    'Deep Analysis of Covid-19',
    'Events,School,Hospital...',
    'Find or Hire',
    'Want to Read Something'
  ];

  List color = [
    Colors.indigo,
    Colors.pinkAccent[100],
    Colors.teal,
    Colors.deepOrange[300]
  ];

  List images = [
    'assets/images/graph_1.png',
    'assets/images/infrastructure.png',
    'assets/images/opportunity.png',
    'assets/images/blog.png'
  ];
  List links = [
    'https://public.tableau.com/views/Covid-19Canada-1M/UnifiedView?:embed=y&:showVizHome=no&:host_url=https%3A%2F%2Fpublic.tableau.com%2F&:embed_code_version=3&:tabs=no&:toolbar=yes&:animate_transition=yes&:display_static_image=no&:display_spinner=no&:display_overlay=yes&:display_count=yes&:language=en&publish=yes&:loadOrderID=3',
    'https://public.tableau.com/views/Covid19IndiaDesktop-1/INDIANDASHBOARD-1?:embed=y&:showVizHome=no&:host_url=https%3A%2F%2Fpublic.tableau.com%2F&:embed_code_version=3&:tabs=no&:toolbar=yes&:animate_transition=yes&:display_static_image=no&:display_spinner=no&:display_overlay=yes&:display_count=yes&:language=en-GB&publish=yes&:loadOrderID=0',
    'https://public.tableau.com/views/Covid-19USA-Desktop1/USAIF1-Desktop?:embed=y&:showVizHome=no&:host_url=https%3A%2F%2Fpublic.tableau.com%2F&:embed_code_version=3&:tabs=no&:toolbar=yes&:animate_transition=yes&:display_static_image=no&:display_spinner=no&:display_overlay=yes&:display_count=yes&:language=en&publish=yes&:loadOrderID=0',
  ];
  Color c1 = Colors.black;

  Color c2 = Colors.blue;

  Widget _buildAboutDialog(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.only(bottom: 0),
      contentPadding: EdgeInsets.fromLTRB(16, 8, 8, 8),
      title: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20))
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  'Choose the country !',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    URLLauncher(
                  title: " Imapcts of Corona in Canada",
                  selectedUrl: "${links[0]}",
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var begin = Offset(0.0, 1.0);
                  var end = Offset.zero;
                  var curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ));
            },
            child: ListTile(
              dense: true,
              contentPadding:EdgeInsets.all(0),
              leading: Image(image:AssetImage('assets/images/canada.png'),height: 40,width: 40,),
              title: Text(
                'Canada',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),

            ),
          ),
          Divider(
            height: 3,
            thickness: 2,
            color: Colors.black,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => URLLauncher(
                      title: " Imapcts of Corona in India",
                      selectedUrl: "${links[1]}",
                    ),
                  ));
            },
            child: ListTile(
              dense: true,
              contentPadding:EdgeInsets.all(0),
              leading: Image(image:AssetImage('assets/images/india_flag.jpg'),height: 40,width: 40,),
              title: Text(
                'India',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),

            ),
          ),
          Divider(
            height: 3,
            thickness: 2,
            color: Colors.black,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => URLLauncher(
                      title: " Imapcts of Corona in America",
                      selectedUrl: "${links[2]}",
                    ),
                  ));
            },
            child: ListTile(
              dense: true,
              contentPadding:EdgeInsets.all(0),
              leading: Image(image:AssetImage('assets/images/america.jpg'),height: 40,width: 40,),
              title: Text(
                'America',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
             
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 36, 16, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 4),
                  child: Text(
                    'What are you looking for?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 260,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: tabName.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        String head = tabName[index];
                        String descr = desc[index];
                        Color col = color[index];
                        String img = images[index];
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 10.0, 10, 10),
                          child: GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _buildAboutDialog(context),
                                );
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: col,
                              ),
                              width: 150,
                              height: 240,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: GestureDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _buildAboutDialog(context),
                                      );
                                    }
                                  },
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Image(
                                          image: AssetImage('$img'),
                                          height: 100,
                                          width: 80,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('$head',
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('$descr',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w300)),
                                          ],
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 16, 0),
                  child: ListTile(
                      title: Text("News in Trend",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          )),
                      trailing: GestureDetector(
                          onTap: () {
                            Fluttertoast.showToast(
                                msg: "Refreshed...",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                textColor: Colors.blueAccent[700],
                                fontSize: 16.0);
                          },
                          child: Icon(
                            Icons.refresh,
                            color: Colors.indigo,
                          ))),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(height: 510, child: QuoteList()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
