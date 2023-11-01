class FaqModel {
  int? id;
  String? answer;
  String? question;
  String? createdAt;
  String? updatedAt;

  FaqModel(
      {this.id, this.answer, this.question, this.createdAt, this.updatedAt});

  FaqModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
    question = json['question'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['answer'] = this.answer;
    data['question'] = this.question;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
