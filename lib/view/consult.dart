// import 'package:calender_picker/date_picker_widget.dart';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:get/get.dart';

// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key});

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  final List<String> timeBook = [
    '09:00',
    '09:45',
    '10:00',
    '10:45',
    '11:00',
    '13:00',
    '13:45',
    '14:00',
    '14:45',
    '15:00',
    '15:45',
    '16:00',
  ];

  DateTime selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultation Form'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
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
              title: Text(
                'Jefferey Wijaya S.Psi,. M.Psi',
              ),
              subtitle: Text('Clinic Psycology'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Choose Date',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ClipRRect(
              child: DatePicker(
                DateTime.now(),
                height: 80,
                width: 80,
                // initialSelectedDate: DateTime.now(),
                selectionColor: Color.fromRGBO(37, 135, 149, 1),
                // selectionColor: ,
                selectedTextColor: Colors.white,
                dateTextStyle:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Choose a time for consult',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Wrap(
                children: [
                  ...List.generate(
                      timeBook.length,
                      (index) => Container(
                            margin: index == 0
                                ? const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10)
                                : const EdgeInsets.only(
                                    right: 20, left: 20, bottom: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(timeBook[index]),
                          ))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Pour out your grievances ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: 'Pour it all out here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(37, 109, 121, 1),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)))),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
                child: ElevatedButton(onPressed: () {}, child: Text('Submit')))
          ],
        ),
      )),
    );
  }
}
