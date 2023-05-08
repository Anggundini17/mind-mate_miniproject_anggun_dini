import 'package:flutter/material.dart';
import 'package:mind_mate_app/models/psikolog.dart';
import 'package:mind_mate_app/view/psikolog/consult.dart';
import 'package:mind_mate_app/view_model/db_manager_provider.dart';
import 'package:provider/provider.dart';

import '../view_model/psikolog_provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      () => Provider.of<DatabaseManagerProvider>(context, listen: false)
          .getAllConsultationData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 252, 252, 1),
      appBar: AppBar(
        title: const Text('Schedule History'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 30.0, left: 10.0, right: 10.0, bottom: 50.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.calendar_month,
                        color: Color.fromRGBO(35, 75, 86, 1),
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Your Schedule',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(35, 75, 86, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer<DatabaseManagerProvider>(
                  builder: (context, manager, child) {
                    final consultations = manager.getConsultationData;
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: consultations.length,
                      itemBuilder: (context, index) {
                        final consultationData =
                            manager.getConsultationData[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            consultationData.psikolog,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              'Date  : ${consultationData.date}'),
                                          Text(
                                              'Time  : ${consultationData.time}'),
                                          Text(
                                            'Keluhan : ${consultationData.consult}',
                                            maxLines: 9,
                                            overflow: TextOverflow.fade,
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                      ),
                                      onPressed: () async {
                                        String id = consultationData.psikologId
                                            .toString();
                                        Psikolog psikolog =
                                            Provider.of<PsikologProvider>(
                                                    context,
                                                    listen: false)
                                                .listPsikolog
                                                .singleWhere((element) =>
                                                    element.id == id);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ConsultationPage(
                                                      pageStatus:
                                                          PageStatus.editing,
                                                      getPsikolog: psikolog,
                                                      getConsultationModel:
                                                          consultationData,
                                                      index: index,
                                                    )));
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        manager.deleteConnsultation(
                                            consultationData.id!);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                        // Card(
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
