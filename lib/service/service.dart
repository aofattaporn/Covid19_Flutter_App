import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Service {

  Future<dynamic> showCovid() async{
    var url = "https://static.easysunday.com/covid-19/getTodayCases.json";
    var response = await http.get(Uri.parse(url));
    print(response);
    return jsonDecode(response.body);

  }
}