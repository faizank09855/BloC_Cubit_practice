import 'dart:convert';
import 'package:bloc_with_cubit/calculator/model/home_screen_model.dart';
import 'package:http/http.dart';

class HomeScreenRepository{
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<HomeScreenModel>> getData() async {
    Response response = await get(Uri.parse(postsURL));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      print(response.body.toString());
      List<HomeScreenModel> posts = body
          .map(
            (dynamic item) => HomeScreenModel.fromJson(item),
      )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}