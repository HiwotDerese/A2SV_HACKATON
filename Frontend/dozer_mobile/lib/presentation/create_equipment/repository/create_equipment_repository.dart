import 'dart:convert';
import 'package:dozer_mobile/core/data/apis/api_end_points.dart';
import 'package:dozer_mobile/core/utils/get_storage_helper.dart';
import 'package:dozer_mobile/presentation/create_equipment/models/equipment_model.dart';
import 'package:http/http.dart' as http;

class EquipmentRepository {
  final String apiUrl = ApiEndPoints.baseUrl + ApiEndPoints.equipment;

  Future<bool> createEquipment(Equipment equipment) async {
    try {
      print('Creating equipment...');
      print(jsonEncode(equipment.toJson()));

      final String? userToken = GetStorageHelper.getValue('token');
      print('User token: $userToken');
      if (userToken == null) {
        throw Exception('You are not logged in. Please log in to continue.');
      }

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $userToken',
        },
        body: jsonEncode(equipment.toJson()),
      );
      print(response.body);
      final responseBody = jsonDecode(response.body);
      // print(responseBody);
      print(response.statusCode);

      if (responseBody == null) {
        throw Exception('Invalid JSON format.');
      }

      if (responseBody['status'] == 'success') {
        return true;
      } else {
        throw Exception(
            'Failed to create equipment. Status: ${responseBody['status']}');
      }
    } catch (error) {
      print('Error creating equipment: $error');
      throw Exception('Failed to create equipment');
    }
  }
}
