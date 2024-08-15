import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://api.data.gov.in/resource/93170d01-618b-42dc-967b-30181a69a31c';
  final String _apiKey = '579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b';
  
  Future<Map<String, dynamic>> fetchData() async {
    final url = '$_baseUrl?api-key=$_apiKey&format=json';
    
    try {
      // Making the HTTP GET request
      final response = await http.get(Uri.parse(url));
      
      // Check the status code and handle the response
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        // Log the status code for debugging
        print('Request failed with status: ${response.statusCode}.');
        throw Exception('Failed to load data api service');
      }
    } catch (e) {
      // Log the exception for debugging
      print('Exception: $e');
      throw Exception('Failed to load data: $e');
    }
  }
}
