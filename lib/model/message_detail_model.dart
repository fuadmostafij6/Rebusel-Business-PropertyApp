// To parse this JSON data, do
//
//     final messageDetailModel = messageDetailModelFromJson(jsonString);

import 'dart:convert';

MessageDetailModel messageDetailModelFromJson(String str) => MessageDetailModel.fromJson(json.decode(str));

String messageDetailModelToJson(MessageDetailModel data) => json.encode(data.toJson());

class MessageDetailModel {
  MessageDetailModel({
    this.status,
    this.msg,
    this.description,
    this.data,
  });

  int ?status;
  String? msg;
  String ?description;
  Data? data;

  factory MessageDetailModel.fromJson(Map<String, dynamic> json) => MessageDetailModel(
    status: json["status"] == null ? null : json["status"],
    msg: json["msg"] == null ? null : json["msg"],
    description: json["description"] == null ? null : json["description"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "msg": msg == null ? null : msg,
    "description": description == null ? null : description,
    "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  Data({
    this.perPage,
    this.from,
    this.to,
    this.total,
    this.currentPage,
    this.lastPage,
    this.prevPageUrl,
    this.firstPageUrl,
    this.nextPageUrl,
    this.lastPageUrl,
    this.orders,
  });

  int? perPage;
  int ?from;
  int? to;
  int ?total;
  int ?currentPage;
  int ?lastPage;
  dynamic prevPageUrl;
  String ?firstPageUrl;
  dynamic nextPageUrl;
  String ?lastPageUrl;
  List<Order>? orders;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    perPage: json["per_page"] == null ? null : json["per_page"],
    from: json["from"] == null ? null : json["from"],
    to: json["to"] == null ? null : json["to"],
    total: json["total"] == null ? null : json["total"],
    currentPage: json["current_page"] == null ? null : json["current_page"],
    lastPage: json["last_page"] == null ? null : json["last_page"],
    prevPageUrl: json["prev_page_url"],
    firstPageUrl: json["first_page_url"] == null ? null : json["first_page_url"],
    nextPageUrl: json["next_page_url"],
    lastPageUrl: json["last_page_url"] == null ? null : json["last_page_url"],
    orders: json["orders"] == null ? null : List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "per_page": perPage == null ? null : perPage,
    "from": from == null ? null : from,
    "to": to == null ? null : to,
    "total": total == null ? null : total,
    "current_page": currentPage == null ? null : currentPage,
    "last_page": lastPage == null ? null : lastPage,
    "prev_page_url": prevPageUrl,
    "first_page_url": firstPageUrl == null ? null : firstPageUrl,
    "next_page_url": nextPageUrl,
    "last_page_url": lastPageUrl == null ? null : lastPageUrl,
    "orders": orders == null ? null : List<dynamic>.from(orders!.map((x) => x.toJson())),
  };
}

class Order {
  Order({
    this.id,
    this.conversationId,
    this.message,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.formattedDate,
    this.deletedUsersArray,
  });

  int ?id;
  String? conversationId;
  String ?message;
  String ?createdBy;
  DateTime ?createdAt;
  DateTime ?updatedAt;
  String ?isDeleted;
  String ?formattedDate;
  List<dynamic>? deletedUsersArray;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"] == null ? null : json["id"],
    conversationId: json["conversation_id"] == null ? null : json["conversation_id"],
    message: json["message"] == null ? null : json["message"],
    createdBy: json["created_by"] == null ? null : json["created_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    isDeleted: json["is_deleted"] == null ? null : json["is_deleted"],
    formattedDate: json["formatted_date"] == null ? null : json["formatted_date"],
    deletedUsersArray: json["deleted_users_array"] == null ? null : List<dynamic>.from(json["deleted_users_array"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "conversation_id": conversationId == null ? null : conversationId,
    "message": message == null ? null : message,
    "created_by": createdBy == null ? null : createdBy,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "is_deleted": isDeleted == null ? null : isDeleted,
    "formatted_date": formattedDate == null ? null : formattedDate,
    "deleted_users_array": deletedUsersArray == null ? null : List<dynamic>.from(deletedUsersArray!.map((x) => x)),
  };
}
