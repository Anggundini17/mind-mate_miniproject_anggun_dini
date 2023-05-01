import 'package:flutter/material.dart';
import 'package:mind_mate_app/view/detail_psikolog.dart';
import 'package:mind_mate_app/view/psikolog_page.dart';
import 'package:mind_mate_app/view/test_card.dart';

class PreviewPsikolog extends StatelessWidget {
  const PreviewPsikolog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Our Psycologist',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 7, 20, 8)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MyFadeRoute(
                        route: PsikologPage(),
                      ),
                    );
                  },
                  child: Text(
                    'See More',
                    style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                        color: Colors.blue[700]),
                  ),
                ),
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 415,
          child: ListView(
            children: [
              cardPsikolog(
                context,
                'Jefferey S.Psi, M.Psi',
                'Psikolog Anak',
                'Anak',
                '7 Tahun',
              ),
              cardPsikolog(
                context,
                'Mark Lee S.Psi, M.Psi',
                'Psikolog Klinis',
                'Stress,Gangguan Kecemasan',
                '7 Tahun',
              ),
              cardPsikolog(
                context,
                'Hendery Wijaya S.Psi, M.Psi',
                'Psikolog Klinis',
                'Anxiety',
                '7 Tahun',
              )
            ],
          ),
        )
      ],
    );
  }

  Widget cardPsikolog(
    BuildContext context,
    String name,
    String specialist,
    String expert,
    String experience_year,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            // constraints: BoxConstraints(maxHeight: double.infinity),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            builder: (context) => DetailPsikolog(),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  alignment: Alignment.center,
                  constraints:
                      const BoxConstraints(maxWidth: 50, maxHeight: 150),
                  child: Image.network(
                      'https://f.ptcdn.info/298/073/000/qs7t6ibhscUkbPBmH8t-o.jpg'),
                ),
              ),
              // leading: const CircleAvatar(
              //     backgroundColor: Color.fromARGB(255, 182, 197, 222)),
              title: Text(name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(specialist),
                  Text(expert),
                  Chip(
                      label: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(experience_year),
                    ],
                  )),
                ],
              ),
              trailing: consultButton()),
        ),
      ),
    );
  }

  ElevatedButton consultButton() {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromRGBO(180, 235, 237, 1)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        ),
        onPressed: () {},
        child: Text(
          'Consult',
          style: TextStyle(
            color: Colors.black.withOpacity(.8),
          ),
        ));
  }
}
