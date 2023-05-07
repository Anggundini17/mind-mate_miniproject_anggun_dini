// import 'package:calender_picker/date_picker_widget.dart';

import 'dart:ui';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_mate_app/models/consultation.dart';
import 'package:mind_mate_app/view_model/db_manager_provider.dart';
import 'package:provider/provider.dart';

import '../../models/psikolog.dart';
// import 'package:get/get.dart';

// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ConsultationPage extends StatefulWidget {
  final Psikolog getPsikolog;
  final Consultation? getConsultationModel;
  const ConsultationPage(
      {super.key, required this.getPsikolog, this.getConsultationModel});

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadedData();
  }

  final _formKey = GlobalKey<FormState>();
  DatePickerController _date = DatePickerController();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _complainment = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();

  // @override
  // void dispose() {
  //   // _date.dispose();
  //   _startTimeController.dispose();
  //   _complainment.dispose();
  //   _endTimeController.dispose();
  //   super.dispose();
  // }

  bool isEditing = false;
  int? selectedIndex;

  void loadedData() {
    if (widget.getConsultationModel != null) {
      _date = widget.getConsultationModel!.date as DatePickerController;
      _startTimeController.text = widget.getConsultationModel!.time;
      _complainment.text = widget.getConsultationModel!.consult;

      isEditing = true;
    }
  }

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

  var date;

  DateTime selectedTime = DateTime.now();
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = '07:00 P.M';

  TimeOfDay _dueTime = TimeOfDay.now();

  // DateTime today = DateTime.now();
  // DateTime start = DateTime(today.year, today.month, today.day + 1);
  // DateTime end = DateTime(today.year, today.month, today.day + 2);
//   final now = DateTime.now();
// final start = DateTime(now.year, now.month, now.day);
// final end = DateTime(now.year, now.month, now.day + 7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 252, 252, 1),
      appBar: AppBar(
        title: const Text('Consultation Form'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://i.pinimg.com/564x/ab/5a/e5/ab5ae5ea7ce8ee34e548a52f5adcde41.jpg',
              ),
            ),
            ListTile(
              // leading: ClipRRect(
              //   borderRadius: BorderRadius.circular(10.0),
              //   child: Container(
              //     alignment: Alignment.center,
              //     constraints:
              //         const BoxConstraints(maxWidth: 50, maxHeight: 150),
              //     child: Image.network(
              //         'https://i.pinimg.com/564x/ab/5a/e5/ab5ae5ea7ce8ee34e548a52f5adcde41.jpg'),
              //   ),
              // ),
              title: Text(
                widget.getPsikolog.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.getPsikolog.specialist,
                  style: TextStyle(
                    fontSize: 16,
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Choose Date',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // datePicker(context),
            const SizedBox(
              height: 15,
            ),
            ClipRRect(
              child: DatePicker(
                controller: _date,
                DateTime.now(),
                height: 80,
                width: 80,
                deactivatedColor: Colors.blueGrey,
                initialSelectedDate: DateTime.now(),
                selectionColor: const Color.fromRGBO(37, 135, 149, 1),
                // selectionColor: ,
                selectedTextColor: Colors.white,
                dateTextStyle: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.grey),
                onDateChange: (selectedDate) {
                  setState(() {
                    var dateTesting = selectedDate;
                    date = DateFormat('d/M/y').format(dateTesting);
                    print(date);
                  });
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // buildDatePicker(context),
            const Text(
              'Choose a time for consult',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // buildTimePicker(context),
            const SizedBox(
              height: 15,
            ),
            timePicker(context),
            const SizedBox(
              height: 10,
            ),
            // Center(
            //   child: Wrap(
            //     children: List.generate(
            //       timeBook.length,
            //       (index) => Container(
            //         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //         padding: const EdgeInsets.all(10),
            //         decoration: BoxDecoration(
            //           border: Border.all(width: 1),
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: Text(timeBook[index]),
            //       ),
            //     ),
            //   ),
            // ),
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
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _complainment,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(37, 109, 121, 1),
                      width: 2,
                    ),
                  ),
                  focusColor: Color.fromRGBO(37, 109, 121, 1),
                  hintText: 'Pour it all out here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(37, 109, 121, 1),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(7.0)))),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      //   if (_formKey.currentState!.validate()) {

                      //   else {
                      //     return print('Not Valid');
                      //   }
                      // },
                      // isEditing = true;
                      if (isEditing == false) {
                        print("add string");
                        print(widget.getPsikolog.id);
                        final consultBook = Consultation(
                          psikolog: widget.getPsikolog.name.toString(),
                          date: date.toString(),
                          time: _startTime,
                          consult: _complainment.text,
                          psikologId: int.parse(widget.getPsikolog.id),
                        );
                        Provider.of<DatabaseManagerProvider>(context,
                                listen: false)
                            .addConsultation(consultBook);
                      } else {
                        // final consultBook = Consultation(
                        //   psikolog: widget.getPsikolog.name.toString(),
                        //   date: date,
                        //   time: _startTime,
                        //   consult: _complainment.text,
                        //   // psikologId: int.parse(
                        //   //     widget.getPsikolog.psikologDataId.toString()),
                        // );
                        // Provider.of<DatabaseManagerProvider>(context,
                        //         listen: false)
                        //     .updateConsultation(consultBook);
                      }
                      Navigator.of(context).pop(context);
                    },
                    child: const Text('Submit')))
          ],
        ),
      )),
    );
  }

  Widget datePicker(BuildContext context) {
    return TextFormField(
      autofocus: true,
      readOnly: true,
      // controller: _date,
      decoration: InputDecoration(
        focusColor: Color.fromRGBO(37, 109, 121, 1),
        hintStyle: const TextStyle(fontSize: 16, color: Colors.black87),
        suffixIcon: const Icon(Icons.calendar_today,
            color: Color.fromRGBO(37, 109, 121, 1)),
        hintText: DateFormat('EEE, M/d/y').format(_dueDate),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: const BorderSide(
            color: Color.fromRGBO(37, 109, 121, 1),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: BorderSide(
            color: Color.fromRGBO(37, 109, 121, 1),
            width: 2,
          ),
        ),
        // focusColor: Color.fromRGBO(37, 109, 121, 1),
        labelText: 'Date',
        labelStyle: TextStyle(
            color: Color.fromRGBO(37, 109, 121, 1),
            fontWeight: FontWeight.w500,
            fontSize: 16),
      ),
      onTap: () async {
        DateTime? selectDate = await showDatePicker(
            context: context,
            // builder: (BuildContext context, Widget? child) {
            //   return Theme(
            //     data: ThemeData.light().copyWith(
            //         primaryColor: Color.fromRGBO(37, 109, 121, 1),
            //         colorScheme: const ColorScheme.light()),
            //     child: child!,
            //   );
            // },
            initialDate: currentDate,
            firstDate: DateTime(1997),
            lastDate: DateTime(currentDate.year + 5));
        setState(() {
          if (selectDate != null) {
            _dueDate = selectDate;
          }
        });
      },
    );
  }

  Widget timePicker(BuildContext context) {
    return TextFormField(
      autofocus: true,
      readOnly: true,
      controller: _startTimeController,
      decoration: InputDecoration(
        focusColor: Color.fromRGBO(37, 109, 121, 1),
        suffixIcon: Icon(
          Icons.access_time,
          color: Color.fromRGBO(37, 109, 121, 1),
        ),
        labelText: 'Start Time',
        labelStyle: TextStyle(
            color: Color.fromRGBO(37, 109, 121, 1),
            fontWeight: FontWeight.w500,
            fontSize: 16),
        hintText: _startTime,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: const BorderSide(
            color: Color.fromRGBO(37, 109, 121, 1),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: BorderSide(
            color: Color.fromRGBO(37, 109, 121, 1),
            width: 2,
          ),
        ),
      ),
      onTap: () async {
        final selectTime = await showTimePicker(
            context: context,
            initialTime: _dueTime,
            initialEntryMode: TimePickerEntryMode.input);
        setState(() {
          if (selectTime != null) {
            _startTime = selectTime.format(context);
            _startTimeController.text = _startTime;
            print(_startTime);
          }
        });
      },
    );
    // SizedBox(
    //   width: 10,
    // )
    // Expanded(
    //   child: TextFormField(
    //     autofocus: true,
    //     readOnly: true,
    //     controller: _endTimeController,
    //     decoration: InputDecoration(
    //       suffixIcon: Icon(Icons.access_time,
    //           color: Color.fromRGBO(37, 109, 121, 1)),
    //       hintText: _endTime,
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(7.0),
    //         borderSide: BorderSide(
    //           color: Color.fromRGBO(37, 109, 121, 1),
    //           width: 2,
    //         ),
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(7.0),
    //         borderSide: BorderSide(
    //           color: Color.fromRGBO(37, 109, 121, 1),
    //           width: 2,
    //         ),
    //       ),
    //       labelText: 'End Time',
    //       labelStyle: TextStyle(
    //           color: Color.fromRGBO(37, 109, 121, 1),
    //           fontWeight: FontWeight.w500,
    //           fontSize: 16),
    //     ),
    //     onTap: () async {
    //       final selectTime = await showTimePicker(
    //         context: context,
    //         initialEntryMode: TimePickerEntryMode.input,
    //         initialTime: TimeOfDay(hour: 19, minute: 0),
    //       );
    //       setState(() {
    //         if (selectTime != null) {
    //           _endTime = selectTime.format(context);
    //           _endTimeController.text = _endTime;
    //         }
    //       });
    //     },
    //   ),
    // ),
    //   ],
    // );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
                onPressed: () async {
                  final selectDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(1997),
                      lastDate: DateTime(currentDate.year + 5));
                  setState(() {
                    if (selectDate != null) {
                      _dueDate = selectDate;
                    }
                  });
                },
                child: const Text('Select'))
          ],
        ),
        Text(DateFormat('dd-MM-yyyy').format(_dueDate))
      ],
    );
  }

  Widget buildTimePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Time'),
            TextButton(
                onPressed: () async {
                  final selectTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(hour: 09, minute: 00));
                  setState(() {
                    if (selectTime != null) {
                      _dueTime = selectTime;
                    }
                  });
                },
                child: const Text('Select'))
          ],
        ),
        Text(
          DateFormat('dd-MM-yyyy').format(_dueDate),
        )
      ],
    );
  }
}

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Horizontal Calendar Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Horizontal Calendar Demo'),
//         ),
//         body: MyHomePage(),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late DateTime _selectedDate = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     final List<DateTime> dates =
//         List.generate(7, (index) => DateTime.now().add(Duration(days: index)));

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 100,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: dates.length,
//             itemBuilder: (context, index) {
//               final date = dates[index];
//               final weekday = DateFormat.E().format(date);
//               final day = DateFormat.d().format(date);

//               return InkWell(
//                 onTap: () {
//                   setState(() {
//                     _selectedDate = date;
//                   });
//                 },
//                 child: Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: _selectedDate == date ? Colors.blue : null,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         weekday,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         day,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 24,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         SizedBox(height: 16),
//         Text(
//           _selectedDate != null
//               ? 'Selected date: ${DateFormat.yMd().format(_selectedDate)}'
//               : 'No date selected',
//         ),
//       ],
//     );
//   }
// }
