import 'package:flutter/material.dart';
import 'package:mind_mate_app/models/consultation.dart';

import '../helper/database_helper.dart';

class DatabaseManagerProvider with ChangeNotifier {
  List<Consultation> _getConsultationData = [];
  late DatabaseHelper _dbHelper;

  List<Consultation> get getConsultationData => _getConsultationData;

  DatabaseManagerProvider() {
    _dbHelper = DatabaseHelper();
    getAllConsultationData();
  }

  void getAllConsultationData() async {
    _getConsultationData = await _dbHelper.readConsultation();
    notifyListeners();
  }

  Future<void> addConsultation(Consultation addConsultation) async {
    await _dbHelper.insertConsultation(addConsultation);
    getAllConsultationData();
    notifyListeners();
  }

  void updateConsultation(Consultation updateConsultation) async {
    try {
      await _dbHelper.updateConsultation(updateConsultation);

      getAllConsultationData();
      notifyListeners();
    } catch (e) {
      print('Tidak Masuk');
    }
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
