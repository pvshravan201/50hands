import 'package:coronaApp/pages/hometab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:coronaApp/widgets/info_card.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:core';

class Coronatab extends StatefulWidget {
  @override
  _CoronatabState createState() => _CoronatabState();
}

class _CoronatabState extends State<Coronatab> {
  List data;
  Map wdata;

  final GlobalKey _scaffoldKey = new GlobalKey();

  Future<void> getdata() async {
    http.Response response = await http.get(
        Uri.encodeFull(
            'https://api.covid19api.com/total/dayone/country/canada'),
        headers: {'Accept': 'application/json'});
    if (this.mounted) {
      setState(() {
        data = json.decode(response.body);
      });
    }
  }

  Future<void> getWorldData() async {
    http.Response response = await http.get(
        Uri.encodeFull('https://api.covid19api.com/world/total'),
        headers: {'Accept': 'application/json'});
    if (this.mounted) {
      setState(() {
        wdata = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.getdata();
    getWorldData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          bottomOpacity: 0,
          backgroundColor: Colors.white,
          title: Text(
            '50-Hands',
            style: TextStyle(
                fontFamily: "Pacifier", fontSize: 22, color: Colors.black),
          ),
          centerTitle: true,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.apps,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        ),
        drawer: Drawer(child: Hometab()),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      "Total Corona Cases Around",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          SizedBox(
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Worldcard(wdata: wdata),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Countrycard(data: data),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Precautions For Covid-19',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Precautionstab(
                    address: "assets/icons/use_mask.svg",
                    title: "Use Masks",
                  ),
                  Precautionstab(
                    address: "assets/icons/hand_wash.svg",
                    title: "Wash Hands",
                  ),
                  Precautionstab(
                    address: "assets/icons/Clean_Disinfect.svg",
                    title: "Dis-Infectants",
                  ),
                  Precautionstab(
                    address: "assets/icons/distance.svg",
                    title: "\t\tSocial\nDistancing",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Symptoms of Covid-19',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Symtab(
                    address: 'assets/images/1.png',
                    title: "Fever",
                  ),
                  Symtab(
                    address: "assets/images/2.png",
                    title: "Cough",
                  ),
                  Symtab(
                    address: "assets/images/3.png",
                    title: "Head-Ache",
                  ),
                  Symtab(
                    address: "assets/images/4.png",
                    title: "Breathing",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Worldcard extends StatelessWidget {
  const Worldcard({
    Key key,
    @required this.wdata,
  }) : super(key: key);

  final Map wdata;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      borderOnForeground: true,
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
        ),
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/earth.svg',
                  height: 50,
                  width: 30,
                  allowDrawingOutsideViewBox: false,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Global",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
            wdata == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 20),
                      CircularProgressIndicator(
                        backgroundColor: Colors.black,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            InfoCard(
                              title: 'Confirmed',
                              iconColor: Colors.blue,
                              effectedNum: wdata['TotalConfirmed'].toString(),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InfoCard(
                              title: 'Recovered',
                              iconColor: Colors.green,
                              effectedNum: wdata['TotalRecovered'].toString(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(
                              width: 55,
                            ),
                            InfoCard(
                              title: 'Deaths',
                              iconColor: Colors.red,
                              effectedNum: wdata['TotalDeaths'].toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class Precautionstab extends StatelessWidget {
  final String address;
  final String title;
  const Precautionstab({
    this.address,
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            address,
            height: 70,
            width: 70,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class Symtab extends StatelessWidget {
  final String address;
  final String title;
  const Symtab({this.address, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              address,
              height: 70,
              width: 70,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class Countrycard extends StatelessWidget {
  const Countrycard({
    Key key,
    @required this.data,
  }) : super(key: key);

  final List data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      borderOnForeground: true,
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/canada.svg',
                  height: 60,
                  width: 50,
                  allowDrawingOutsideViewBox: false,
                ),
                Text(
                  'Canada',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
            data == null
                ? Center(
                    child: Row(
                    children: [
                      SizedBox(width: 20),
                      CircularProgressIndicator(
                        backgroundColor: Colors.black,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ],
                  ))
                : Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            InfoCard(
                              title: 'Confirmed',
                              iconColor: Colors.blue,
                              effectedNum:
                                  data[data.length - 1]['Confirmed'].toString(),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InfoCard(
                              title: 'Recovered',
                              iconColor: Colors.green,
                              effectedNum:
                                  data[data.length - 1]['Recovered'].toString(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            InfoCard(
                              title: 'Deaths',
                              iconColor: Colors.red,
                              effectedNum:
                                  data[data.length - 1]['Deaths'].toString(),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InfoCard(
                              title: 'New',
                              iconColor: Colors.deepPurple,
                              effectedNum:
                                  data[data.length - 1]['Active'].toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
