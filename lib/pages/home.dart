
import 'package:coronaApp/pages/coronatab.dart';
import 'package:coronaApp/pages/faq_home_screen.dart';
import 'package:coronaApp/pages/help.dart';
import 'package:coronaApp/pages/payment.dart';
import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

import 'corona_final.dart';
import 'corona_info.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page=2;
  
  final tabs=[
    FeatureList(),
    Payment(),
    Coronatab(),
    HomeScreen(),
    Help(),
   ];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar:FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Color(0xFF344955),
          selectedItemBackgroundColor: Color(0xFFF9AA33),
          selectedItemBorderColor: Colors.white,
          selectedItemLabelColor: Colors.blueGrey[50],
          unselectedItemLabelColor: Colors.white,
          showSelectedItemShadow: false,
          unselectedItemIconColor: Colors.blueGrey[50],
          unselectedItemBackgroundColor: Colors.transparent,
          barHeight: 65,
          itemWidth: 60,
        ),
        selectedIndex: _page,
        onSelectTab: (index){
          setState(() {
            _page=index;
          });
        },

        items: [
          FFNavigationBarItem(
            iconData: Icons.new_releases,
              label: "Features",

          ),
          FFNavigationBarItem(
            iconData: Icons.healing,
            label: "Support",
          ),
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',

          ),
          FFNavigationBarItem(
            iconData: Icons.question_answer
,
            label: 'FAQ',

          ),
          FFNavigationBarItem(
            iconData: Icons.help,
            label: 'Help',

          ),
        ],
      ),
      body: tabs[_page],


    );
  }
}
