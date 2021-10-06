class ActivityDataModel {
  int id;
  int userId;
  String activity;
  int performBy;
  int status;
  String createdAt;
  String updatedAt;

  ActivityDataModel(
      {this.id,
        this.userId,
        this.activity,
        this.performBy,
        this.status,
        this.createdAt,
        this.updatedAt});

  ActivityDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    activity = json['activity'];
    performBy = json['perform_by'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['activity'] = this.activity;
    data['perform_by'] = this.performBy;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}