import 'package:flutter/material.dart';

class HealthInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Health Conditions FAQ',
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
    'I have a heart condition. Am I at more risk of getting COVID-19 than somebody who doesn’t have a heart condition?',
    <Entry>[
      Entry(
          'No - the infection can be caught by anyone. However, people with underlying heart conditions might be more likely to show symptoms of the infection or to have a more severe infection than others.So far, most people that get COVID-19 have a mild viral illness including sore throat, cough and aches and pains and a fever, but some people (up to 5%) develop a chest infection/pneumonia. We are not yet certain if people with heart conditions are more likely to get a chest infection with COVID-19, but it is likely since they do get chest infections with other viruses like the flu.'),
    ],
  ),
  Entry(
    'I have Brugada Syndrome, are there any special precautions I must take?',
    <Entry>[
      Entry(
          'Patients with Brugada Syndrome are particularly vulnerable to fatal arrhythmias in situations where the body temperature exceeds 39°C. Such patients must treat fever aggressively with paracetamol and cool/tepid sponging.'),
    ],
  ),
  Entry(
    'Are people with heart disease more likely to die of COVID-19 than those without?',
    <Entry>[
      Entry(
          'So far, older age and the presence of underlying conditions - including heart conditions - have been risk factors for death. Nevertheless, it is important to emphasise that most patients, even those with underlying heart disease, have had mild infections and have fully recovered.'),
    ],
  ),
  Entry(
    'I know that I should not go to the hospital if I think I am infected, but when should I seek medical attention if I have a pre-existing heart condition?',
    <Entry>[
      Entry(
          'If you think you have COVID-19 infection, ask yourself if you can manage the symptoms at home. Fever can be managed with paracetamol. Important: If you feel uncomfortable managing the symptoms at home, particularly if you feel shortness of breath, please seek medical help.\n\nThere are news reports, especially on social media, suggesting that medications such as ibuprofen (so-called non-steroidal anti-inflammatory medicines or NSAIDs) used to lower fever and treat pain could worsen COVID-19. Based on currently available information, the World Health Organization (WHO) and the European Medicines Agency (EMA) do not recommend against the use of ibuprofen as there is, at the moment, no scientific evidence establishing a link between ibuprofen and worsening of COVID 19.4 If in doubt, please ask your physician which medication is safe for you to take to treat fever and/or pain.\n'),
    ],
  ),
  Entry(
    'Is there any link between vaping/smoking/water pipe use and susceptibility to COVID-19?',
    <Entry>[
      Entry(
          'Yes. The use of shared water pipes has been linked to the spread of certain infectious diseases. Furthermore, the use of cold water in the water pipes can facilitate survival of bacteria and/or viruses. While information regarding susceptibility of those who smoke to contracting COVID-19 is still forthcoming, we do know that those who smoke are two to four times more likely to contract bacterial and/or viral infections.'),
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
