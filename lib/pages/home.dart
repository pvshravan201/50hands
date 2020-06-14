
import 'package:coronaApp/pages/coronatab.dart';
import 'package:coronaApp/pages/faq_home_screen.dart';
import 'package:coronaApp/pages/help.dart';
import 'package:coronaApp/pages/payment.dart';
import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page=2;
  
  final tabs=[
    HomeScreen(),
    Payment(),
    Coronatab(),
    Text('Corona and me'),
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
          barBackgroundColor: Colors.white,
          selectedItemBackgroundColor: Colors.black,
          selectedItemBorderColor: Colors.white,
          unselectedItemLabelColor: Colors.black,
          showSelectedItemShadow: false,
          unselectedItemIconColor: Colors.black,
          unselectedItemBackgroundColor: Colors.transparent,
          barHeight: 60,
          itemWidth: 55,
        ),
        selectedIndex: _page,
        onSelectTab: (index){
          setState(() {
            _page=index;
          });
        },

        items: [
          FFNavigationBarItem(
            iconData: Icons.question_answer,
              label: "FAQ",

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
            iconData: Icons.add_circle_outline
,
            label: 'Corona',

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
