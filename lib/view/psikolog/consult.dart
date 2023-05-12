import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_mate_app/models/consultation.dart';
import 'package:mind_mate_app/view_model/db_manager_provider.dart';
import 'package:provider/provider.dart';

import '../../models/psikolog.dart';

enum PageStatus { editing, addNew }

class ConsultationPage extends StatefulWidget {
  final PageStatus pageStatus;
  final Psikolog getPsikolog;
  final Consultation? getConsultationModel;
  final int? index;
  const ConsultationPage(
      {super.key,
      required this.pageStatus,
      required this.getPsikolog,
      this.getConsultationModel,
      this.index});

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  @override
  void initState() {
    super.initState();
    // loadedData();

    final consultation = widget.getConsultationModel;

    if (consultation != null) {
      isEditing = true;
      print('tanggal : ${consultation.date}');
      print('time : ${consultation.time}');
      print('deskripsi : ${consultation.consult}');

      initialSelectedDate = DateFormat('yyyy-MM-dd').parse(consultation.date);
      _startTimeController.text = consultation.time;
      _complainment.text = consultation.consult;
    }
  }

  DatePickerController _date = DatePickerController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _complainment = TextEditingController();
  DateTime initialSelectedDate = DateTime.now();

  bool isEditing = false;
  int? selectedIndex;

  String? date;

  DateTime selectedTime = DateTime.now();

  final currentDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    // print('TESTING');
    // print(widget.getConsultationModel!.id);
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
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width *
                    1, // set the width to a fixed value
                height: MediaQuery.of(context).size.height *
                    0.6, // set the height to a fixed value
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    widget.getPsikolog.avatar,
                    fit: BoxFit.cover, // set the image to cover the container
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                widget.getPsikolog.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.getPsikolog.specialist,
                  style: const TextStyle(
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
            ClipRRect(
              child: DatePicker(
                controller: _date,
                DateTime.now(),
                height: 80,
                width: 80,
                deactivatedColor: Colors.blueGrey,
                initialSelectedDate: initialSelectedDate,
                selectionColor: const Color.fromRGBO(37, 135, 149, 1),
                // selectionColor: ,
                selectedTextColor: Colors.white,
                dateTextStyle: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.grey),
                onDateChange: (selectedDate) {
                  setState(() {
                    var dateTesting = selectedDate;
                    date = DateFormat('yyyy-MM-dd').format(dateTesting);
                    print(date);
                  });
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Choose a time for consult',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            timePicker(context),
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
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(37, 109, 121, 1),
                      width: 2,
                    ),
                  ),
                  focusColor: const Color.fromRGBO(37, 109, 121, 1),
                  hintText: 'Pour it all out here',
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(37, 109, 121, 1),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(7.0)))),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: ElevatedButton(
                    onPressed: () {
                      if (isEditing == false) {
                        print("add string");
                        print(widget.getPsikolog.id);
                        final consultBook = Consultation(
                          psikolog: widget.getPsikolog.name.toString(),
                          date: date!,
                          time: _startTimeController.text,
                          consult: _complainment.text,
                          psikologId: int.parse(widget.getPsikolog.id),
                        );
                        Provider.of<DatabaseManagerProvider>(context,
                                listen: false)
                            .addConsultation(consultBook);
                      } else {
                        final consultBook = Consultation(
                          id: widget.getConsultationModel!.id,
                          psikolog: widget.getPsikolog.name.toString(),
                          date: date != null
                              ? date!
                              : widget.getConsultationModel!.date,
                          time: _startTimeController.text,
                          consult: _complainment.text,
                          psikologId: int.parse(widget.getPsikolog.id),
                        );

                        Provider.of<DatabaseManagerProvider>(context,
                                listen: false)
                            .updateConsultation(consultBook);
                      }
                      Navigator.of(context).pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(37, 109, 121, 1),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7))),
                    ),
                    child: const Text('Submit')))
          ],
        ),
      )),
    );
  }

  Widget timePicker(BuildContext context) {
    return TextFormField(
      autofocus: true,
      readOnly: true,
      controller: _startTimeController,
      decoration: InputDecoration(
        focusColor: const Color.fromRGBO(37, 109, 121, 1),
        suffixIcon: const Icon(
          Icons.access_time,
          color: Color.fromRGBO(37, 109, 121, 1),
        ),
        labelText: 'Start Time',
        labelStyle: const TextStyle(
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
          borderSide: const BorderSide(
            color: Color.fromRGBO(37, 109, 121, 1),
            width: 2,
          ),
        ),
      ),
      onTap: () async {
        final selectTime = await showTimePicker(
            context: context,
            initialTime: widget.pageStatus == PageStatus.editing
                ? TimeOfDay.fromDateTime(DateFormat('hh:mm')
                    .parse(widget.getConsultationModel!.time))
                : TimeOfDay.now(),
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
  }
}
