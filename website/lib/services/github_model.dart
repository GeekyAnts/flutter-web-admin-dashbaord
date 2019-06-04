class GithubTrendingModel {
  String author;
  String name;
  String url;
  String description;
  String language;
  String languageColor;
  int stars;
  int forks;
  int currentPeriodStars;
  List<BuiltBy> builtBy;

  GithubTrendingModel(
      {this.author,
      this.name,
      this.url,
      this.description,
      this.language,
      this.languageColor,
      this.stars,
      this.forks,
      this.currentPeriodStars,
      this.builtBy});

  GithubTrendingModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    name = json['name'];
    url = json['url'];
    description = json['description'];
    language = json['language'];
    languageColor = json['languageColor'];
    stars = json['stars'];
    forks = json['forks'];
    currentPeriodStars = json['currentPeriodStars'];
    if (json['builtBy'] != null) {
      builtBy = new List<BuiltBy>();
      json['builtBy'].forEach((v) {
        builtBy.add(new BuiltBy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['name'] = this.name;
    data['url'] = this.url;
    data['description'] = this.description;
    data['language'] = this.language;
    data['languageColor'] = this.languageColor;
    data['stars'] = this.stars;
    data['forks'] = this.forks;
    data['currentPeriodStars'] = this.currentPeriodStars;
    if (this.builtBy != null) {
      data['builtBy'] = this.builtBy.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BuiltBy {
  String username;
  String href;
  String avatar;

  BuiltBy({this.username, this.href, this.avatar});

  BuiltBy.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    href = json['href'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['href'] = this.href;
    data['avatar'] = this.avatar;
    return data;
  }
}
