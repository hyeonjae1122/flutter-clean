import 'package:flutter/material.dart';
import 'package:flutter_clean/data/photo_provider.dart';
import 'package:flutter_clean/ui/home_screen.dart';
import 'package:flutter_clean/ui/home_view_model.dart';

import 'data/pixabay_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PhotoProvider(
        viewModel: HomeViewModel(PixabayApi()),
        child: const HomeScreen(),
      ),
    );
  }
}

