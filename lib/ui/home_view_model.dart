import 'dart:async';
import 'package:flutter_clean/data/api.dart';

import '../model/Photo.dart';

class HomeViewModel {
  final PixabayApi api;

  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  // ..을 사용하면 void를 사용하는 메서드(여기선 add)를 사용하면서 StreamController의 레퍼런스를 반환 할 수 있다.
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  HomeViewModel(this.api);


  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }
}