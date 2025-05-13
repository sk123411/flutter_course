

class Person {
  String name;
  dynamic age;

  // Normal Constructor (non-named)
  Person(this.name, this.age);

  // Named Constructor
  Person.named({required this.name, required this.age});

  // Factory: Convert from JSON
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person.named(
      name: json['name'],
      age: json['age'],
    );
  }

  // Method: Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }

  // Named Method: Celebrate Birthday
  void celebrateBirthday() {
    if (age is int) {
      age += 1;
      print("Happy Birthday $name! You are now $age years old.");
    }
  }

  // --- 🆕 Named Utility Method: Get Initials ---
   String getInitials({required String name}) {
    final parts = name.trim().split(" ");
    if (parts.isEmpty) return "";
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return "${parts[0][0]}${parts[1][0]}".toUpperCase();
  }

  // --- 🆕 Named Utility Method: Create Default Person ---
   String createDefault({required String name, int age = 0}) {
    return "Name: $name Age: $age";
  }

  // --- 🆕 Named Utility Method: Check Name Validity ---
  static bool isValidName({required String name}) {
    return name.trim().length >= 3;
  }
}
