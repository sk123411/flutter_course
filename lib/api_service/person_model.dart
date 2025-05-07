

class Person {
  String name;
  dynamic age;

  Person({required this.name, required this.age});

  // Optional: Convert from JSON
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      age: json['age'],
    );
  }

  // Optional: Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }
}
