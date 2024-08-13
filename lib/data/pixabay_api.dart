import 'dart:convert';
import 'package:flutter_clean/data/photo_api_repository.dart';
import 'package:http/http.dart' as http;
import '../model/Photo.dart';
class PixabayApi implements PhotoApiRepository {
  static const baseUrl = 'https://pixabay.com/api';
  static const key = '45400545-a09ee74fe1c5a3f1a55373d9d';

  @override
  Future<List<Photo>> fetch(String query, {http.Client? client} ) async {
    client ??= http.Client();
    final response = await client.get(Uri.parse(
        '$baseUrl/?key=$key&q=$query&image_type=photo&pretty=true'));
    Map<String, dynamic> jsonResponse =jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}

