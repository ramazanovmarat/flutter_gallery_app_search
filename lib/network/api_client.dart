import 'package:flutter_gallery_app_search/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<dynamic> getPics(String searchQuery) async {

  http.Response response;

  final String url = "https://pixabay.com/api/?key=${Constants.apiKey}&q=$searchQuery&image_type=photo&pretty=true";
  response = await http.get(Uri.parse(url));
  if(response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    return response.statusCode;
  }
  
}