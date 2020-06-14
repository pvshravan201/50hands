import 'package:flutter/material.dart';

class TravelInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Travel Related FAQ',
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0xFFFEF9EB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 16.0, 8, 0),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.only(left: 6.0, right: 6),
                    child: Card(
                        color: Colors.blue[100], child: EntryItem(data[index])),
                  ),
                  itemCount: data.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'What should I do if I get sick while travelling?',
    <Entry>[
      Entry(
          'Contact Blue Cross travel assistance immediately. The numbers to call to reach this 24/7 service are as follows:\n\n- From Canada or the United States: 1 800 361-6068 (toll free)\n- From the Dominican Republic: 01-800-062-3174 01-800-062-3174 (toll free)\nIf you cannot reach our travel assistance service, do what is medically necessary to stabilize your situation (e.g., go to a nearby clinic or hospital or contact local emergency services). Once you have been taken care of, call our travel assistance service as soon as possible.'),
    ],
  ),
  Entry(
    'How do I access the new COVID-19 Emergency Loan Program for Canadians Abroad, as announced by the federal government?',
    <Entry>[
      Entry(
          'On March 17, Global Affairs Canada announced the COVID-19 Emergency Loan Program for Canadians Abroad. The COVID-19 Emergency Loan Program will facilitate Canadians’ return to Canada, or help ensure that their basic essential needs are met while they work on their return to Canada, through a repayable loan.\n\n'),
    ],
  ),
  Entry(
    'What should I do if the borders of the country where I\'m staying are closed?',
    <Entry>[
      Entry(
          'In accordance with the official recommendations of government and health authorities, it is essential that you immediately take all necessary steps to return to your province of residence while you still have the opportunity to do so.\n\nGiven the magnitude of the crisis, the reduced availability of medical resources around the world and the measures being taken by various countries to limit the spread of the COVID-19 pandemic, our travel assistance service is very limited in its ability to assist people in emergency situations abroad\n\nIf the borders of the country you are visiting close before you have had a chance to plan your return, promptly contact our customer service department at 514 905-5050 or 1 855 599-5050 to extend your individual travel insurance policy. Make sure you do so before the policy expiry date.'),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title,style: TextStyle(
          fontFamily: 'Roboto',
        ),),);
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(
        root.title,
        style: TextStyle(
          fontFamily: 'Roboto',
        ),
      ),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
