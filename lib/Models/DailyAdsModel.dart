class DailyAdsModel {
  int? id;
  String? name;
  String? description;
  String? video, image;

  DailyAdsModel({this.id, this.name, this.description, this.video, this.image});

  DailyAdsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    video = json['video'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['video'] = this.video;
    return data;
  }
}
