import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_apiurl_yasin/model_page.dart';

class Lessonserver {
  static Future<List<Details>> fetchLessons() async {
    print("Reading from URL");
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      print(response.body);

      // Mapping the JSON response to a list of PersonDetails
      List<Details> lessons =
          jsonResponse.map<Details>((data) => Details.fromJson(data)).toList();

      return lessons;
    } else {
      throw Exception('Failed to load lessons');
    }
  }
}
