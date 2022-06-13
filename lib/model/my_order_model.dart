// To parse this JSON data, do
//
//     final myOrderModel = myOrderModelFromJson(jsonString);

import 'dart:convert';

MyOrderModel myOrderModelFromJson(String str) => MyOrderModel.fromJson(json.decode(str));

String myOrderModelToJson(MyOrderModel data) => json.encode(data.toJson());

class MyOrderModel {
  MyOrderModel({
    this.status,
    this.msg,
    this.description,
    this.data,
  });

  int ?status;
  String? msg;
  String ?description;
  Data ?data;

  factory MyOrderModel.fromJson(Map<String, dynamic> json) => MyOrderModel(
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

  int ?perPage;
  int ?from;
  int ?to;
  int ?total;
  int ?currentPage;
  int ?lastPage;
  dynamic? prevPageUrl;
  String ?firstPageUrl;
  dynamic ?nextPageUrl;
  String? lastPageUrl;
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
    this.orderId,
    this.customerId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
    this.totalPrice,
    this.orderStatus,
    this.createdAt,
    this.customer,
  });

  int ?id;
  String? orderId;
  String ?customerId;
  String ?firstName;
  String ?lastName;
  String ?email;
  String ?phone;
  String ?address;
  String ?totalPrice;
  String ?orderStatus;
  DateTime? createdAt;
  Customer ?customer;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"] == null ? null : json["id"],
    orderId: json["order_id"] == null ? null : json["order_id"],
    customerId: json["customer_id"] == null ? null : json["customer_id"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    address: json["address"] == null ? null : json["address"],
    totalPrice: json["total_price"] == null ? null : json["total_price"],
    orderStatus: json["order_status"] == null ? null : json["order_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "order_id": orderId == null ? null : orderId,
    "customer_id": customerId == null ? null : customerId,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "address": address == null ? null : address,
    "total_price": totalPrice == null ? null : totalPrice,
    "order_status": orderStatus == null ? null : orderStatus,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "customer": customer == null ? null : customer!.toJson(),
  };
}

class Customer {
  Customer({
    this.id,
    this.firstName,
    this.lastName,
    this.name,
    this.email,
    this.address,
  });

  int? id;
  String? firstName;
  String ?lastName;
  String ?name;
  String ?email;
  String ?address;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"] == null ? null : json["id"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    address: json["address"] == null ? null : json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "address": address == null ? null : address,
  };
}
