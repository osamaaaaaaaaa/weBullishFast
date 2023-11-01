class LiveModel {
  int? id;
  String? link;
  String? description;
  String? createdAt;
  String? updatedAt;

  LiveModel(
      {this.id, this.link, this.description, this.createdAt, this.updatedAt});

  LiveModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['link'] = this.link;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
