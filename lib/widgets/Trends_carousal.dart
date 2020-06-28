import 'package:coronaApp/widgets/launcher.dart';
import 'package:flutter/material.dart';

class Trendcarousal extends StatefulWidget {
  @override
  _TrendcarousalState createState() => _TrendcarousalState();
}

class _TrendcarousalState extends State<Trendcarousal> {
  List headlines = ['Regular', 'Critical', 'Analysis'];
  List image = [
    'assets/images/virus_good.png',
    'assets/images/graph_1.png',
    'assets/images/chart_1.png'
  ];
  List links = [
    'https://public.tableau.com/views/Canada-GISTrends/IF1GISTRENDS?:embed=y&:showVizHome=no&:host_url=https%3A%2F%2Fpublic.tableau.com%2F&:embed_code_version=3&:tabs=no&:toolbar=yes&:animate_transition=yes&:display_static_image=no&:display_spinner=no&:display_overlay=yes&:display_count=yes&:language=en&publish=yes&:loadOrderID=0',
    'https://public.tableau.com/views/Canada-CIF/IF2CIF?:embed=y&:showVizHome=no&:host_url=https%3A%2F%2Fpublic.tableau.com%2F&:embed_code_version=3&:tabs=no&:toolbar=yes&:animate_transition=yes&:display_static_image=no&:display_spinner=no&:display_overlay=yes&:display_count=yes&:language=en&publish=yes&:loadOrderID=1',
    'https://public.tableau.com/views/Canada-TrendsDay/IF3PERDAY?:embed=y&:showVizHome=no&:host_url=https%3A%2F%2Fpublic.tableau.com%2F&:embed_code_version=3&:tabs=no&:toolbar=yes&:animate_transition=yes&:display_static_image=no&:display_spinner=no&:display_overlay=yes&:display_count=yes&:language=en&publish=yes&:loadOrderID=2',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            String head = headlines[index];
            String img = image[index];
            String hyperLink = links[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      URLLauncher(
                    title: "$head imapcts of Corona ",
                    selectedUrl: "$hyperLink",
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
              child: Container(
                margin: EdgeInsets.all(8),
                width: 250,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      bottom: 15,
                      child: Container(
                        height: 270,
                        width: 250,
                        decoration: BoxDecoration(
                          // color: Colors.blue[100],
                          image: DecorationImage(
                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                              image: NetworkImage(
                                  'https://secure.img1-fg.wfcdn.com/im/80974139/compr-r85/7000/70000190/orlon-canada-map-framed-art.jpg')),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0,20,10,10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // Text(
                              //   '$head',
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.bold, fontSize: 18),
                              // ),
                              Text('$head Reports in Canada',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 0.5),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Image(
                          image: AssetImage('$img'),
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
