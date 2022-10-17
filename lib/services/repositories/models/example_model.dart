import 'dart:convert';

class ExampleModel {

  static const tableName = "ExampleTable";
  ExampleModel({
      this.id,
      required this.title,
      required this.year,
  });

  int? id;
  String title;
  int year;

  factory ExampleModel.fromJson(String str) => ExampleModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExampleModel.fromMap(Map<String, dynamic> json) => ExampleModel(
      id: json["id"],
      title: json["title"],
      year: json["year"],
  );

  Map<String, dynamic> toMap() => {
      "id": id,
      "title": title,
      "year": year,
  };
}