import 'dart:convert';

import 'package:mind_mate_app/models/psikolog.dart';

import 'package:http/http.dart' as http;

class PsikologApi {
  static const String baseUrl =
      'https://6453506de9ac46cedf21f2a7.mockapi.io/mindmate/';
  static const String psikolog = '/psikolog';

  static Future<List<Psikolog>> getPsikolog() async {
    final response = await http.get(Uri.parse('$baseUrl$psikolog'));

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      final List<Psikolog> psikologs =
          body.map((e) => Psikolog.fromJson(e)).toList();
      return psikologs;
    } else {
      throw "Can't get the data";
    }
  }

  static Future<Psikolog> getPsikologById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/psikolog?id=$id'));
    print('oke');
    final dynamic body = jsonDecode(response.body);
    print("Body: $body");
    final List<Psikolog> psikologs =
        body.map((e) => Psikolog.fromJson(e)).toList();
    final Psikolog psikolog = Psikolog.fromJson(body);
    print(psikolog.name);
    return psikolog;
  }
}
