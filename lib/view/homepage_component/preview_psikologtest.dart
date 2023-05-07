import 'package:flutter/material.dart';
import 'package:mind_mate_app/view_model/article_provider.dart';

import 'package:mind_mate_app/view_model/psikolog_provider.dart';
import 'package:provider/provider.dart';

import '../psikolog/consult.dart';
import '../psikolog/psikolog_page.dart';
import '../test_card.dart';

class PsikologPageTest extends StatefulWidget {
  const PsikologPageTest({super.key});

  @override
  State<PsikologPageTest> createState() => _PsikologPageTestState();
}

class _PsikologPageTestState extends State<PsikologPageTest>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<PsikologProvider>(context, listen: false)
          .getPsikologList(),
    );

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(239, 252, 252, 1),
        appBar: AppBar(
          // backgroundColor: Color.fromRGBO(180, 235, 237, 1),
          title: Text(
            'PSYCOLOGIST',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Opacity(
          opacity: _animation.value,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  'Meet Our Psycologist',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.8),
                      fontSize: 24),
                ),
              ),
              Consumer<PsikologProvider>(
                builder: (context, provPsikolog, child) {
                  if (provPsikolog.requestState == PsikologViewState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (provPsikolog.requestState ==
                      PsikologViewState.loaded) {
                    final psikolog = provPsikolog.listPsikolog;
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: ((context, index) {
                          final psikologData = psikolog[index];
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Card(
                              // color: Color.fromRGBO(215, 245, 246, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    constraints: const BoxConstraints(
                                        maxWidth: 50, maxHeight: 150),
                                    child: Image.network(
                                        'https://f.ptcdn.info/298/073/000/qs7t6ibhscUkbPBmH8t-o.jpg'),
                                  ),
                                ),
                                title: Text(psikologData.name),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(psikologData.specialist),
                                    Text(psikologData.expert),
                                    Chip(
                                        label: Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        const Icon(Icons.work),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(psikologData.timeExperience),
                                      ],
                                    )),
                                  ],
                                ),
                                trailing: ConsultButton(
                                  psikologDataId: psikologData,
                                ),
                              ),
                            ),
                          );
                        }));
                  } else {
                    return Center(child: Text('Error'));
                  }
                },
              ),
            ],
          )),
        ));
  }
}

// class ConsultButton extends StatelessWidget {
//   const ConsultButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all<Color>(
//               Color.fromRGBO(180, 235, 237, 1)),
//           shape: MaterialStateProperty.all(
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
//         ),
//         onPressed: () {
//           Navigator.of(context).push(
//             MyFadeRoute(
//               route: ConsultationPage(
//                   // title: 'Consultation Form',
//                   getPsikolog: ,
//                   ),
//             ),
//           );
//         },
//         child: Text(
//           'Consult',
//           style: TextStyle(
//             color: Colors.black.withOpacity(.8),
//           ),
//         ));
//   }
// }
