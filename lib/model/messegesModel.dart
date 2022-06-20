// class Messages {
//   final String text;
//   final DateTime date;
//   final bool isSentByMe;
//
//   const Messages({
//     required this.text,
//     required this.date,
//     required this.isSentByMe,
//   });
// }
// To parse this JSON data, do
//
//     final conversionModel = conversionModelFromJson(jsonString);

import 'dart:convert';

ConversionModel conversionModelFromJson(String str) => ConversionModel.fromJson(json.decode(str));

String conversionModelToJson(ConversionModel data) => json.encode(data.toJson());

class ConversionModel {
  ConversionModel({
    this.status,
    this.msg,
    this.description,
    this.message,
  });

  int? status;
  String? msg;
  String? description;
  Message? message;

  factory ConversionModel.fromJson(Map<String, dynamic> json) => ConversionModel(
    status: json["status"] == null ? null : json["status"],
    msg: json["msg"] == null ? null : json["msg"],
    description: json["description"] == null ? null : json["description"],
    message: json["message"] == null ? null : Message.fromJson(json["message"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "msg": msg == null ? null : msg,
    "description": description == null ? null : description,
    "message": message == null ? null : message!.toJson(),
  };
}

class Message {
  Message({
    this.id,
    this.conversationId,
    this.message,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.formattedDate,
    this.deletedUsersArray,
    this.isSentByMe
  });

  int ? id;
  String ?conversationId;
  String? message;
  CreatedBy? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? isDeleted;
  String? formattedDate;
  List<dynamic>? deletedUsersArray;
  final bool ?isSentByMe;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"] == null ? null : json["id"],
    conversationId: json["conversation_id"] == null ? null : json["conversation_id"],
    message: json["message"] == null ? null : json["message"],
    createdBy: json["created_by"] == null ? null : CreatedBy.fromJson(json["created_by"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    isDeleted: json["is_deleted"] == null ? null : json["is_deleted"],
    isSentByMe: json["is_deleted"] == null ? null : json["is_deleted"],
    formattedDate: json["isSentByMe"] == null ? null : json["isSentByMe"],
    deletedUsersArray: json["deleted_users_array"] == null ? null : List<dynamic>.from(json["deleted_users_array"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "conversation_id": conversationId == null ? null : conversationId,
    "message": message == null ? null : message,
    "created_by": createdBy == null ? null : createdBy!.toJson(),
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "is_deleted": isDeleted == null ? null : isDeleted,
    "formatted_date": formattedDate == null ? null : formattedDate,
    "deleted_users_array": deletedUsersArray == null ? null : List<dynamic>.from(deletedUsersArray!.map((x) => x)),
  };
}

class CreatedBy {
  CreatedBy({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}
