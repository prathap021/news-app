import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/apple_model.dart';
import 'package:news_app/utils/constants.dart';

class AppleServices {
  Future<AppleModel>? fetchapple() async {
    var url = ApiConstants.appleurl;
    var apikey = ApiConstants.appleapikey;
    final response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.authorizationHeader: apikey,
      },
    );
    if (response.statusCode == 200) {
      debugPrint("apple service success");
      var jsondata = jsonDecode(response.body.toString());
      return AppleModel.fromJson(jsondata);
    } else {
      throw Exception("failed Apple data");
    }
  }
}
