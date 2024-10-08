import 'dart:convert';

import 'package:http/http.dart' as http;
class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api';
  static const key = '45400545-a09ee74fe1c5a3f1a55373d9d';

  Future<Iterable> fetch(String query) async {
    final response = await client
        .get(Uri.parse('$baseUrl/?key=$key&q=$query&image_type=photo&pretty=true'));
    Map<String,dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits;
  }
}