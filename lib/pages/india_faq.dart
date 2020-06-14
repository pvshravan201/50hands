import 'package:flutter/material.dart';
class IndiaFAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4,16,4,0),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) =>
                        Padding(
                          padding: const EdgeInsets.only(left:6.0,right:6),
                          child: Card(color:Colors.blue[100],child: EntryItem(data[index])),
                        ),
                    itemCount: data.length,
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
    'How is a US citizen treated when returning from China?',
    <Entry>[
      Entry('"American citizens, legal permanent residents, and their immediate families who are arriving from impacted area must travel through one of 13 airports where DHS has established enhanced entry screening capabilities.\nAll American citizens, legal permanent residents, and their immediate families who are returning from the impacted area must self-quarantine for 14 days after their arrival. Screening & Quarantine: \nUpon arrival, travelers will proceed to standard customs processing. They will then continue to an enhanced entry screening where the passenger will be asked about their medical history, current condition, and asked for contact information for local health authorities.  Additionally, some passengers will have their temperature taken. After the enhanced entry screening is complete, passengers will be given written guidance about COVID-19 and be allowed to proceed to their final destination. Once home, individuals must immediately self-quarantine in their home and monitor their health in accordance with CDC best practices. In order to ensure compliance, local and State public health officials will contact individuals in the days and weeks following their arrival."'),
    ],
  ),
  Entry(
    'Reporting COVID-19 in the United States',
    <Entry>[
      Entry('US Healthcare providers who are concerned that a patient may have Corona Virus should contact their nearest'),
    ],
  ),
  Entry(
    'What should I do if I travelled in a flight with confirmed cases within Canada?',
    <Entry>[
      Entry('You an check your flight on the Canada flight tracker website to see whether anyone from a flight you travelle on has the coronavirus. If there was someone who tested positive, you should immediately test yourself too and go into isolation to stop further spreading. '),
    ],
  ),
  Entry(
    'What are the disinfectants recommended for environmental cleaning in healthcare facilities or homes housing patients suspected or comfirmed with Covid19?',
    <Entry>[
      Entry('"Environmental cleaning in healthcare facilities or homes housing patients with suspected or confirmed 2019-nCoV infection should use disinfectants that are active against enveloped viruses, such as 2019-nCoV and other coronaviruses. There are many disinfectants, including commonly used hospital disinfectants, that are active against enveloped viruses. Currently WHO recommendations include the use of:\n70% Ethyl alcohol to disinfect reusable dedicated equipment (e.g., thermometers) between uses Sodium hypochlorite at 0.5% (equivalent 5000ppm) for disinfection of frequently touched surfaces in homes or healthcare facilities."'),
    ],
  ),
  Entry(
    'What services are covered by canadian government health insurance? ',
    <Entry>[
      Entry('If you think you have COVID-19 infection, ask yourself if you can manage the symptoms at home. Fever can be managed with paracetamol. Important: If you feel uncomfortable managing the symptoms at home, particularly if you feel shortness of breath, please seek medical help.\n\nThere are news reports, especially on social media, suggesting that medications such as ibuprofen (so-called non-steroidal anti-inflammatory medicines or NSAIDs) used to lower fever and treat pain could worsen COVID-19. Based on currently available information, the World Health Organization (WHO) and the European Medicines Agency (EMA) do not recommend against the use of ibuprofen as there is, at the moment, no scientific evidence establishing a link between ibuprofen and worsening of COVID 19.4 If in doubt, please ask your physician which medication is safe for you to take to treat fever and/or pain.\n'),
    ],
  ),
  Entry(
    'Are there visitor restrictions related to coronavirus at hospitals?',
    <Entry>[
      Entry('"In an attempt to prevent the spread of COVID-19, influenza and other infectious diseases in order to protect patients and employees, Community Health Network has limited visitor restrictions at its hospital sites.\nNo visitors will be permitted at Community Hospital North, Community Hospital East, Community Hospital South, Community Heart and Vascular Hospital, Community Behavioral Health, Community Howard Regional Health and Community Hospital Anderson.\nPlease see visitation exceptions below for OB/Maternity/NICU and end-of-life scenarios.For the safety of patients and caregivers, no packages, gifts, food, etc., will be allowed into our facilities."'),
    ],
  ),
  Entry(
    'What are the recommendations for the functioning of restaurants and bars during Covid19?',
    <Entry>[
      Entry('If you think you have COVID-19 infection, ask yourself if you can manage the symptoms at home. Fever can be managed with paracetamol. Important: If you feel uncomfortable managing the symptoms at home, particularly if you feel shortness of breath, please seek medical help.\n\nThere are news reports, especially on social media, suggesting that medications such as ibuprofen (so-called non-steroidal anti-inflammatory medicines or NSAIDs) used to lower fever and treat pain could worsen COVID-19. Based on currently available information, the World Health Organization (WHO) and the European Medicines Agency (EMA) do not recommend against the use of ibuprofen as there is, at the moment, no scientific evidence establishing a link between ibuprofen and worsening of COVID 19.4 If in doubt, please ask your physician which medication is safe for you to take to treat fever and/or pain.\n'),
    ],
  ),
  Entry(
    'What are the safety practices to be taken up for critical infrastructure workers who might have been exposed to people with confirmed Covid19? ',
    <Entry>[
      Entry('"To ensure the continuity of operations, CDC advises that critical infrastructure workers may be permitted to continue work following potential exposure to COVID-19, provided they remain symptom-free and additional precautions are taken to protect them and the community.\nEmployers should:\nCheck temperatures and assess symptoms of workers, ideally before entering the facility or operation.\nIf no fever (>100.4oF) or COVID-19 symptoms are present, workers should self-monitor for onset of symptoms during their shift."\n'),
    ],
  ),
  Entry(
    'How is Canada responding to COVID-19?',
    <Entry>[
      Entry('How is Canada responding to COVID-19?	The Government of Canada has created the infrastructure to respond to the public health threats of the virus, and is well prepared to act—in collaboration with provincial and territorial governments and international partners—to minimize the health, economic, and social impacts of this rapidly evolving public health issue.   Read More...'),
    ],
  ),
  Entry(
    'Types of Prenatal Care',
    <Entry>[
      Entry('There are different providers of prenatal care, there are also different models of prenatal care, from individual provider, to interprofessional teams, to group prenatal care.Read more'),
    ],
  ),
  Entry(
    'Advice for mothers during COVID-19 for pregnancy . ',
    <Entry>[
      Entry('COVID-19 is a new disease and we are still learning how it affects pregnant women. Currently, there is no evidence that suggests pregnant women are at a higher risk of getting COVID-19 or if acquired, having more serious illness. There is also not enough evidence at this time to confirm that a mother can pass COVID-19 to her child during pregnancy.Read more.Read more'),
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
