import 'package:coronaApp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';



class InfoCard extends StatelessWidget {
  final String title;
  final String effectedNum;
  final Color iconColor;


  const InfoCard({
    Key key,
    this.title,
    this.effectedNum,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: MediaQuery.of(context).size.width/3.3,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: iconColor.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/running.svg",
                          height: 15,
                          width: 15,
                          color: iconColor,
                        ),
                      ),
                      SizedBox(width:8),
                      Text(
                        title,style: TextStyle(fontSize:11,fontWeight: FontWeight.bold,color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: RichText(
                      text: TextSpan(
                          style:TextStyle(color:kTextColor),
                        children: [
                          TextSpan(text:'$effectedNum\n',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                          TextSpan(text: 'Cases',style: TextStyle(fontSize: 8,height: 2,color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

    );
  }
}