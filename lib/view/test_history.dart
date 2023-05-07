import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mind_mate_app/models/psikolog.dart';
import 'package:mind_mate_app/view/psikolog/consult.dart';
import 'package:mind_mate_app/view_model/db_manager_provider.dart';
import 'package:provider/provider.dart';

import '../view_model/psikolog_provider.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      () => Provider.of<DatabaseManagerProvider>(context, listen: false)
          .getAllConsultationData(),
    );
    Future.microtask(
      () => Provider.of<PsikologProvider>(context, listen: false)
          .getPsikologList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 30.0, left: 10.0, right: 10.0, bottom: 50.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'LIST CONTACTS \n',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Consumer<DatabaseManagerProvider>(
              builder: (context, manager, child) {
                final consultations = manager.getConsultationData;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: consultations.length,
                  itemBuilder: (context, index) {
                    final consultationData = consultations[index];
                    return ListTile(
                      trailing: Wrap(
                        spacing: 0.2,
                        alignment: WrapAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            onPressed: () async {
                              var testFetchSingleData = Future.microtask(
                                () => Provider.of<PsikologProvider>(context,
                                        listen: false)
                                    .fetchSinglePsikolog(
                                        consultationData.psikologId),
                              );

                              print(consultationData.psikolog);
                              // final testingIdPsikolog = Psikolog
                              var testPsikolog = Psikolog;
                              // List<Psikolog> testing2 = testPsikolog.

                              // final selectedConsultationData = await manager
                              //     .getConsultationById(consultationData.id!);
                              // final Psikolog psikologId;
                              // final selectedPsikolog = Psikolog.fromJson(selectedConsultationData.psikologId);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ConsultationPage(
                              //               // getPsikolog: manager;
                              //             )
                              //             )
                              //             );
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              manager.deleteConnsultation(consultationData.id!);
                              // setState(() {
                              //   listContact.remove(listContact[index]);
                              // });
                            },
                          ),
                        ],
                      ),
                      leading: CircleAvatar(
                        child: Text(
                            consultationData.psikolog
                                .substring(0, 1)
                                .toUpperCase(),
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      title: Text(
                        consultationData.psikolog,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      subtitle: Column(
                        children: [
                          Text(consultationData.date),
                          Text(consultationData.time)
                        ],
                      ),
                      // title: Text(listContact.name),
                    );
                  },
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
