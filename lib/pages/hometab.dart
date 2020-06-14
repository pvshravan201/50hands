import 'package:coronaApp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';


class Hometab extends StatefulWidget {
  @override
  _HometabState createState() => _HometabState();
}

class _HometabState extends State<Hometab> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body:SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Card(
            
            elevation: 25,
                      child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              
              
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Text('Our Motivation :',style: TextStyle(
                            fontSize: 20,
                            fontFamily: '',
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),),
                        ),
                        Divider(indent:60,endIndent: 60,color: Colors.lime,thickness: 2,),

                        SizedBox(height: 10,),

                        Text('Canada discovered Insulin and gave the patent free to the world so that its available for All .Yet today , We struggle to get Medical Supplies for our own citizens.\n \n 50-Hands Organization is established to galvanize the Canadian Volunteer & Maker community to support the Government and other institutions to address community challenges.  ',style: TextStyle(
                          fontSize: 15,
                          fontFamily: '',
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                        ),),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Carousel(
                    borderRadius: true,
                    boxFit: BoxFit.fitWidth,
                    indicatorBgPadding: 15,
                    overlayShadow:false,
                    showIndicator: false,
                    images:[
                      AssetImage('assets/images/1.jpg'),
                      AssetImage('assets/images/2.jpg'),
                      AssetImage('assets/images/3.jpg'),
                    ],
                    animationDuration: Duration(milliseconds: 400),
                    animationCurve: Curves.bounceInOut,
                  ),
                ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15),
                          color: Colors.transparent,
                           ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 5,),
                              Center(
                                child: Text('Our Vision : ',style: TextStyle(
                                fontSize: 20,
                                fontFamily: '',
                                fontWeight: FontWeight.bold,
                                ),),
                              ),
                                  Divider(indent:60,endIndent: 60,color: Colors.lime,thickness: 2,),

                                SizedBox(height: 10,),
                              Text('Using Data Driven- Models , 50-Hands intend to provide crowd sourced solutions @scale that shall make a long-lasting difference to Canadians as well as Global Citizens in need. ',style: TextStyle(
                              fontSize: 15,
                              fontFamily: '',
                                fontWeight: FontWeight.normal,
                              ),),
                              ],
                               ),
                        ),
                           ),
                SizedBox(height: 15,),            
              ]),
            ),
          )
      ),
      ),
    );
  }
}
