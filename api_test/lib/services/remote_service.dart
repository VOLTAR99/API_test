import 'package:api_test/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Welcome>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var responce = await client.get(uri);
    if (responce.statusCode == 200) {
      var json = responce.body;
      return welcomeFromJson(json);
    }
  }
}
