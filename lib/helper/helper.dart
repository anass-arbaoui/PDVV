import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class Helper {
  Future<http.Response> envoyerRecharge(
      {required String phoneNumber, required int amount}) async {
    return await http.post(
      Uri.parse('http://192.168.43.123:8080/recharge'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, dynamic>{'phoneNumber': phoneNumber, 'amount': amount}),
    );
  }
}
