import 'package:flutter_clean/domain/model/photo.dart';
import 'package:flutter_clean/domain/repository/photo_api_repository.dart';
import 'package:flutter_clean/presentation/home/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Stream works well',() async {
    final viewModel = HomeViewModel(FakePhotoApiRepository());
    await viewModel.fetch('apple');
    await viewModel.fetch('apple');
    await viewModel.fetch('apple');

    final List<Photo> result =fakeJson.map((e)=>Photo.fromJson(e)).toList();

    expect(viewModel.photos, result);

  });
}

class FakePhotoApiRepository extends PhotoApiRepository{
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(microseconds: 500));

    return fakeJson.map((e)=>Photo.fromJson(e)).toList();
  }

}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 1661722,
    "pageURL": "https://pixabay.com/photos/woman-beach-vacation-summer-bikini-1661722/",
    "type": "photo",
    "tags": "woman, beach, vacation",
    "previewURL": "https://cdn.pixabay.com/photo/2016/09/11/16/16/woman-1661722_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL": "https://pixabay.com/get/g987473b01d03d70f3fdd3bac72d4c4b5d12a7e6c483a42cd2d828b7810bf5dcf009ef79fed34a354585b25d6dc9da03417e04dcd1dd2930d29b21feebf076dd3_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL": "https://pixabay.com/get/gf1818ea9c41903b0733eba35052c89c38204cade4f8a5822b208172b1ed031c8bf1f0829cac3b8dcd830505ec4353ae711a85dbe3e829892501c5d9ad685ce51_1280.jpg",
    "imageWidth": 2592,
    "imageHeight": 1728,
    "imageSize": 917022,
    "views": 64501,
    "downloads": 30551,
    "collections": 126,
    "likes": 139,
    "comments": 13,
    "user_id": 79075,
    "user": "summerstock",
    "userImageURL": ""
  },
  {
    "id": 885402,
    "pageURL": "https://pixabay.com/photos/woman-blonde-hat-bikini-model-885402/",
    "type": "photo",
    "tags": "woman, bikini model, blonde",
    "previewURL": "https://cdn.pixabay.com/photo/2015/08/12/00/19/woman-885402_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL": "https://pixabay.com/get/g8ce6836e93411840a53dcbb123fe6c14ff70746128391f0d073de54684ff0b2933d48d7811bebf3d6553206790edb994_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL": "https://pixabay.com/get/g7ebe1f640f38423dd6451ded2d558d5bf6a7a81e229b24e25847389e2481dfa79fa0b37c1aba2958b6dc76296ebe292a9088488e4036d4b95690bab5dd1ce15c_1280.jpg",
    "imageWidth": 5184,
    "imageHeight": 3456,
    "imageSize": 3866976,
    "views": 168272,
    "downloads": 69523,
    "collections": 273,
    "likes": 302,
    "comments": 35,
    "user_id": 1243797,
    "user": "DayronV",
    "userImageURL": "https://cdn.pixabay.com/user/2023/06/29/20-33-24-204_250x250.jpg"
  },
  {
    "id": 1845277,
    "pageURL": "https://pixabay.com/photos/woman-bikini-model-swimsuit-1845277/",
    "type": "photo",
    "tags": "woman, bikini, model",
    "previewURL": "https://cdn.pixabay.com/photo/2016/11/21/13/00/woman-1845277_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL": "https://pixabay.com/get/g77b2bbdba3a455b45b0cfccc8d939272b85d5bb47b4f298ee3d1f81bb869503e8393adae84d139649e4cbf11d5c4991cd5092d5bc3d97257d004359f1dbfb3f7_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL": "https://pixabay.com/get/g755e61b794439db49ce873c7f6d985d44234936f0f7ff6ff4b8924650dbf15b8d19fdb74b4f3a8961b08aea3c1c4aaec0a3cfd1284ccf3e464e1e5b1491e8d5c_1280.jpg",
    "imageWidth": 4934,
    "imageHeight": 3289,
    "imageSize": 2597417,
    "views": 50690,
    "downloads": 22404,
    "collections": 261,
    "likes": 192,
    "comments": 7,
    "user_id": 2286921,
    "user": "Pexels",
    "userImageURL": "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
  }
];