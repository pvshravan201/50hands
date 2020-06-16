import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';



class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
    var clat,clong;


   void _getCurrentLocation()  async {
    final  position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if (this.mounted){
    setState(() {
      // _location="${position.latitude},${position.longitude}";
      clat=position.latitude;
      clong=position.longitude;

    });
    }
    
  }
  

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:clat!=null?
    FlutterMap(
    options: new MapOptions(
      center: new LatLng(clat,clong),
      zoom: 15.0,
    ),
    layers: [
      new TileLayerOptions(
        urlTemplate: "https://api.mapbox.com/styles/v1/shravanpv201/ckbc1x5nw0mtc1ijvxvgfjfha/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2hyYXZhbnB2MjAxIiwiYSI6ImNrYmJzczl6OTAzczQzM29kYnpuMjVmejUifQ.SMgrAdZ-9lpK5EqhtLRmXQ",
        additionalOptions: {
          'accessToken': 'pk.eyJ1Ijoic2hyYXZhbnB2MjAxIiwiYSI6ImNrYmM1Y2tiZjAxMzEyeG5ycTM1cDFrbXgifQ.rui0pxbaTT_gTD9_uGTHAA>',
          'id': 'shravanpv201.ckbbv3mfl237n22o9dlpuijsd-4aw95',
        },
      ),
      new MarkerLayerOptions(
        markers: [
          new Marker(
            width: 80.0,
            height: 80.0,
            point: new LatLng(clat, clong),
            builder: (ctx) =>
            new Container(
              child: Icon(Icons.location_on)
            ),
          ),
        ],
      ),
    ],
  )
                          :
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(height: 15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Patience is Key for Success - 50-Hands Team'),
                                  ],
                                ),
                              ],
                            ),
    
    );
    }
}

