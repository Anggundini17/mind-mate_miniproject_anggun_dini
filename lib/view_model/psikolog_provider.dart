import 'package:flutter/cupertino.dart';
import 'package:mind_mate_app/models/psikolog.dart';

import '../models/api/api_psikolog.dart';

enum PsikologViewState {
  empty,
  loading,
  loaded,
  error,
}

class PsikologProvider with ChangeNotifier {
  List<Psikolog> _listPsikolog = [];
  List<Psikolog> get listPsikolog => _listPsikolog;

  Psikolog? _singlePsikolog;
  Psikolog? get singlePsikolog => _singlePsikolog;

  PsikologViewState _requestState = PsikologViewState.empty;
  PsikologViewState get requestState => _requestState;

  String _message = '';
  String get message => _message;

  Future<void> getPsikologList() async {
    _requestState = PsikologViewState.loading;
    notifyListeners();

    try {
      final result = await PsikologApi.getPsikolog();
      _listPsikolog = result;
      _requestState = PsikologViewState.loaded;
      notifyListeners();
      print('Data Psikolog : ${_listPsikolog.length}');
    } catch (e) {
      _requestState = PsikologViewState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}
