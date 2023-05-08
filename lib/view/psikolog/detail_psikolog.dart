import 'package:flutter/material.dart';
import 'package:mind_mate_app/models/psikolog.dart';
import '../widget/animation.dart';
import 'consult.dart';

class DetailPsikolog extends StatelessWidget {
  // final String id;
  final Psikolog psikolog;
  const DetailPsikolog({super.key, required this.psikolog});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              sizedBox2(),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(psikolog.avatar
                    // 'https://i.pinimg.com/564x/ab/5a/e5/ab5ae5ea7ce8ee34e548a52f5adcde41.jpg'
                    ),
              ),
              sizedBox1(),
              Text(
                psikolog.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              sizedBox2(),
              ListTile(
                title: const Text(
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  'Specialist',
                ),
                subtitle: Text(
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  psikolog.specialist,
                ),
              ),
              ListTile(
                title: const Text(
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  'Expert',
                ),
                subtitle: Text(
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  psikolog.expert,
                ),
              ),
              ListTile(
                title: const Text(
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  'Education',
                ),
                subtitle: Text(
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  psikolog.education,
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
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    );
                  },
                ),
              ),
              ListTile(
                title: const Text(
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  'Time Experience',
                ),
                subtitle: Text(
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  psikolog.timeExperience,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MyFadeRoute(
                          route: ConsultationPage(
                            getPsikolog: psikolog,
                            pageStatus: PageStatus.addNew,
                          ),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(37, 109, 121, 1)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7))),
                    ),
                    child: const Text(
                      'Consultation',
                    ),
                  ),
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
