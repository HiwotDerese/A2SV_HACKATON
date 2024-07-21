import 'dart:async';
import 'dart:io';

import 'package:dozer_mobile/core/data/apis/api_end_points.dart';
import 'package:dozer_mobile/core/data/network/network_api_service.dart';
import 'package:dozer_mobile/core/errors/exceptions.dart';
import 'package:dozer_mobile/core/utils/get_storage_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthenticationRepository {
  final NetworkApiService _apiService = NetworkApiService();

  Future<bool> sendOtp(String phoneNumber) async {
    try {
      // debugPrint('phone number: $phoneNumber');
      final response = await http.post(
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.sendOtp),
        body: {'phoneNumber': phoneNumber},
      );
      // debugPrint('response: ${response.statusCode}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> verifyOtp(String phoneNumber, String code) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.verifyOtp),
        body: {'phoneNumber': phoneNumber, 'code': code},
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> resendOtp(String phoneNumber) async {
    try {
      final response = await http.post(
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.resendOtp),
          body: {'phoneNumber': phoneNumber});
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> registerUser(String phoneNumber, String email, String password,
      String firstName, String lastName) async {
    try {
      String url = ApiEndPoints.baseUrl + ApiEndPoints.registerUser;

      final response = await http.post(
        Uri.parse(url),
        body: {
          'phoneNumber': phoneNumber,
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName
        },
      );

      final responseBody = json.decode(response.body);
      // print('response: ${responseBody['error']}');

      if (response.statusCode == 201) {
        // Parse the JSON response
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        // Access the token, email, and name from the parsed response
        String token = jsonResponse["token"];
        String userEmail = jsonResponse["user"]["email"];
        String userName = jsonResponse["userProfile"]["firstName"] +
            ' ' +
            jsonResponse["userProfile"]["lastName"];
        String isSubscribed = jsonResponse["userProfile"]["isSubscribed"];

        String image = jsonResponse["userProfile"]["image"];
        print('token in register: $token');
        print('email in register: $userEmail');
        print('name in register: $userName');
        print('image in register: $image');
        // Store the token using GetStorageHelper or perform any other operations
        await GetStorageHelper.addValue("token", token);
        await GetStorageHelper.addValue("email", userEmail);
        await GetStorageHelper.addValue("userName", userName);
        await GetStorageHelper.addValue("isSubscribed", isSubscribed);
        await GetStorageHelper.addValue("profileImage", image);

        return true;
      } else {
        throw Exception('${responseBody['error']}');
      }
    } on SocketException catch (e) {
      throw const NoInternetException(
          message:
              'No Internet Connection. Please check your Internet connection and try again');
    } on TimeoutException catch (e) {
      throw const ConnectionTimeoutException(message: 'Connection Timeout');
    } on FormatException catch (e) {
      throw const UnknownException(
          message: 'Invalid format response exception occurred!');
    } on http.ClientException catch (e) {
      throw const UnknownException(
          message:
              'The server refused to connect while trying to register user');
    } on CacheException {
      throw const CacheException(message: "Failed to cache token");
    }
  }

  Future<bool> login(String phoneNumber, String password) async {
    try {
      String url = ApiEndPoints.baseUrl + ApiEndPoints.login;
      final response = await http.post(
        Uri.parse(url),
        body: {'phoneNumber': phoneNumber, 'password': password},
      );

      print('login response: ${response.body}');
      print('login response status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        String token = jsonResponse["token"];
        String profileId = jsonResponse["userProfile"]["id"];
        bool isSubscribed = jsonResponse["user"]["isSubscribed"];
        String userName = jsonResponse["userProfile"]["firstName"] +
            ' ' +
            jsonResponse["userProfile"]["lastName"];
        String image = jsonResponse["userProfile"]["image"];
        print('token in login: $token');
        print('profileId in login: $profileId');
        if (token.isEmpty) {
          throw const UnknownException(message: 'No user!');
        } else {
          await GetStorageHelper.addValue("token", token);
        }

        if (profileId.isNotEmpty) {
          await GetStorageHelper.addValue("profileId", profileId);
        } else {
          throw const UnknownException(message: 'No profile!');
        }
        await GetStorageHelper.addValue("isSubscribed", isSubscribed);
        await GetStorageHelper.addValue("userName", userName);
        await GetStorageHelper.addValue("profileImage", image);

        print('*********************************');
        print(GetStorageHelper.getValue("profileId"));
        // GetStorageHelper.clearAll();

        return true;
      } else if (response.statusCode == 404) {
        throw const NotFoundException(message: 'Resource not found!');
      } else if (response.statusCode == 500) {
        throw const InternalServerException(
            message: 'Internal server error occurred!');
      } else if (response.statusCode == 422 || response.statusCode == 400) {
        throw const InvalidInputException(
            message: "Invalid input: Please check your input");
      } else if (response.statusCode == 415) {
        throw const InvalidInputException(
            message: "Invalid input: Please check your input");
      } else {
        throw const UnknownException(
            message: 'An unknown error occurred while trying to verify otp!');
      }
    } on SocketException catch (e) {
      throw const NoInternetException(
          message:
              'No Internet Connection. Please check your Internet connection and try again');
    } on TimeoutException catch (e) {
      throw const ConnectionTimeoutException(message: 'Connection Timeout');
    } on FormatException catch (e) {
      throw const UnknownException(
          message: 'Invalid format response exception occurred!');
    } on http.ClientException catch (e) {
      throw const UnknownException(
          message: 'The server refused to connect while trying to verify otp');
    } on CacheException {
      throw const CacheException(message: "Failed to cache token");
    }
  }

  Future<bool> resetPassword(String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.resetPassword),
        body: {'phoneNumber': phoneNumber},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
