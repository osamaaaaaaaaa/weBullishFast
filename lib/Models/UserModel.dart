class userModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  User? user;

  userModel({this.accessToken, this.tokenType, this.expiresIn, this.user});

  userModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? type;
  String? password;
  String? code;
  String? expireAt;
  String? status;
  int? countryId;
  int? cityId;
  String? createdAt;
  String? updatedAt;
  int? stripeId;
  Null? pmType;
  Null? pmLastFour;
  String? trialEndsAt;
  String? country;
  String? city;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.emailVerifiedAt,
      this.type,
      this.code,
      this.expireAt,
      this.status,
      this.countryId,
      this.cityId,
      this.createdAt,
      this.updatedAt,
      this.stripeId,
      this.pmType,
      this.pmLastFour,
      this.trialEndsAt,
      this.country,
      this.city});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    emailVerifiedAt = json['email_verified_at'];
    type = json['type'];
    code = json['code'];
    expireAt = json['expire_at'];
    status = json['status'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stripeId = json['stripe_id'];
    pmType = json['pm_type'];
    pmLastFour = json['pm_last_four'];
    trialEndsAt = json['trial_ends_at'];
    country = json['country'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['type'] = this.type;
    data['code'] = this.code;
    data['expire_at'] = this.expireAt;
    data['status'] = this.status;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['stripe_id'] = this.stripeId;
    data['pm_type'] = this.pmType;
    data['pm_last_four'] = this.pmLastFour;
    data['trial_ends_at'] = this.trialEndsAt;
    data['country'] = this.country;
    data['city'] = this.city;
    return data;
  }
}
