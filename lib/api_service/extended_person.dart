import 'person_model.dart';

class ExtendedPerson extends Person {
  bool isMarried;

  // Constructor
  ExtendedPerson({
    required String name,
    required dynamic age,
    required this.isMarried,
  }) : super.named(name: name, age: age);

  // Factory: Convert from JSON
  factory ExtendedPerson.fromJson(Map<String, dynamic> json) {
    return ExtendedPerson(
      name: json['name'],
      age: json['age'],
      isMarried: json['isMarried'] ?? false,
    );
  }

  // Method: Convert to JSON
  @override
  Map<String, dynamic> toJson() {
    final parentJson = super.toJson();
    parentJson['isMarried'] = isMarried;
    return parentJson;
  }
}
