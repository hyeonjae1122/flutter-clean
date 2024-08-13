import 'dart:async';
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean/domain/repository/photo_api_repository.dart';

import '../../domain/model/photo.dart';


class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];

  //외부에서 photos를 수정할 수 없도록 하기위해 이렇게 씀
  //수정 못하는 리스트타입
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  HomeViewModel(this.repository);


  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photos = result;
    notifyListeners();
  }
}