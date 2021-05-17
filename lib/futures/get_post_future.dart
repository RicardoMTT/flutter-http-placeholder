import 'package:jsonplaceholderflutter/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

class PostFuture {
  Future<List<Post>> fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body); // Retorna un mapa
      var posts = Post.fromJsonList(jsonResponse);
      print("posts.itemsPost ${posts.itemsPost[0].id}");
      return posts.itemsPost;
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load post');
    }
  }

  Future<Post> fetchPostItem(id) async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/${id}');

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body); // Retorna un mapa
      var post = Post.fromJson(jsonResponse);
      print("POSTTTT ${post.id}");
      return post;
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load post');
    }
  }
}
