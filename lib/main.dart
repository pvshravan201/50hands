import 'package:coronaApp/pages/coronatab.dart';
import 'package:coronaApp/pages/home.dart';
import 'package:coronaApp/pages/hometab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:coronaApp/widgets/map.dart';


void main() {
  runApp(MaterialApp(
      initialRoute:'/home' ,
    routes: {
        // '/':(context)=>Splash(),
      '/home':(context)=>Home(),
      '/had':(context)=>Hometab(),
      '/her':(context)=>Coronatab(),
      '/map':(context)=>Map(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6),
        (){
          Navigator.pushReplacementNamed(context, '/home');
        },);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child:Shimmer.fromColors(
                baseColor: Colors.black,
                highlightColor: Colors.lime,
                period: Duration(seconds: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget>[
                    Icon(
                      Icons.all_inclusive,
                      size:300,
                    ),
                  ]
              ),),),
            Center(
              child:Text('50-Hands Organisation',style: TextStyle(fontFamily: 'Pacifier',fontSize: 30),),
            ),
          ],
        )
    );
  }
}
