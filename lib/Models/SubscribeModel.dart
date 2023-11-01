class SubscribeModel {
  int? id;
  int? userId;
  String? name;
  String? paymentType;
  String? status;
  String? planId;
  int? quantity;
  String? startAt;
  String? trialEndsAt;
  String? endsAt;
  String? createdAt;
  String? updatedAt;

  SubscribeModel(
      {this.id,
      this.userId,
      this.name,
      this.paymentType,
      this.status,
      this.planId,
      this.quantity,
      this.startAt,
      this.trialEndsAt,
      this.endsAt,
      this.createdAt,
      this.updatedAt});

  SubscribeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    paymentType = json['payment_type'];
    status = json['status'];
    planId = json['plan_id'];
    quantity = json['quantity'];
    startAt = json['start_at'];
    trialEndsAt = json['trial_ends_at'];
    endsAt = json['ends_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['payment_type'] = this.paymentType;
    data['status'] = this.status;
    data['plan_id'] = this.planId;
    data['quantity'] = this.quantity;
    data['start_at'] = this.startAt;
    data['trial_ends_at'] = this.trialEndsAt;
    data['ends_at'] = this.endsAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
