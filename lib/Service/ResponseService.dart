import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/ResponseModel.dart';

class LeadService {
  static const String apiUrl = 'https://api.thenotary.app/lead/getLeads';
  static const String notaryId = '6668baaed6a4670012a6e406';

  Future<List<Lead>> fetchLeads() async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'notaryId': notaryId,
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> leadsData = jsonResponse['leads'];
      return leadsData.map((lead) => Lead.fromJson(lead)).toList();
    } else {
      throw Exception('Failed to load leads');
    }
  }
}
