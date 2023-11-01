class FollowUpModel {
  int? id;
  String? facebook;
  String? youtube;
  String? instagram;
  String? linkedin;
  String? twitter;
  String? createdAt;
  String? updatedAt;

  FollowUpModel(
      {this.id,
      this.facebook,
      this.youtube,
      this.instagram,
      this.linkedin,
      this.twitter,
      this.createdAt,
      this.updatedAt});

  FollowUpModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    facebook = json['facebook'];
    youtube = json['youtube'];
    instagram = json['instagram'];
    linkedin = json['linkedin'];
    twitter = json['twitter'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['facebook'] = this.facebook;
    data['youtube'] = this.youtube;
    data['instagram'] = this.instagram;
    data['linkedin'] = this.linkedin;
    data['twitter'] = this.twitter;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
