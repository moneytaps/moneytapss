import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moneytap/model/usermodel.dart';

class FetchUser {
  var data = [];
  List<Userlist> results = [];
  String fetchurl = "http://127.0.0.1:8080/api/user";

  Future<List<Userlist>> getUserList() async {
    var url = Uri.parse(fetchurl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => Userlist.fromJson(e)).toList();
      } else {
        print('api error');
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}