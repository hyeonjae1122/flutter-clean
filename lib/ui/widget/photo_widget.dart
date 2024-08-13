import 'package:flutter/cupertino.dart';

import '../../model/photo.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo;

  const PhotoWidget({Key? key,
  required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration( // remove const because of no more const variable in NetworkImage
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                photo.previewURL
              ),)
      ),
    );
  }
}
