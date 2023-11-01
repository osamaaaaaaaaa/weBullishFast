class MagazineModel {
  int? id;
  String? name;
  String? title;
  String? datesend;
  String? author;
  String? description;
  String? image;

  MagazineModel(
      {this.id,
      this.name,
      this.title,
      this.datesend,
      this.author,
      this.description,
      this.image});

  MagazineModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    datesend = json['datesend'];
    author = json['author'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['datesend'] = this.datesend;
    data['author'] = this.author;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
