class SocialUserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  bool? isAdmin;

  SocialUserModel(
      {this.name,
      this.email,
      this.phone,
      this.uId,
      this.isAdmin,
    });
  SocialUserModel.fromjson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    isAdmin = json['isAdmin'];

  }
  Map<String, dynamic> tomap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'isAdmin': isAdmin,
      'uId': uId,
    };
  }
}
