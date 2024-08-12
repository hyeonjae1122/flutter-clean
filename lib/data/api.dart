import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Photo.dart';
class PixabayApi {
  final baseUrl = 'https://pixabay.com/api';
  final key = '45400545-a09ee74fe1c5a3f1a55373d9d';
  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(Uri.parse(
        '$baseUrl/?key=$key&q=$query&image_type=photo&pretty=true'));
    Map<String, dynamic> jsonResponse =jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}

