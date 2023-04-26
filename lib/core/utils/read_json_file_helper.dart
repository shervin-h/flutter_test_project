import 'dart:convert';
import 'package:flutter/services.dart';


/// pars json file to list or map dart data types
Future<dynamic> readJson({required String path}) async {
  final String response = await rootBundle.loadString(path);
  final data = await json.decode(response);
  return data;
}