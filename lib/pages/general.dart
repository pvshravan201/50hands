import 'package:flutter/material.dart';
import 'package:coronaApp/general_faq_option/covid_ques.dart';
import 'package:coronaApp/general_faq_option/health_info.dart';
import 'package:coronaApp/general_faq_option/immi_ques.dart';
import 'package:coronaApp/general_faq_option/paren_ques.dart';
import 'package:coronaApp/general_faq_option/student_faq.dart';
import 'package:coronaApp/general_faq_option/travel_ques.dart';

class GeneralData extends StatefulWidget {
  @override
  _GeneralDataState createState() => _GeneralDataState();
}

class _GeneralDataState extends State<GeneralData> {
  final List<String> entries = <String>[
    'https://50hands.org/wp-content/uploads/2020/04/covid-19-faq.jpg',
    'https://50hands.org/wp-content/uploads/2020/04/immigartion.jpg',
    'https://50hands.org/wp-content/uploads/2020/04/student.jpg',
    'https://50hands.org/wp-content/uploads/2020/04/Health.jpg',
    'https://50hands.org/wp-content/uploads/2020/04/Travel.jpg',
    'https://50hands.org/wp-content/uploads/2020/04/health-services.jpg'
  ];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
    // crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left:8.0,right:8,top:16),
          child: GridView.count(
            childAspectRatio: 4 / 3,
            crossAxisCount: 2,
            children: List.generate(entries.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${entries[index]}'),
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.circular(24)
                    ),
                  ),
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CovidInfo()),
                      );
                    } else if(index==1){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImmiInfo()),
                      );
                    }else if(index==2){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudInfo()),
                      );
                    } else if(index==3){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HealthInfo()),
                      );
                    } else if(index==4){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TravelInfo()),
                      );
                    } else if(index==5){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ParenInfo()),
                      );
                    }
                  },
                ),
              );
            }),
          ),
        ),
      ),
      // GestureDetector(
      //   child: Column(
      //     crossAxisAlignment:CrossAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         'For more detailed FAQ\'s please visit our',
      //         style: TextStyle(
      //           color: Colors.red[500],
      //           fontWeight: FontWeight.w600,
      //           fontSize: 18,
      //         ),
      //       ),
      //     ],
      //   ),
      //   onTap: () async{
      //     const url = "https://50hands.org/faq/";
      //     if (await canLaunch(url))
      //       launch(url);
      //   },
      // ),
      // GestureDetector(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         'official site 50Hands.org ',
      //         style: TextStyle(
      //           color: Colors.red[500],
      //           fontWeight: FontWeight.w600,
      //           fontSize: 18,
      //         ),
      //       ),
      //       Text(
      //         '(CLICK ME) ',
      //         style: TextStyle(
      //           color: Colors.blue[500],
      //           fontWeight: FontWeight.w600,
      //           fontSize: 18,
      //         ),
      //       ),
      //     ],
      //   ),
      //   onTap: () async{
      //     const url = "https://50hands.org/faq/";
      //     if (await canLaunch(url))
      //       launch(url);
      //   },
      // ),
    ],
          ),
    );
  }
}