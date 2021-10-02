class ProfileData {
  Profile profile;
  String message;

  ProfileData({this.profile, this.message});

  ProfileData.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Profile {
  String name;
  String email;
  String verificationStatus;
  int balance;
  int wallet;
  String role;
  int id;

  Profile(
      {this.name,
        this.email,
        this.verificationStatus,
        this.balance,
        this.wallet,
        this.role,
        this.id});

  Profile.fromJson(Map<String, dynamic> json) {
    name = json['name']??'';
    email = json['email']??'';
    verificationStatus = json['verification_status']??'';
    balance = json['balance']??0;
    wallet = json['wallet']??0;
    role = json['role']??'';
    id = json['id']??-1;
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
