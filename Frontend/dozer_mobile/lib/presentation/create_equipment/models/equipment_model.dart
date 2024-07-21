class Equipment {
  final String name;
  final int quantity;
  final int pricePerHour;
  final String location;
  final String description;
  final String category;
  final List<String> image;
  final String capacity;
  final String model;
  final List<String> specifications;
  final bool transportation;

  Equipment({
    required this.name,
    required this.quantity,
    required this.pricePerHour,
    required this.location,
    required this.description,
    required this.category,
    required this.image,
    required this.capacity,
    required this.model,
    required this.specifications,
    required this.transportation,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      pricePerHour: json['pricePerHour'] as int,
      location: json['location'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      image: List<String>.from(json['image'] as List),
      capacity: json['capacity'] as String,
      model: json['model'] as String,
      specifications: List<String>.from(json['specifications'] as List),
      transportation: json['transportation'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'pricePerHour': pricePerHour,
      'location': location,
      'description': description,
      'category': category,
      'image': image,
      'capacity': capacity,
      'model': model,
      'specifications': specifications,
      'transportation': transportation,
    };
  }
}
 