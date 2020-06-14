import 'package:flutter/material.dart';

class ParenInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Health Services FAQ',
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
    'Can pregnant women who are giving birth be accompanied by a loved one?',
    <Entry>[
      Entry(
          'At present, pregnant women can be accompanied by a loved one when giving birth. However, hospitals may adopt certain specific measures, as is the case at the Montreal Jewish General Hospital. To obtain additional information in this regard, pregnant women can contact their hospital.'),
    ],
  ),
  Entry(
    'What can I do if I am an informal caregiver and feel that my everyday life has been disrupted?',
    <Entry>[
      Entry(
          'Due to the pandemic, many informal caregivers find that their everyday life has been disrupted. You may be wondering what the best way to support your loved one is. You have to solve practical problems, provide moral support, perhaps help them out financially too.'),
    ],
  ),
  Entry(
    'What should I do if I need to see a family doctor during the pandemic?',
    <Entry>[
      Entry(
          'If you do not have flu-like symptoms, gastroenteritis or symptoms of COVID‑19, you can always consult if you need to by, contacting your family doctor, medical clinic or family medicine group (FMG) to make an appointment for a consultation over the telephone or in person. If you are unable to reach your medical clinic or are not registered with a family doctor, you can call Info‑Santé 811 to speak to a nurse, get advice about what to do and be referred, if necessary, to the appropriate resource.\n\nPeople who have a chronic disease (e.g., diabetes, cardiovascular disease, hypertension, degenerative disease, etc.), cancer or any other disease or condition that requires regular health follow-up are, in particular, encouraged to have these follow-ups and go to their medical appointments.'),
    ],
  ),
  Entry(
    'Does the RAMQ cover health services provided by means of telecommunications?',
    <Entry>[
      Entry(
          'Yes, the RAMQ will from now on cover health services provided by correspondence or by means of telecommunications. This coverage includes, for example, a telephone consultation with a physician.'),
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
