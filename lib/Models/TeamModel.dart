class TeamModel {
  int? id;
  String? name;
  String? namesection;
  String? description;
  String? image;

  TeamModel(
      {this.id, this.name, this.namesection, this.description, this.image});

  TeamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    namesection = json['namesection'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['namesection'] = this.namesection;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
