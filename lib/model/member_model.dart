// To parse this JSON data, do
//
//     final memberModel = memberModelFromJson(jsonString);

import 'dart:convert';

MemberModel memberModelFromJson(String str) =>
    MemberModel.fromJson(json.decode(str));

String memberModelToJson(MemberModel data) => json.encode(data.toJson());

class MemberModel {
  MemberModel({
    this.status,
    this.msg,
    this.description,
    this.conversations,
  });

  int? status;
  String? msg;
  String? description;
  List<Conversation>? conversations;

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
        status: json["status"],
        msg: json["msg"],
        description: json["description"],
        conversations: List<Conversation>.from(
            json["conversations"].map((x) => Conversation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "description": description,
        "conversations":
            List<dynamic>.from(conversations!.map((x) => x.toJson())),
      };
}

class Conversation {
  Conversation({
    this.id,
    this.createdBy,
    this.propertyId,
    this.serviceId,
    this.agentId,
    this.createdAt,
    this.updatedAt,
    this.lastMessage,
    this.title,
    this.seen,
    this.members,
  });

  int? id;
  String? createdBy;
  dynamic propertyId;
  String? serviceId;
  dynamic agentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? lastMessage;
  String? title;
  String? seen;
  List<Member>? members;

  factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
        id: json["id"],
        createdBy: json["created_by"],
        propertyId: json["property_id"],
        serviceId: json["service_id"] == null ? null : json["service_id"],
        agentId: json["agent_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        lastMessage: json["last_message"],
        title: json["title"],
        seen: json["seen"],
        members:
            List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "property_id": propertyId,
        "service_id": serviceId == null ? null : serviceId,
        "agent_id": agentId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "last_message": lastMessage,
        "title": title,
        "seen": seen,
        "members": List<dynamic>.from(members!.map((x) => x.toJson())),
      };
}

class Member {
  Member({
    this.userId,
    this.seen,
    this.name,
    this.email,
    this.address,
    this.userType,
    this.subscription,
  });

  String? userId;
  String? seen;
  String? name;
  String? email;
  String? address;
  String? userType;
  String? subscription;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        userId: json["user_id"],
        seen: json["seen"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        userType: json["user_type"],
        subscription: json["subscription"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "seen": seen,
        "name": name,
        "email": email,
        "address": address,
        "user_type": userType,
        "subscription": subscription,
      };
}
