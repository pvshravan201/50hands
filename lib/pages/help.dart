import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:coronaApp/widgets/map.dart';
import 'package:geolocator/geolocator.dart';



class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {

  String _phone = "911";
  Future<void> _launched;




  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

 
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                            image: DecorationImage(
                              image: AssetImage("assets/images/virus2.png",),
                              fit: BoxFit.contain,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15,),
                          Text("Are you feeling sick?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                          SizedBox(height: 15,),
                          Text("If you feel sick with any COVID-19 Symptoms" ,style: TextStyle(fontSize: 15),),
                          SizedBox(height: 5,),
                          Text("Please call immediately for help.",style: TextStyle(fontSize: 15),),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/nurse.svg",height: 70,),
                              GestureDetector(
                                 onTap: (){ setState(() {
                                    _launched = _makePhoneCall('tel:$_phone');

                                 });},
                                  child: Container(
                                  height: 50,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.call,color: Colors.white,),
                                      Text("Call Now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                   ),
                    SizedBox(height: 15,),
                    Text("Testing Centers Near By",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                         child:Map() ,
                        ),
                    ),
                      
                  ],
                ),
          ),
          
          
      ),
    );
  }
}