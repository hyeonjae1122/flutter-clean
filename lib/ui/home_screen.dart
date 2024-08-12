import 'package:flutter/material.dart';
import 'package:flutter_clean/ui/widget/photo_widget.dart';
import '../data/api.dart';
import '../data/photo_provider.dart';
import '../model/Photo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();



  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final photoProvider = PhotoProvider.of(context);
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
                        photoProvider.fetch(_controller.text);

                      }, icon: const Icon(Icons.search)),
                ),
              ),
            ),
            StreamBuilder<List<Photo>>(
              stream: photoProvider.photoStream,
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return const CircularProgressIndicator();
                }

                final photos = snapshot.data!;
                return Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16.0),
                  itemCount: photos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                        final photo = photos[index];
                    return  PhotoWidget(photo: photo);
                  },
                ));
              }
            )
          ],
        ));
  }
}
