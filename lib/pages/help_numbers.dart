import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelplineNumbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Helpline Numbers'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('General Helpline Number'),
                subtitle: Text('1-833-784-4397'),
                trailing: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                onTap: ()=>launch("tel://1-833-784-4397"),
              ),
              ListTile(
                title: Text('Alberta'),
                subtitle: Text('811'),
                trailing: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                onTap: ()=>launch("tel://811")
              ),
              ListTile(
                title: Text('British Columbia'),
                subtitle: Text('1-888-268-4319'),
                trailing: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                onTap: ()=>launch("tel://1-888-268-4319")
              ),
              ListTile(
                title: Text('Newfoundland and Labrador'),
                subtitle: Text('811'),
                trailing: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                onTap: ()=>launch("tel://811")
              ),
              ListTile(
                title: Text('Nova Scotia'),
                subtitle: Text('811'),
                trailing: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                onTap: ()=>launch("tel://811")
              ),
              ExpansionTile(
                title: Text(
                  'New Brunswick',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                  ),
                ),
                subtitle: Text('Click to see the Numbers'),
                children: <Widget>[
                  ListTile(
                    title: Text('Moncton and Saint John Area'),
                    subtitle: Text('811'),
                    trailing: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    onTap: ()=>launch("tel://811")
                  ),
                  ListTile(
                    title: Text('Freeriction Area'),
                    subtitle: Text('18444628387'),
                    trailing: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    onTap: ()=>launch("tel://1-833-784-4397")
                  ),
                  ListTile(
                    title: Text('Edmundston area'),
                    subtitle: Text('737-6844'),
                    trailing: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    onTap: ()=>launch("tel://737-6844")
                  ),
                  ListTile(
                    title: Text('Miramichi area'),
                    subtitle: Text('506-778-6102'),
                    trailing: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    onTap: ()=>launch("tel://506-778-6102")
                  ),
                ],
              ),
              ListTile(
                title: Text('Nunavut'),
                subtitle: Text('1-888-975-8601'),
                trailing: Icon(Icons.phone,color: Colors.black,),
                onTap: ()=>launch("tel://1-888-975-8601")
              ),
              ExpansionTile(
                title: Text(
                  'Ontario',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                  ),
                ),
                subtitle: Text('Click to see the Numbers'),
                children: <Widget>[

                ]
              ),
              ListTile(
                title: Text('Prince Edward Island'),
                subtitle: Text('811'),
                trailing: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                onTap: ()=>launch("tel://811")
              ),
              ExpansionTile(
                title: Text(
                  'Saskatchewan',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                  ),
                ),
                subtitle: Text('Click to see the Numbers'),
                children: <Widget>[
                  ListTile(
                title: Text('Prince Albert Parkland and Praire Authority'),
                subtitle: Text('911'),
                trailing: Icon(Icons.phone,color: Colors.black,),
                onTap: ()=>launch("tel://911")
              ),
              ListTile(
                title: Text('Rest All'),
                subtitle: Text('811'),
                trailing: Icon(Icons.phone,color: Colors.black,),
                onTap: ()=>launch("tel://811")
              ),
                ]
              ),
               ListTile(
                title: Text('Quebec'),
                subtitle: Text('1-877-644-4545'),
                trailing: Icon(Icons.phone,color: Colors.black,),
                onTap: ()=>launch("tel://1-877-644-4545")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
