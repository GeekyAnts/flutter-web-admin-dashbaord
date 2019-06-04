import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:website/models/github_model.dart';

class ApiData {
  static List<GithubTrendingModel> githubTrendingModel;
  static Future<dynamic> getData() async {
    githubTrendingModel = [];
    var url =
        "https://github-trending-api.now.sh/repositories?language=&since=daily";

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      jsonResponse.forEach((data) {
        ApiData.githubTrendingModel.add(GithubTrendingModel.fromJson(data));
      });
      print(ApiData.githubTrendingModel);
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }
}
