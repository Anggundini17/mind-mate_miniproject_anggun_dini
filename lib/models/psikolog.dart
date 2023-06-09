class Psikolog {
  String name;
  String avatar;
  String education;
  List<dynamic> experience;
  String timeExperience;
  String specialist;
  String expert;
  int idData;
  String id;

  Psikolog({
    required this.name,
    required this.avatar,
    required this.education,
    required this.experience,
    required this.timeExperience,
    required this.specialist,
    required this.expert,
    required this.idData,
    required this.id,
  });

  factory Psikolog.fromJson(Map<String, dynamic> json) => Psikolog(
        name: json["name"],
        avatar: json["avatar"],
        education: json["education"],
        experience: List<dynamic>.from(json["experience"].map((x) => x)),
        timeExperience: json["timeExperience"],
        specialist: json["specialist"],
        expert: json["expert"],
        idData: json["idData"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "avatar": avatar,
        "education": education,
        "experience": List<dynamic>.from(experience.map((x) => x)),
        "timeExperience": timeExperience,
        "specialist": specialist,
        "expert": expert,
        "idData": idData,
        "id": id,
      };
}
