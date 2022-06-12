// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.status,
    this.msg,
    this.description,
    this.profile,
  });

  int? status;
  String? msg;
  String? description;
  Profile? profile;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        msg: json["msg"],
        description: json["description"],
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "description": description,
        "profile": profile!.toJson(),
      };
}

class Profile {
  Profile({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.address,
    this.image,
    this.phone,
    this.websiteLink,
    this.fb,
    this.ig,
    this.twiter,
    this.yt,
    this.lat,
    this.lng,
    this.iAmOwner,
    this.businessPermitNo,
    this.totalProperty,
    this.totalService,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? address;
  String? image;
  String? phone;
  String? websiteLink;
  String? fb;
  String? ig;
  String? twiter;
  String? yt;
  String? lat;
  String? lng;
  String? iAmOwner;
  dynamic businessPermitNo;
  int? totalProperty;
  int? totalService;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        fullName: json["full_name"],
        email: json["email"],
        address: json["address"],
        image: json["image"],
        phone: json["phone"],
        websiteLink: json["website_link"],
        fb: json["fb"],
        ig: json["ig"],
        twiter: json["twiter"],
        yt: json["yt"],
        lat: json["lat"],
        lng: json["lng"],
        iAmOwner: json["i_am_owner"],
        businessPermitNo: json["business_permit_no"],
        totalProperty: json["total_property"],
        totalService: json["total_service"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "full_name": fullName,
        "email": email,
        "address": address,
        "image": image,
        "phone": phone,
        "website_link": websiteLink,
        "fb": fb,
        "ig": ig,
        "twiter": twiter,
        "yt": yt,
        "lat": lat,
        "lng": lng,
        "i_am_owner": iAmOwner,
        "business_permit_no": businessPermitNo,
        "total_property": totalProperty,
        "total_service": totalService,
      };
}
