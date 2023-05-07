import 'package:flutter/material.dart';

import 'package:mind_mate_app/view/test_card.dart';
import 'package:mind_mate_app/view_model/psikolog_provider.dart';
import 'package:provider/provider.dart';

import '../psikolog/detail_psikolog.dart';
import '../psikolog/psikolog_page.dart';

class PreviewPsikolog extends StatefulWidget {
  const PreviewPsikolog({
    Key? key,
  }) : super(key: key);

  @override
  State<PreviewPsikolog> createState() => _PreviewPsikologState();
}

class _PreviewPsikologState extends State<PreviewPsikolog> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<PsikologProvider>(context, listen: false)
          .getPsikologList(),
    );
  }

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
        // ListView(
        //   shrinkWrap: true,
        //   physics: NeverScrollableScrollPhysics(),
        //   children: [
        //     cardPsikolog(
        //       context,
        //       'Jefferey S.Psi, M.Psi',
        //       'Psikolog Anak',
        //       'Anak',
        //       '7 Tahun',
        //     ),
        //     cardPsikolog(
        //       context,
        //       'Mark Lee S.Psi, M.Psi',
        //       'Psikolog Klinis',
        //       'Stress,Gangguan Kecemasan',
        //       '7 Tahun',
        //     ),
        //     cardPsikolog(
        //       context,
        //       'Hendery Wijaya S.Psi, M.Psi',
        //       'Psikolog Klinis',
        //       'Anxiety',
        //       '7 Tahun',
        //     )
        //   ],
        // )

        Consumer<PsikologProvider>(
          builder: (context, provPsikolog, child) {
            if (provPsikolog.requestState == PsikologViewState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (provPsikolog.requestState == PsikologViewState.loaded) {
              final psikolog = provPsikolog.listPsikolog;
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: ((context, index) {
                    final psikologData = psikolog[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: CardPsikolog(psikologData: psikologData),
                    );
                  }));
            } else {
              return Center(child: Text('Error'));
            }
          },
        ),
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
                builder: (context) => PsikologPage());
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
                      'https://i.pinimg.com/564x/ab/5a/e5/ab5ae5ea7ce8ee34e548a52f5adcde41.jpg'),
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
              // trailing: ConsultButton(psikologDataId: psikolo,)),
            ),
          ),
        ));
  }
}
