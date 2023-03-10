import 'dart:convert';

import 'package:http/http.dart' as http;

class Movies {
  late dynamic stream_id;
  late dynamic id;
  late String name;
  late String stream_icon;

  Movies(this.stream_id, this.id, this.name, this.stream_icon);

  Movies.fromJson(Map<String, dynamic> json) {
    stream_id = json['stream_id'];
    id = json['id'];
    name = json['name'];
    stream_icon = json['stream_icon'];
  }

  static Future getAll(int category, logins) async {
    var Movies = <Movies>[];

    var url = Uri.http(logins['host'], 'player_api.php', {
      'username': logins['username'],
      'password': logins['password'],
      'action': 'get_vod_streams',
      'category_id': category.toString()
    });
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonCategories = json.decode(response.body);

      for (var category in jsonCategories) {
        Movies.add(Movies.fromJson(category));
      }
    }

    return Movies;
  }
}
