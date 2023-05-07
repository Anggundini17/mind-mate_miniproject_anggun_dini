import 'package:flutter/material.dart';
import 'package:mind_mate_app/models/consultation.dart';

import '../helper/database_helper.dart';

class DatabaseManagerProvider with ChangeNotifier {
  List<Consultation> _getConsultationData = [];
  late DatabaseHelper _dbHelper;

  List<Consultation> get getConsultationData => _getConsultationData;

  // final DateTime _selectedDate = DateTime.now();
  // DateTime get selectedDate => _selectedDate;

  // final List<String> _selectedTime = [
  //   '09:00',
  //   '09:45',
  //   '10:00',
  //   '10:45',
  //   '11:00',
  //   '13:00',
  //   '13:45',
  //   '14:00',
  //   '14:45',
  //   '15:00',
  //   '15:45',
  //   '16:00',
  // ];

  // List<String> get selectedTime => _selectedTime;

  DatabaseManagerProvider() {
    _dbHelper = DatabaseHelper();
    getAllConsultationData();
  }

  void getAllConsultationData() async {
    print('Test maniez');

    _getConsultationData = await _dbHelper.readConsultation();
    notifyListeners();
  }

  Future<void> addConsultation(Consultation addConsultation) async {
    await _dbHelper.insertConsultation(addConsultation);
    getAllConsultationData();
    notifyListeners();
  }

  void updateConsultation(Consultation updateConsultation) async {
    await _dbHelper.updateConsultation(updateConsultation);
    getAllConsultationData();
    // notifyListeners();
  }

  Future<Consultation> getConsultationById(int id) async {
    return await _dbHelper.getConsultationById(id);
    // notifyListeners();
  }

  void deleteConnsultation(int id) async {
    await _dbHelper.deleteConsultation(id);
    getAllConsultationData();
  }
}
