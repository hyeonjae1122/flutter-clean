import 'dart:convert';

import 'package:flutter_clean/data/data_source/result.dart';
import 'package:http/http.dart' as http;
class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api';
  static const key = '45400545-a09ee74fe1c5a3f1a55373d9d';

  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await client
          .get(Uri.parse(
          '$baseUrl/?key=$key&q=$query&image_type=photo&pretty=true'));
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['hits'];
      return Result.success(hits);
    } catch(e){
      return Result.error('네트워크에러');
    }
  }
}