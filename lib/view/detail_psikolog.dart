import 'package:flutter/material.dart';

class DetailPsikolog extends StatelessWidget {
  const DetailPsikolog({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/ab/5a/e5/ab5ae5ea7ce8ee34e548a52f5adcde41.jpg'),
            ),
            sizedBox1(),
            const Text(
              'Jefferey Wijaya',
              style: TextStyle(fontSize: 20),
            ),
            sizedBox2(),
            const ListTile(
              title: Text(
                'Specialist',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Clinic Psycology',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const ListTile(
              title: Text(
                'Expert',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Children, Anxiety',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const ListTile(
              title: Text(
                'Education',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Harvard University Psicology Faculty',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              title: const Text(
                'Experience',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Budi Kemuliaan Batam Hospital - 5 Tahun ',
                    style: TextStyle(fontSize: 16),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  Text(
                    'Germany Hospital - 3 Tahun ',
                    style: TextStyle(fontSize: 16),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  Text(
                    'Neo City Hospital - 2 Tahun ',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const ListTile(
              title: Text(
                'Expert',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Children, Anxiety',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Consultation'))
          ],
        ),
      ),
    );
  }

  SizedBox sizedBox1() => const SizedBox(
        height: 10,
      );

  SizedBox sizedBox2() => const SizedBox(
        height: 20,
      );
}
