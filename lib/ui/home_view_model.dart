import 'dart:async';
import 'package:flutter_clean/data/photo_api_repository.dart';

import '../model/Photo.dart';

class HomeViewModel {
  final PhotoApiRepository repository;

  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  // ..을 사용하면 void를 사용하는 메서드(여기선 add)를 사용하면서 StreamController의 레퍼런스를 반환 할 수 있다.
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  HomeViewModel(this.repository);


  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photoStreamController.add(result);
  }
}