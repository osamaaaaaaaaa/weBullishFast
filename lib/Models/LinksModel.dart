class LinksModel {
  int? id;
  String? descriptionFacebook;
  String? nameFacebook;
  String? linkFacebook;
  String? descriptionYoutube;
  String? nameYoutube;
  String? linkYoutube;
  String? descriptionTwitter;
  String? nameTwitter;
  String? linkTwitter;
  String? descriptionInstagram;
  String? nameInstagram;
  String? linkInstagram;
  String? descriptionLinkedin;
  String? nameLinkedin;
  String? linkLinkedin;
  String? createdAt;
  String? updatedAt;

  LinksModel(
      {this.id,
      this.descriptionFacebook,
      this.nameFacebook,
      this.linkFacebook,
      this.descriptionYoutube,
      this.nameYoutube,
      this.linkYoutube,
      this.descriptionTwitter,
      this.nameTwitter,
      this.linkTwitter,
      this.descriptionInstagram,
      this.nameInstagram,
      this.linkInstagram,
      this.descriptionLinkedin,
      this.nameLinkedin,
      this.linkLinkedin,
      this.createdAt,
      this.updatedAt});

  LinksModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descriptionFacebook = json['description_facebook'];
    nameFacebook = json['name_facebook'];
    linkFacebook = json['link_facebook'];
    descriptionYoutube = json['description_youtube'];
    nameYoutube = json['name_youtube'];
    linkYoutube = json['link_youtube'];
    descriptionTwitter = json['description_twitter'];
    nameTwitter = json['name_twitter'];
    linkTwitter = json['link_twitter'];
    descriptionInstagram = json['description_instagram'];
    nameInstagram = json['name_instagram'];
    linkInstagram = json['link_instagram'];
    descriptionLinkedin = json['description_linkedin'];
    nameLinkedin = json['name_linkedin'];
    linkLinkedin = json['link_linkedin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description_facebook'] = this.descriptionFacebook;
    data['name_facebook'] = this.nameFacebook;
    data['link_facebook'] = this.linkFacebook;
    data['description_youtube'] = this.descriptionYoutube;
    data['name_youtube'] = this.nameYoutube;
    data['link_youtube'] = this.linkYoutube;
    data['description_twitter'] = this.descriptionTwitter;
    data['name_twitter'] = this.nameTwitter;
    data['link_twitter'] = this.linkTwitter;
    data['description_instagram'] = this.descriptionInstagram;
    data['name_instagram'] = this.nameInstagram;
    data['link_instagram'] = this.linkInstagram;
    data['description_linkedin'] = this.descriptionLinkedin;
    data['name_linkedin'] = this.nameLinkedin;
    data['link_linkedin'] = this.linkLinkedin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
