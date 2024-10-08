import 'package:flutter/material.dart';
import 'package:flutter_clean/presentation/home/home_view_model.dart';
import 'package:flutter_clean/presentation/home/components/photo_widget.dart';
import 'package:provider/provider.dart';

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
    // 옛날 방식
    // final viewModel = Provider.of<HomeViewModel>(context);
    // 신방식
    // final viewModel = context.watch<HomeViewModel>();

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
                        context.read<HomeViewModel>().fetch(_controller.text);
                      }, icon: const Icon(Icons.search)),
                ),
              ),
            ),
            Consumer<HomeViewModel>(
              builder: (_, viewModel, child) {
                return Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: viewModel.photos.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        final photo = viewModel.photos[index];
                        return  PhotoWidget(photo: photo);
                      },
                    ));
                },
            )
          ],
        ));
  }
}
