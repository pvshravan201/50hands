import '../widgets/launcher.dart';
import 'package:flutter/material.dart';
import '../models/quote.dart';

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _QuoteListState extends State<QuoteList> {
  List title=["Loading"];
  List imageUrl=["https://50hands.org/wp-content/uploads/2020/04/about-50-hands.jpg"];
  List description=["Loading"];
  List url=["Loading"];

  void getData() async {
    Quote cases = Quote();
    await cases.getData();
    if(this.mounted){
    setState(() {
      title = cases.title;
      imageUrl = cases.imageUrl;
      description = cases.description;
      url = cases.url;
    });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: title.length,
        itemBuilder: (BuildContext context, int index) {
          String t = title[index];
          String d = description[index];
          String i = imageUrl[index];
          String u = url[index];
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: 240.0,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Positioned(
                    bottom: 15.0,
                    child: Container(
                      height: 390,
                      width: 240.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '$t',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                            ),
                            Text(
                              '$d',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height:10),
                            GestureDetector(
                              child: Text('Want to Read More Click Me or GoTo $u',style: TextStyle(color: Colors.red),),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        URLLauncher(
                                          title: "More...",
                                          selectedUrl: "$u",
                                        )));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: <Widget>[
                        Hero(
                          tag: i,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              color:Color(0xFFFF99),
                              child: Image(
                                height: 200.0,
                                width: 380.0,
                                image: NetworkImage(i),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}