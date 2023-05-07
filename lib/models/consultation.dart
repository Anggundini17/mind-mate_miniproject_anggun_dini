// class Consultation {
//   int? id;
//   DateTime date;
//   String consult;
//   String time;

//   Consultation({
//     required this.id,
//     required this.date,
//     required this.consult,
//     required this.time,
//   });

//   Consultation.fromMap(Map<String, dynamic> map) {
//     id:
//     map['id'];
//     date:
//     DateTime.parse(map["date"]);
//     consult: map['consult'];
//     time:
//     map['time'];
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       "id": id,
//       "date": date.toIso8601String(),
//       "time": time,
//       "consult": consult,
//     };
//   }
// }

//

import 'psikolog.dart';

class Consultation {
  int? id;
  String date;
  String psikolog;
  String time;
  String consult;
  int psikologId;

  Consultation({
    this.id,
    required this.date,
    required this.psikolog,
    required this.time,
    required this.consult,
    required this.psikologId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'psikolog': psikolog,
      'time': time,
      'consult': consult,
      'psikologId': psikologId,
    };
  }

  static Consultation fromMap(Map<String, dynamic> map) {
    return Consultation(
      id: map['id'],
      date: map["date"],
      psikolog: map['psikolog'],
      time: map['time'],
      consult: map['consult'],
      psikologId: map['psikologId'],
    );
  }
}
