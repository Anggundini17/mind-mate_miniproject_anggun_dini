import 'package:flutter/material.dart';
import 'package:mind_mate_app/models/psikolog.dart';
import 'package:mind_mate_app/view/psikolog/test_consult.dart';
import 'package:provider/provider.dart';

import '../../view_model/psikolog_provider.dart';
import '../test_card.dart';
import 'consult.dart';

class DetailPsikolog extends StatelessWidget {
  // final String id;
  final Psikolog psikolog;
  const DetailPsikolog({super.key, required this.psikolog});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              sizedBox2(),
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/564x/ab/5a/e5/ab5ae5ea7ce8ee34e548a52f5adcde41.jpg'),
              ),
              sizedBox1(),
              Text(
                // 'Jefferey Wijaya',
                psikolog.name,

                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              sizedBox2(),
              ListTile(
                title: Text(
                  'Specialist',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  psikolog.specialist,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTile(
                title: const Text(
                  'Expert',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  psikolog.expert,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTile(
                title: const Text(
                  'Education',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  psikolog.education,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTile(
                title: const Text(
                  'Experience',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: ListView.builder(
                  shrinkWrap: true,
                  itemCount: psikolog.experience.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(
                      psikolog.experience[index],
                      // 'Budi Kemuliaan Batam Hospital - 5 Tahun ',
                      style: TextStyle(fontSize: 16),
                    );
                    // ),
                    // // SizedBox(
                    // //   height: 5,
                    // // ),
                    // Text(
                    //   'Germany Hospital - 3 Tahun ',
                    //   style: TextStyle(fontSize: 16),
                    // ),
                    // // SizedBox(
                    // //   height: 5,
                    // // ),
                    // Text(
                    //   'Neo City Hospital - 2 Tahun ',
                    //   style: TextStyle(fontSize: 16),
                    // ),
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Experience Time',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  psikolog.timeExperience,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MyFadeRoute(
                  //     route: DateTimePickerPage(),
                  //   ),
                  // );
                },
                child: Text(
                  'Consultation',
                  style: TextStyle(
                    color: Colors.black.withOpacity(.8),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(180, 235, 237, 1)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7))),
                ),
              )
            ],
          )),
    );
  }

  SizedBox sizedBox1() => const SizedBox(
        height: 10,
      );

  SizedBox sizedBox2() => const SizedBox(
        height: 20,
      );
}
