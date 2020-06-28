import 'package:flutter/material.dart';

class FeatureList extends StatelessWidget {
  List tabName=['Covid Insights','Jobs','Around Me','Blogs'];
  List desc=['Pictorial representation','Find or Hire','Events,School,Hospital...','Want to Read Something'];
  List color=[Colors.pinkAccent[100],Colors.indigo,Colors.teal,Colors.deepOrange[300]];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body:Padding(
          padding: const EdgeInsets.fromLTRB(8, 36, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:8),
                child: Text('What are you looking for today?',
                  style: TextStyle(
                    color:Colors.black,
                    fontSize:24,
                    fontWeight:FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection:Axis.horizontal,
                  shrinkWrap:true,
                itemCount: tabName.length,
                itemBuilder: (BuildContext ctxt, int index){
                  String head = tabName[index];
                  String descr = desc[index];
                  Color col = color[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8,10.0,10,10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: col,
                      ),
                      width: 150,
                      height: 160,
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image(image: AssetImage('assets/images/virus_good.png'),
                            height: 50,
                            width: 50,
                          ),
                          Text('$head',
                          style:TextStyle(fontSize:14,color:Colors.white,fontWeight:FontWeight.w600)),
                          Text('$descr',
                          style:TextStyle(fontSize:20,color:Colors.white,fontWeight:FontWeight.w200)),
                        ]
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}