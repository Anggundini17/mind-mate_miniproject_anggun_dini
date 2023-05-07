import 'package:flutter/cupertino.dart';

class ConsultationDateTimeProvider with ChangeNotifier {
  final DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  final List<String> _selectedTime = [
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

  List<String> get selectedTime => _selectedTime;
}
