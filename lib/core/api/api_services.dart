import 'dart:convert';

import 'package:http/http.dart';

class ApiServices {
  Future get({required String url}) async {
    try {
      var api = Client();
      Uri apiUrl = Uri.parse(url);
      Response response = await api.get(apiUrl);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
