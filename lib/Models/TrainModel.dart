class trainingModel {
  int? id;
  String? videoTitle;
  String? videoDescription;
  String? simpleDescription;
  String? video, image;

  trainingModel(
      {this.id,
      this.videoTitle,
      this.videoDescription,
      this.simpleDescription,
      this.image,
      this.video});

  trainingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoTitle = json['video_title'];
    videoDescription = json['video_description'];
    simpleDescription = json['simple_description'];
    video = json['video'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video_title'] = this.videoTitle;
    data['video_description'] = this.videoDescription;
    data['simple_description'] = this.simpleDescription;
    data['video'] = this.video;
    return data;
  }
}
