class PerformanceModel {
  String? month;
  List<Performance>? performance;

  PerformanceModel({this.month, this.performance});

  PerformanceModel.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    if (json['performance'] != null) {
      performance = <Performance>[];
      json['performance'].forEach((v) {
        performance!.add(new Performance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    if (this.performance != null) {
      data['performance'] = this.performance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Performance {
  int? id;
  String? sympol;
  int? reached_min;
  int? reached_max;
  String? target;
  String? comment;
  String? month;

  Performance(
      {this.id,
      this.sympol,
      this.reached_max,
      this.reached_min,
      this.target,
      this.comment,
      this.month});

  Performance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sympol = json['sympol'];
    reached_min = json['reached_min'];

    reached_max = json['reached_max'];
    target = json['target'];
    comment = json['comment'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sympol'] = this.sympol;
    data['reached_min'] = this.reached_min;
    data['reached_max'] = this.reached_max;

    data['target'] = this.target;
    data['comment'] = this.comment;
    data['month'] = this.month;
    return data;
  }
}
