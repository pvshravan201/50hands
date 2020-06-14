import 'package:flutter/material.dart';

class ImmiInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Immigration FAQ',
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
    'If governement has already approved your permanent resident application',
    <Entry>[
      Entry(
          'If your application was approved on or before March 18, 2020, but you haven’t travelled to Canada yet, you’re exempt from the travel restriction measures.\nGovernment of Canada cancelled all in-person permanent resident landing appointments until further notice. All landing appointments will be done by telephone whenever possible. Otherwise, they’ll reschedule them for later.\n\nIf Government of Canada has already approved your permanent resident application but you can\'t travel to Canada before your documents expire\n'),
    ],
  ),
  Entry(
    'To withdraw your application',
    <Entry>[
      Entry(
          'If you’re affected by the travel restrictions and want to withdraw your permanent residence application, You can visit to Canadian IRCC Website\n Government of Canada will give you a refund if\n\n- you withdraw your application within 24 hours of submitting it\n- we haven’t started processing'),
    ],
  ),
  Entry(
    'Can I sponsor my spouse, parent or grandparent if I’m receiving a Canada Emergency Response Benefit (CERB) payment?',
    <Entry>[
      Entry(
          'Yes, if you’re receiving CERB you’re still eligible to sponsor, as long as you meet all the requirements. CERB would not be considered social assistance.'),
    ],
  ),
  Entry(
    'Is CERB considered social assistance?',
    <Entry>[
      Entry(
          'The Canada Emergency Response Benefit payments (CERB) are not considered social assistance. Receiving CERB won’t make you ineligible to sponsor your spouse, parent or grandparent.'),
    ],
  ),
  Entry(
    'What to do if my Permanent Resident (PR) card is expired or will expire soon?',
    <Entry>[
      Entry(
          'If your card expires when you’re outside Canada, you still have your permanent resident (PR) status. To keep your PR status, you need to stay in Canada for a certain amount of time.\nYou can use an expired PR card to\n\n- apply for Canadian citizenship\n- bring to your citizenship test and ceremony (once they resume)'),
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
