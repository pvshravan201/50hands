import 'package:flutter/material.dart';
class IndiaFAQ extends StatelessWidget {
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
    'What are the Travel and Visa restrictions for due to COVID ?',
    <Entry>[
      Entry('"All regular (sticker) Visas/e-Visa (including VoA for Japan and South Korea) granted to nationals of Italy, Iran, South Korea, Japan and issued on or before 03.03.2020 and who have not yet entered India, stand suspended with immediate effect. Such foreign nationals may not enter India from any Air, Land or Seaport ICPs. Those requiring to travel to India due to compelling reasons, may seek fresh visa from nearest Indian Embassy/Consulate. Regular (sticker) visa / e-Visa granted to nationals of Peoples Republic of China, issued on or before 05.02.2020 were suspended earlier. It shall remain in force. Such Chinese nationals may not enter India from any Air, Land or Seaport ICPs. Those needing to travel to India under compelling circumstances may apply for fresh visa to nearest Indian Embassy/Consulate. Regular (sticker) visas/e-Visas granted to all foreign nationals who have travelled to Peoples Republic of China, Iran, Italy, South Korea and Japan on or after 01.02.2020, and who have not yet entered India stand suspended with immediate effect.  Such foreign nationals may not enter India from any Air, Land or Seaport ICPs. Those requiring to travel to India under compelling circumstances may apply for fresh visa to nearest Indian Embassy/Consulate. Diplomats, officials of UN and other International bodies, OCI cardholders and Aircrew from above countries are exempted from such restriction on entry. However, their medical screening is compulsory. All foreign and Indian nationals entering into India from any port are required to furnish duly filled self declaration form (including personal particulars i.e. phone no. and address in India) and travel history, to Health officials and Immigration officials at all port. Passengers (foreign and Indian) other than those restricted, arriving directly or indirectly from China, South Korea, Japan, Iran, Italy, Hong Kong, Macau, Vietnam, Malaysia, Indonesia, Nepal, Thailand, Singapore and Taiwan must undergo medical screening at port of entry."'),
    ],
  ),
  Entry(
    'Are Dabbas and Truck repair shops opened during COVID ?',
    <Entry>[
      Entry('Yes. And the locations of dabbas and truck repai shops of each state during COVID  read more'),
        ],
  ),
  Entry(
    'What is the standard operating procedure for transporting a suspect or a confirmed case of COVID ?',
    <Entry>[
      Entry('Corona Virus is a highly transmissible disease and hence precautions need to be taken while transporting a suspected or confirmed case. A set number of ambulances must be set aside specifically got transporting COVID-19 patients. Currently, there are two types of ambulances, ALS and BLS, with and without ventilators respectively. Ambulance staff (technicians as well as drivers) should be trained and oriented about common signs and symptoms of COVID-19. Both the EMT and driver of the ambulance must wear PPE while handling, managing and transporting the COVID identified/ suspect patients. The patient and attendant should be provided with a triple-layer mask and gloves. All surfaces that may have come in contact with the patient or materials contaminated during patient care should be thoroughly cleaned and disinfected using 1% Sodium Hypochlorite solution. The reusable patient care equipment must be disinfected with an alcohol-based rub. All surfaces and equipment should be cleaned in the morning, evening and after every use with soap/detergent and water.'),
    ],
  ),
  Entry(
    'why is Family health Insurance neccessary ?.',
    <Entry>[
      Entry('A single health Insurance for you and your family !. It offers financial assistance against hospitalizationamd any health emergency for both you and your family.'),
    ],
  ),
  Entry(
    'What are the guidance for international arrival ?',
    <Entry>[
      Entry('Before boarding, all travellers shall give an undertaking that they would undergo mandatory quarantine for 14 days - 7 days paid institutional quarantine at their own cost, followed by 7 days isolation at home with self-monitoring of health.'),
    ],
  ),
  Entry(
    'When will colleges reopen?',
    <Entry>[
      Entry('College sessions will begin in August for current students and September for new ones, said by the University Grants Commission. The admission process in universities will also begin from August. Schools and colleges have been closed across the country since last month amid the coronavirus pandemic. Source: Indian Govt.'),
    ],
  ),
  Entry(
    'How do I cope with living alone in self-isolation?',
    <Entry>[
      Entry('Controlling emotions and normalising them by saying to yourself that 80 per cent of COVID-19 infections are mild can reduce sadness, anger, or frustration.Monitoring yourself or being monitored by others for signs and symptoms of COVID-19 is very stressful. During this time, keep yourself occupied with Yoga, indoor games, movies or anything that can divert your mind. Try relaxation techniques like breathing exercises that will help you de-stress and cope with loneliness. Loneliness can lead to health problems, including an impaired immune system. So, sleeping a bit more and hydrating yourself particularly when you feel tired can help you deal with stress, reduce your anxiety and speed up recovery as well.'),
    ],
  ),
  Entry(
    'How Microsoft Plasmabot In india helps to the government?',
    <Entry>[
      Entry('As countries including India explore plasma therapy to treat severe COVID-19 patients, Microsoft is launching a plasmabot initiative to encourage people who have been recovered from the deadly disease donate their plasma. Several studies have begun in different parts of the world to test effectiveness of convalescent plasma therapy in treating COVID-19 patients. The idea behind this therapy is that immunity can be transferred from a healthy person to a sick using convalescent plasma. In India, states like Kerala and Gujarat have started Convalescent Plasma Therapy from to treat Covid-19 patients read more.'),
    ],
  ),
  Entry(
    'How India’s Covid-19 lockdown has worsened the shortages at blood banks?',
    <Entry>[
      Entry('Due to the covid 19 pandemic, The blood banks are closed and it takes nearly 14-16 days to transfer a blood to the patients. hospitals are making do with fewer staff, and fewer donors are coming forward due to restrictions on people’s movement and the fear of contracting Covid-19 at a hospital or clinic, our reporting found. People do not want to go to blood banks, and especially blood banks within hospitals, because of the fear of getting infected with Covid-19. The lockdown has restricted movement, so regular donors living far from a hospital or blood bank cannot donate, and finding new donors in nearby areas is a challenge. Even when people come, doctors have to be careful about who is donating blood. Donors will have to be asked questions about travel history or contact with anyone who has travelled abroad.'),
    ],
  ),
  Entry(
    'Whether they will be quarantined upon arrival in India (quarantined for 14 days) ?',
    <Entry>[
      Entry('1. All passengers coming from/transiting through UAE, Qatar, Oman and Kuwait after 12.00 GMT on March 18, 2020 (Port of Departure) will be quarantined.\n2. Those who have visited China, Republic of Korea, Iran, Italy, Spain, France and Germany on or after Feb 15, 2020 will be quarantined.'),
    ],
  ),
  Entry(
    'Who are not allowed?',
    <Entry>[
      Entry('No airline will bring any passenger from Austria, Belgium, Bulgaria, Croatia, Cyprus, Czech Republic, Denmark, Estonia, Finland, France, Germany, Greece, Iceland, Hungary, Ireland, Italy, Latvia, Liechtenstein, Lithuania, Luxembourg, Malta, Netherlands, Norway, Poland, Portugal, Romania, Slovakia, Slovenia, Spain, Sweden, Switzerland, Turkey, United Kingdom effective 12.00 GMT on March 18,2020 at Port of Departure. No airline will bring any passenger from Philippines, Malaysia and Afghanistan effective 15.00 IST on March 17, 2020 (Port of Departure).'),
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
