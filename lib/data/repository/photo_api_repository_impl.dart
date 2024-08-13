import 'dart:convert';
import 'package:flutter_clean/data/data_source/pixabay_api.dart';
import 'package:flutter_clean/domain/repository/photo_api_repository.dart';
import 'package:http/http.dart' as http;
import '../../domain/model/photo.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  @override
  Future<List<Photo>> fetch(String query ) async {
    final result = await api.fetch(query);
    return result.map((e)=> Photo.fromJson(e)).toList();
  }
}

