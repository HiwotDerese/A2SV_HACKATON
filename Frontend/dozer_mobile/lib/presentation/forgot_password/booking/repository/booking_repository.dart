import 'dart:convert';
import 'package:dozer_mobile/presentation/booking/models/booking_form_model.dart';
import 'package:http/http.dart' as http;

class BookingRepository {
  final String apiUrl = 'https://dozer-backend-tech-gem.onrender.com/api/v1/';

  Future<bool> confirmBooking(BookingModel booking) async {
    print(booking.toJson());
    try {
      final http.Response response = await http.post(
        Uri.parse('${apiUrl}bookings'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(booking.toJson()),
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final dynamic responseBody = jsonDecode(response.body);
        if (responseBody['status'] == 'success') {
          return true;
        } else {
          throw Exception(
              'Failed to confirm booking. Status: ${responseBody['status']}');
        }
      } else {
        throw Exception('Failed to confirm booking. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error confirming booking: $error');
      throw Exception('Failed to confirm booking');
    }
  }
}
