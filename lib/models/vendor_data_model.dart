class VendorDataModel {
  String name;
  String url;
  String address;

  VendorDataModel({this.name, this.url, this.address});

  VendorDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['address'] = this.address;
    return data;
  }
}