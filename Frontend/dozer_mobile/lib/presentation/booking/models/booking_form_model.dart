class BookingModel {
  final String equipmentId;
  final String email;
  final String startDate;
  final String endDate;
  final String location;
  final int quantity;
  final String signature;
  final bool termsAndConditions;

  BookingModel({
    required this.equipmentId,
    required this.email,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.quantity,
    required this.signature,
    required this.termsAndConditions,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      equipmentId: json['equipmentId'],
      email: json['email'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      location: json['location'],
      quantity: json['quantity'],
      signature: json['signature'],
      termsAndConditions: json['termsAndConditions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'equipmentId': equipmentId,
      'email': email,
      'startDate': startDate,
      'endDate': endDate,
      'location': location,
      'quantity': quantity,
      'signature': signature,
      'termsAndConditions': termsAndConditions,
    };
  }
}
