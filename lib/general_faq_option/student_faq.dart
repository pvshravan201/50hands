import 'package:flutter/material.dart';

class StudInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Student Services FAQ',
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
    'When will schools/colleges reopen?',
    <Entry>[
      Entry(
          'You aren’t alone. A lot of kids all over the world are wondering when coronavirus restrictions will ease up and they’ll get to go back to class.Readmore...'),
    ],
  ),
  Entry(
    'Given the current situation I am very anxious? How can I get help?',
    <Entry>[
      Entry(
          'Anxiety is a normal reaction to uncertainty and things that may harm us. For many of us, the coronavirus and the COVID-19 illness make for a very uncertain future.'),
    ],
  ),
  Entry(
    'Where can I learn in-demand skills for free?',
    <Entry>[
      Entry(
          'It\'s 2020, and a new year means new perspectives and changing demands in the workplace.'),
    ],
  ),
  Entry(
    'What are the expected guidelines when schools reopen?',
    <Entry>[
      Entry(
          'Without no further directives from public health and provincial education ministries other than to remain closed, school boards have their hands tied. For more check out our website'),
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
        ),));
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
