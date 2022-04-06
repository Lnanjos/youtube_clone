import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/video.dart';

const channelYoutubeAPI = "AIzaSyCnZp3Gd6PiLdH46cvPOIQHgoVAYofuL1E";
const idCanal = "UCKHhA5hN2UohhFDfNXB_cvQ";
const urlBase = "https://www.googleapis.com/youtube/v3/";

class API {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse(urlBase +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$channelYoutubeAPI"
            "&channelId=$idCanal"
            "&q=$pesquisa"));

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {
      List<Video> videos = [];
      return videos;
    }
  }
}
