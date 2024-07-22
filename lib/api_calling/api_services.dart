import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiServices {
  String baseUrl = "https://dummyjson.com/posts";
  static ApiServices apiServices = ApiServices();
  Future<Map> fetchData() async {
    Response response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      return json;
    } else {
      throw "Unexpected error occurred ";
    }
  }
}
