import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_clean/ui/widget/photo_widget.dart';
import 'package:http/http.dart' as http;
import '../model/Photo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  List<Photo> _photos = [];

  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=45400545-a09ee74fe1c5a3f1a55373d9d&q=$query&image_type=photo&pretty=true'));
    Map<String, dynamic> jsonResponse =jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '이미지 검색앱',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () async {
                        final photos = await fetch(_controller.text);
                        setState(() {
                          _photos=photos;
                        });
                      }, icon: const Icon(Icons.search)),
                ),
              ),
            ),
            Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16.0),
              itemCount: _photos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                    final photo = _photos[index];
                return  PhotoWidget(photo: photo);
              },
            ))
          ],
        ));
  }
}
