import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:news_app/models/tesla_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/utils/constants.dart';

class TeslaRemote {
  Future<TeslaModel>? fetchtesla() async {
    var url = ApiConstants.teslaurl;
    var apikey = ApiConstants.teslaapikey;
    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: apikey,
    });
    if (response.statusCode == 200) {
      debugPrint('tesla service sucess');
      var jsondata = jsonDecode(response.body.toString());
      return TeslaModel.fromJson(jsondata);
    } else {
      throw Exception("failed tesla api");
    }
  }
}
