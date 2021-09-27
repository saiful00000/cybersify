class UserData {
  late String token;
  late String name;
  late String email;
  late String phone;
  late String verificationStatus;

  UserData({
    required this.token,
    required this.name,
    required this.email,
    required this.phone,
    required this.verificationStatus,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    phone = json['phone'] ?? '';
    verificationStatus = json['verification_status'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['verification_status'] = this.verificationStatus;
    return data;
  }
}
