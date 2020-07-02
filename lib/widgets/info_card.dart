import 'package:coronaApp/constants.dart';
import 'package:flutter/cupertino.dart';
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
          return Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Container(
              //width: MediaQuery.of(context).size.width/3.3,
              decoration: BoxDecoration(
                color: Colors.white,
//              boxShadow: [
//                        BoxShadow(
//                          color: Colors.black26,
//                          offset: Offset(0.0, 2.0),
//                          blurRadius: 6.0,
//                        ),
//                      ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: iconColor,
                            shape: BoxShape.circle,
                          ),
//                          child: SvgPicture.asset(
//                            "assets/icons/running.svg",
//                            height: 15,
//                            width: 15,
//                            color: iconColor,
//                          ),
                        ),
                        SizedBox(width:8),
                        Text(
                          title,style: TextStyle(fontSize:20,fontWeight: FontWeight.w600,color: iconColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:24.0),
                    child: RichText(
                      text: TextSpan(
                          style:TextStyle(color:kTextColor),
                        children: [
                          TextSpan(text:'$effectedNum\n',style: TextStyle(fontWeight: FontWeight.w600,
                              color: Colors.black,fontSize: 16)),
                          TextSpan(text: 'cases',style: TextStyle(fontSize: 12,height: 1.5,color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

    );
  }
}