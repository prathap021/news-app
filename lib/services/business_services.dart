import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:news_app/models/business_model.dart';
import 'package:news_app/utils/constants.dart';

class BusinessServices {
  Future<BusinessModel>? fetchbusiness() async {
    var url = ApiConstants.businessurl;
    var apikey = ApiConstants.businessapi;
    final response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.authorizationHeader: apikey,
      },
    );
    if (response.statusCode == 200) {
      debugPrint("business service success");
      var jsondata = jsonDecode(response.body.toString());
      return BusinessModel.fromJson(jsondata);
    } else {
      throw Exception("failed Apple data");
    }
  }
}
