import 'package:dozer_mobile/core/data/network/api_exceptions.dart';
import 'package:dozer_mobile/core/data/network/network_api_service.dart';
import 'package:dozer_mobile/presentation/equipment_list/models/construction_machine.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ConstructionMachineRepository {
  final String apiUrl = 'https://dozer-backend-tech-gem.onrender.com/api/v1/equipments/';
final NetworkApiService _apiService = NetworkApiService();
   Future<List<ConstructionMachineModel>> getRecommendedMachines() async {
    try {
      final response = await _apiService.getResponse(apiUrl);

      if (response != null && response['status'] == 'success') {
        final List<dynamic> machinesData = response['equipments'];

        final List<ConstructionMachineModel> recommendedMachines = machinesData
            .map((machineJson) =>
                ConstructionMachineModel.fromJson(machineJson as Map<String, dynamic>))
            .toList();

        return recommendedMachines;
      } else {
        throw ApiException('Invalid response format. Expected a valid response with status "success".');
      }
    } catch (error) {
      throw ApiException('Error during API request: $error');
    }
  }
   Future<List<ConstructionMachineModel>> getMachinesByCategory(String category) async {
    try {
      final response = await _apiService.getResponse('${apiUrl}by-category/$category');

      if (response != null && response['status'] == 'success') {
        final List<dynamic> machinesData = response['equipments'];

        final List<ConstructionMachineModel> recommendedMachines = machinesData
            .map((machineJson) =>
                ConstructionMachineModel.fromJson(machineJson as Map<String, dynamic>))
            .toList();

        return recommendedMachines;
      } else {
        throw ApiException('Invalid response format. Expected a valid response with status "success".');
      }
    } catch (error) {
      throw ApiException('Error during API request: $error');
    }
  }
  
  }