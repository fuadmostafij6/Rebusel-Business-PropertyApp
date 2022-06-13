// To parse this JSON data, do
//
//     final myPropertyModel = myPropertyModelFromJson(jsonString);

import 'dart:convert';

MyPropertyModel myPropertyModelFromJson(String str) => MyPropertyModel.fromJson(json.decode(str));

String myPropertyModelToJson(MyPropertyModel data) => json.encode(data.toJson());

class MyPropertyModel {
  MyPropertyModel({
    this.status,
    this.msg,
    this.description,
    this.data,
  });

  int  ?status;
  String? msg;
  String ?description;
  Data ?data;

  factory MyPropertyModel.fromJson(Map<String, dynamic> json) => MyPropertyModel(
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
    this.properties,
  });

  int ? perPage;
  int ?from;
  int ?to;
  int ?total;
  int ?currentPage;
  int ?lastPage;
  dynamic prevPageUrl;
  String? firstPageUrl;
  String ?nextPageUrl;
  String ?lastPageUrl;
  List<Property>? properties;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    perPage: json["per_page"] == null ? null : json["per_page"],
    from: json["from"] == null ? null : json["from"],
    to: json["to"] == null ? null : json["to"],
    total: json["total"] == null ? null : json["total"],
    currentPage: json["current_page"] == null ? null : json["current_page"],
    lastPage: json["last_page"] == null ? null : json["last_page"],
    prevPageUrl: json["prev_page_url"],
    firstPageUrl: json["first_page_url"] == null ? null : json["first_page_url"],
    nextPageUrl: json["next_page_url"] == null ? null : json["next_page_url"],
    lastPageUrl: json["last_page_url"] == null ? null : json["last_page_url"],
    properties: json["properties"] == null ? null : List<Property>.from(json["properties"].map((x) => Property.fromJson(x))),
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
    "next_page_url": nextPageUrl == null ? null : nextPageUrl,
    "last_page_url": lastPageUrl == null ? null : lastPageUrl,
    "properties": properties == null ? null : List<dynamic>.from(properties!.map((x) => x.toJson())),
  };
}

class Property {
  Property({
    this.id,
    this.name,
    this.inquiry,
    this.propertyType,
    this.firstImage,
    this.locationText,
    this.pesoPrice,
    this.unitUnit,
    this.unitBed,
    this.unitBath,
    this.unitSqft,
    this.status,
    this.addedBy,
  });

  int? id;
  String? name;
  Inquiry? inquiry;
  PropertyType? propertyType;
  String ? firstImage;
  String ?locationText;
  String ?pesoPrice;
  String ?unitUnit;
  String ?unitBed;
  String ?unitBath;
  String ?unitSqft;
  String ?status;
  AddedBy? addedBy;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    inquiry: json["inquiry"] == null ? null : inquiryValues.map![json["inquiry"]],
    propertyType: json["property_type"] == null ? null : propertyTypeValues.map![json["property_type"]],
    firstImage: json["first_image"] == null ? null : json["first_image"],
    locationText: json["location_text"] == null ? null : json["location_text"],
    pesoPrice: json["peso_price"] == null ? null : json["peso_price"],
    unitUnit: json["unit_unit"] == null ? null : json["unit_unit"],
    unitBed: json["unit_bed"] == null ? null : json["unit_bed"],
    unitBath: json["unit_bath"] == null ? null : json["unit_bath"],
    unitSqft: json["unit_sqft"] == null ? null : json["unit_sqft"],
    status: json["status"] == null ? null : json["status"],
    addedBy: json["added_by"] == null ? null : AddedBy.fromJson(json["added_by"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "inquiry": inquiry == null ? null : inquiryValues.reverse![inquiry],
    "property_type": propertyType == null ? null : propertyTypeValues.reverse![propertyType],
    "first_image": firstImage == null ? null : firstImage,
    "location_text": locationText == null ? null : locationText,
    "peso_price": pesoPrice == null ? null : pesoPrice,
    "unit_unit": unitUnit == null ? null : unitUnit,
    "unit_bed": unitBed == null ? null : unitBed,
    "unit_bath": unitBath == null ? null : unitBath,
    "unit_sqft": unitSqft == null ? null : unitSqft,
    "status": status == null ? null : status,
    "added_by": addedBy == null ? null : addedBy!.toJson(),
  };
}

class AddedBy {
  AddedBy({
    this.id,
    this.firstName,
    this.lastName,
    this.name,
    this.email,
    this.address,
  });

  int ? id;
  FirstName? firstName;
  LastName ?lastName;
  Name ? name;
  Email ?email;
  Address? address;

  factory AddedBy.fromJson(Map<String, dynamic> json) => AddedBy(
    id: json["id"] == null ? null : json["id"],
    firstName: json["first_name"] == null ? null : firstNameValues.map![json["first_name"]],
    lastName: json["last_name"] == null ? null : lastNameValues.map![json["last_name"]],
    name: json["name"] == null ? null : nameValues.map![json["name"]],
    email: json["email"] == null ? null : emailValues.map![json["email"]],
    address: json["address"] == null ? null : addressValues.map![json["address"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "first_name": firstName == null ? null : firstNameValues.reverse![firstName],
    "last_name": lastName == null ? null : lastNameValues.reverse![lastName],
    "name": name == null ? null : nameValues.reverse![name],
    "email": email == null ? null : emailValues.reverse![email],
    "address": address == null ? null : addressValues.reverse![address],
  };
}

enum Address { THE_204_B_H24_G_V9_G_MAKATI_AVE_MAKATI_METRO_MANILA_PHILIPPINES }

final addressValues = EnumValues({
  "204-B H24G+V9G, Makati Ave, Makati, Metro Manila, Philippines": Address.THE_204_B_H24_G_V9_G_MAKATI_AVE_MAKATI_METRO_MANILA_PHILIPPINES
});

enum Email { INFO_DUPHILCO_COM }

final emailValues = EnumValues({
  "info@duphilco.com": Email.INFO_DUPHILCO_COM
});

enum FirstName { EMMANUEL }

final firstNameValues = EnumValues({
  "Emmanuel": FirstName.EMMANUEL
});

enum LastName { CATAMPONGAN }

final lastNameValues = EnumValues({
  "Catampongan": LastName.CATAMPONGAN
});

enum Name { EMMANUEL_CATAMPONGAN }

final nameValues = EnumValues({
  "Emmanuel Catampongan": Name.EMMANUEL_CATAMPONGAN
});

enum Inquiry { RENT_OR_LEASE }

final inquiryValues = EnumValues({
  "Rent or Lease": Inquiry.RENT_OR_LEASE
});

enum PropertyType { APARTMENT_OR_CONDOMINIUM }

final propertyTypeValues = EnumValues({
  "Apartment or Condominium": PropertyType.APARTMENT_OR_CONDOMINIUM
});

class EnumValues<T> {
  Map<String, T> ? map;
  Map<T, String> ?reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
