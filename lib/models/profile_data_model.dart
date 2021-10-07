class ProfileDataModel {
  String name;
  String email;
  String verificationStatus;
  int balance;
  int wallet;
  String role;
  int id;

  ProfileDataModel(
      {this.name,
        this.email,
        this.verificationStatus,
        this.balance,
        this.wallet,
        this.role,
        this.id});

  ProfileDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    verificationStatus = json['verification_status'];
    balance = json['balance'];
    wallet = json['wallet'];
    role = json['role'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['verification_status'] = this.verificationStatus;
    data['balance'] = this.balance;
    data['wallet'] = this.wallet;
    data['role'] = this.role;
    data['id'] = this.id;
    return data;
  }
}