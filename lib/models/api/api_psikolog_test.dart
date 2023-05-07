class PsikologMockModel {
  String name;
  String avatar;
  String education;
  List<dynamic> experience;
  String timeExperience;
  String specialist;
  String expert;
  int id;

  PsikologMockModel({
    required this.name,
    required this.avatar,
    required this.education,
    required this.experience,
    required this.timeExperience,
    required this.specialist,
    required this.expert,
    required this.id,
  });

  factory PsikologMockModel.fromJson(Map<String, dynamic> json) =>
      PsikologMockModel(
        name: json["name"],
        avatar: json["avatar"],
        education: json["education"],
        experience: List<dynamic>.from(json["experience"].map((x) => x)),
        timeExperience: json["timeExperience"],
        specialist: json["specialist"],
        expert: json["expert"],
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
        "id": id,
      };
}
