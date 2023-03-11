class SingleStatusModel {
  SingleStatusModel({
    this.status,
  });

  SingleStatusModel.fromJson(dynamic json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  Status? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (status != null) {
      map['status'] = status!.toJson();
    }
    return map;
  }
}
