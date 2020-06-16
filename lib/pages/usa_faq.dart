import 'package:flutter/material.dart';
class USAFAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4,16,4,0),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            Padding(
              padding: const EdgeInsets.only(left:6.0,right:6),
              child: Card(color:Colors.blue[100],child: EntryItem(data[index])),
            ),
        itemCount: data.length,
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
    'How Department of Transportation handles to contain COVID spread?',
    <Entry>[
      Entry('As a member of the White House Coronavirus Task Force, DOT helps support the Administration’s efforts to contain and mitigate the spread of the virus, and ensure continuation of critical infrastructure support and relief for the American people. Response measures implemented by the Department to date have included stakeholder outreach and guidance, expanded federal assistance, and regulatory relief. '),
    ],
  ),
  Entry(
    'How to plan travel post-corona virus',
    <Entry>[
      Entry('When planning for travel trips after Covid-19, one should be cautious, and clean and hygenic places to stay instead of any random place. One should also wait until it is completely safe to travel. They should wait for three things to happen: the State Department has to lift its level 4 travel advisory, the centers for disease control and prevention should give the "all clear," and the World Health Organization (WHO) should also approve.'),
    ],
  ),
  Entry(
    'What happens if i need treatment and it\'s not covered by my province? ',
    <Entry>[
      Entry('Sometimes, a patient needs medical treatment or care that cannot be provided in Manitoba. Manitoba Health, Seniors and Active Living may cover some of the costs of this care, based on a specific approval process. '),
    ],
  ),
  Entry(
    'USA Health Care System',
    <Entry>[
      Entry('The U.S. health system is a mix of public and private, for-profit and nonprofit insurers and health care providers. The federal government provides funding for the national Medicare program for adults age 65 and older and some people with disabilities as well as for various programs for veterans and low-income people, including Medicaid and the Children’s Health Insurance Program.'),
    ],
  ),
  Entry(
    'How can I get emergency finanacial aid?',
    <Entry>[
      Entry('As colleges begin receiving the federal funds and finalizing plans to distribute the money, students may need to jump through a few hoops to get coverage of their expenses resulting from this disruption. Know that the way federal financial aid works is that students must first apply for the aid by answering a series of questions used to determine their ability to pay for college. '),
    ],
  ),
  Entry(
    'How to hit pause button on mortgage payments during the pandemic?',
    <Entry>[
      Entry(' Disheartening levels of jobless claims will likely drive more homeowners to seek mortgage relief in the weeks ahead.'),
    ],
  ),
  Entry(
    'Are there going to be drug shortages due to medical facility closures across the world?',
    <Entry>[
      Entry('The FDA has been closely monitoring the supply chain with the expectation that the COVID-19 outbreak would likely impact the medical product supply chain, including potential disruptions to supply or shortages of critical medical products in the U.S.\nWe have been reaching out to manufacturers as part of our approach to identifying potential disruptions or shortages. We will use all available tools to react swiftly and mitigate the impact to U.S. patients and health care professionals when a potential disruption or shortage is identified.'),
    ],
  ),
  Entry(
    'Can I work in U.S while waiting for my green card?',
    <Entry>[
      Entry('A common way to work temporarily in the United States as a nonimmigrant is for a prospective employer to file a petition with USCIS on your behalf.If you have the right combination of skills, education, and/or work experience, you may be able to live and work permanently in the United States by seeking an employment-based immigrant visa.'),
    ],
  ),
  Entry(
    'CRA Consideration for Activities in Response to the COVID-19',
    <Entry>[
      Entry('The Federal Reserve Board, the FDIC, and the Office of the Comptroller of the Currency (the agencies) recognize the potential for the Coronavirus Disease (referred to as COVID-19) to adversely affect the customers and operations of financial institutions.'),
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
