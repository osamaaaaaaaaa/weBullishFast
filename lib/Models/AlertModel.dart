class AlertModel {
  int? id;
  String? name;
  String? image;
  String? video;

  String? description;
  String? sendTime;

  AlertModel(
      {this.id,
      this.name,
      this.image,
      this.video,
      this.description,
      this.sendTime});

  AlertModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    video = json['video'];
    description = json['description'];
    sendTime = json['send_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['video'] = this.video;
    data['description'] = this.description;
    data['send_time'] = this.sendTime;
    return data;
  }
}
