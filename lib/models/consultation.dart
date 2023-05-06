class Consultation {
  int id;
  String date;
  String consult;
  String time;

  Consultation({
    required this.id,
    required this.date,
    required this.consult,
    required this.time,
  });

  factory Consultation.fromJson(Map<String, dynamic> json) => Consultation(
        id: json['id'],
        date: json['date'],
        consult: json['consult'],
        time: json['time'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "time": time,
        "content": consult,
      };
}
