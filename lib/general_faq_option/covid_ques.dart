import 'package:flutter/material.dart';

class CovidInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Covid-19 FAQ',
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
                padding: const EdgeInsets.fromLTRB(8,16.0,8,0),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      Padding(
                        padding: const EdgeInsets.only(left:6.0,right:6),
                        child: Card(color:Colors.blue[100],child: EntryItem(data[index])),
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
    'What is Corona Virus',
    <Entry>[
      Entry('Corona viruses are a large family of viruses. Some cause illness in people and others cause illness in animals. Human corona viruses are common and are typically associated with mild illnesses, similar to the common cold.\nCOVID-19 is a new disease that has not been previously identified in humans. Rarely, animal corona viruses can infect people, and more rarely, these can then spread from person to person through close contact.\nThere have been 2 other specific corona viruses that have spread from animals to humans and which have caused severe illness in humans. These are the:\n- Severe acute respiratory syndrome coronavirus (SARS CoV)\n- Middle East respiratory syndrome coronavirus (MERS CoV)'),
    ],
  ),
  Entry(
    'What is the incubation period for COVID-19?',
    <Entry>[
      Entry('Those who are infected with COVID-19 may have little to no symptoms. You may not know you have symptoms of COVID-19 because they are similar to a cold or flu.\nSymptoms may take up to 14 days to appear after exposure to COVID-19. This is the longest known incubation period for this disease.\nWhile experts know that these kinds of transmissions are happening among those in close contact or in close physical settings, it is not known to what extent. This means it is extremely important to follow the proven preventative measures.'),
    ],
  ),
  Entry(
    'How can I protect myself when I touch something that might be contaminated by the virus (for example, food packaging, fruits and vegetables, packages, letters, plastic or reusable bags, money)?',
    <Entry>[
      Entry('It might, but so far COVID-19 has been found in many countries, whatever their climate. At this time, it is not known whether the spread of COVID-19 will decrease when the weather becomes warmer.'),
    ],
  ),
  Entry(
    'How long can COVID-19 survive on objects?',
    <Entry>[
      Entry('In general, the corona virus (COVID-19) does not survive for long on objects:\n\n- 3 hours on objects with dry surfaces;\n- 6 days on objects with wet surfaces.\n\nMore specifically, according to findings from a recent experiment, how long the virus survives might depend on the type of surface. The virus might be able to survive up to:\n\n- 4 hours on copper\n72 hours (3 days) on plastic.\n- 24 hours on cardboard\n'),
    ],
  ),
  Entry(
    'Could the arrival of spring and the warmer weather affect the spread of COVID-19?',
    <Entry>[
      Entry('To protect yourself, wash your hands with soap and warm water after touching objects that might be contaminated. Avoid touching your eyes, nose or mouth until you have washed your hands properly.\nIf possible, wash the object that might be contaminated with the cleaning products and disinfectants that you usually use at home. For example, wash your fruits and vegetables well before eating them and wash your reusable bags with your usual detergent. These are good habits at any time, not just during a pandemic.'),
    ],
  ),
  Entry(
    'How can I make a difference in Canada’s COVID-19 response efforts?',
    <Entry>[
      Entry('Join hands with 50 Hands Organization to support the Canadian\'s in various levels. Please reach us by filling the Volunteer form or by contributing.'),
    ],
  ),
  Entry(
    'How long do the symptoms of COVID-19 last?',
    <Entry>[
      Entry('How long the symptoms last depends on the severity of the disease. Symptoms generally last less than 14 days. In severe cases, symptoms can last longer than a month.'),
    ],
  ),
  Entry(
    'What are the main symptoms associated with COVID-19?',
    <Entry>[
      Entry('The main symptoms of COVID-19 are as follows:\nFever\n- in children: 38°C (100.4°F) and above (rectal temperature),\n- in adults: 38°C (100.4°F) and above (oral temperature),\n- in older adults: 37.8°C (100°F) and above (oral temperature),\n- or 1.1°C above the person\'s usual value;\n- New or worse cough\n- Difficulty breathing\nor\n- Sudden loss of smell without a stuffy nose, with or without loss of taste\nThe symptoms can be mild (similar to a cold) or more severe (such as those associated with pneumonia and respiratory or kidney failure).'),
    ],
  ),
  Entry(
    'How can I tell the difference between the symptoms of COVID-19 and flu symptoms?',
    <Entry>[
      Entry('You cannot tell the difference between COVID-19 and the flu based on the symptoms alone because they are too alike. The only way to be sure is to get tested. Testing is now reserved for certain groups of people.\n\nHowever, if you develop symptoms of a respiratory tract infection and you live with someone who has tested positive for COVID-19, it is almost certain that you have it too.'),
    ],
  ),
  Entry(
    'Should I be worried about the COVID-19 situation?',
    <Entry>[
      Entry('For now, the spread of COVID-19 is under control in Canada, but the situation must be monitored closely. The Government is taking all the necessary measures to contain the contagion as much as possible.'),
    ],
  ),
  Entry(
    'Are there any foods, supplements, vitamins or natural health products that can be used to prevent or treat COVID-19?',
    <Entry>[
      Entry('There are no foods, supplements, vitamins or natural health products that can be used to protect you against or treat COVID-19.\nYou cannot strengthen your immune system through diet.\nHowever, for the immune system to function effectively, it is important to eat a variety of healthy foods every day, as recommended in Canada’s Food Guide.'),
    ],
  ),
  Entry(
    'What should I do with my face covering after I use it?',
    <Entry>[
      Entry('If it is a fabric face covering, fold the outside of the mask inward and put it in a clean bag. As soon as you get home, wash your face covering with your other laundry.\n\nIf it is a disposable model, put it in a closed trash container after using it. Don’t forget to wash your hands after you take your face covering off.'),
    ],
  ),
  Entry(
    'Is there any treatment for Corona',
    <Entry>[
      Entry('There is no specific treatment or vaccine for COVID-19 for the moment. Most people with the virus will recover on their own by remaining at home without needing to go to the hospital.'),
    ],
  ),
  Entry(
    'Can I make my own face covering?',
    <Entry>[
      Entry('You can make a face covering using materials that you already have at home. If possible, use a soft, tightly woven fabric, such as cotton, that lets air through when you breathe. Use at least two layers of fabric and make sure your face covering fits comfortably and snugly over your face. You must be able to wash and dry it without it getting damaged or misshapen. There are many ways to make effective fabric face coverings.'),
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
        fontFamily:'Roboto',
      ),));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title,style: TextStyle(
        fontFamily:'Roboto',
      ),),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
