import 'dart:convert';
import 'package:dozer_mobile/core/data/apis/api_end_points.dart';
import 'package:dozer_mobile/presentation/create_equipment/models/equipment_model.dart';
import 'package:http/http.dart' as http;

class EquipmentRepository {
  final String apiUrl =  ApiEndPoints.baseUrl + ApiEndPoints.createEquipment;

  Future<bool> createEquipment(Equipment equipment) async {
    try {
      final dynamic response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(equipment.toJson()),
      );

      if (response == null) {
        throw Exception('Null response received.');
      }

      final dynamic responseBody = response is String ? jsonDecode(response) : response;

      if (responseBody == null) {
        throw Exception('Invalid JSON format.');
      }

      if (responseBody['status'] == 'success') {
        return true; // Assuming 'createEquipment' returns a boolean indicating success
      } else {
        throw Exception('Failed to create equipment. Status: ${responseBody['status']}');
      }
    } catch (error) {
      print('Error creating equipment: $error');
      throw Exception('Failed to create equipment');
    }
  }
}
