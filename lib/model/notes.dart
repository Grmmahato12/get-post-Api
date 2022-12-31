

class Notes {
  String id;
  String title;
  String description;

  Notes(
    {
      required this.id,
      required this.title,
      required this.description,
    }
  );

  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(
      id: json["_id"],
       title: json["title"],
        description: json["description"]);
  }
  
}

