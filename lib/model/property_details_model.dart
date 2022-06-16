// To parse this JSON data, do
//
//     final propertyDetails = propertyDetailsFromJson(jsonString);

import 'dart:convert';

PropertyDetails propertyDetailsFromJson(String str) =>
    PropertyDetails.fromJson(json.decode(str));

String propertyDetailsToJson(PropertyDetails data) =>
    json.encode(data.toJson());

class PropertyDetails {
  PropertyDetails({
    this.status,
    this.msg,
    this.description,
    this.property,
  });

  int? status;
  String? msg;
  String? description;
  Property? property;

  factory PropertyDetails.fromJson(Map<String, dynamic> json) =>
      PropertyDetails(
        status: json["status"],
        msg: json["msg"],
        description: json["description"],
        property: Property.fromJson(json["property"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "description": description,
        "property": property!.toJson(),
      };
}

class Property {
  Property({
    this.id,
    this.name,
    this.price,
    this.inquiry,
    this.propertyType,
    this.furnishingType,
    this.beds,
    this.lat,
    this.lng,
    this.locationText,
    this.map,
    this.videoLink,
    this.description,
    this.utilities,
    this.amenityPetsAllowed,
    this.amenityLaundryType,
    this.amenityParkingType,
    this.amenityParkingFee,
    this.amenityExtra,
    this.contactRole,
    this.contactFirstName,
    this.contactLastName,
    this.contactEmail,
    this.contactPhone,
    this.dateCreated,
    this.dateUpdated,
    this.status,
    this.addedBy,
    this.updatedBy,
    this.isDuplicate,
    this.isDeleted,
    this.isFeatured,
    this.isAds,
    this.units,
    this.propertyPhoto,
    this.propertySchedule,
  });

  int? id;
  String? name;
  String? price;
  String? inquiry;
  String? propertyType;
  dynamic furnishingType;
  dynamic beds;
  String? lat;
  String? lng;
  String? locationText;
  dynamic map;
  dynamic videoLink;
  String? description;
  String? utilities;
  dynamic amenityPetsAllowed;
  String? amenityLaundryType;
  dynamic amenityParkingType;
  String? amenityParkingFee;
  String? amenityExtra;
  dynamic contactRole;
  dynamic contactFirstName;
  dynamic contactLastName;
  dynamic contactEmail;
  dynamic contactPhone;
  DateTime? dateCreated;
  DateTime? dateUpdated;
  String? status;
  AddedBy? addedBy;
  dynamic updatedBy;
  String? isDuplicate;
  String? isDeleted;
  String? isFeatured;
  String? isAds;
  List<Unit>? units;
  List<PropertyPhoto>? propertyPhoto;
  List<dynamic>? propertySchedule;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        inquiry: json["inquiry"],
        propertyType: json["property_type"],
        furnishingType: json["furnishing_type"],
        beds: json["beds"],
        lat: json["lat"],
        lng: json["lng"],
        locationText: json["location_text"],
        map: json["map"],
        videoLink: json["video_link"],
        description: json["description"],
        utilities: json["utilities"],
        amenityPetsAllowed: json["amenity_pets_allowed"],
        amenityLaundryType: json["amenity_laundry_type"],
        amenityParkingType: json["amenity_parking_type"],
        amenityParkingFee: json["amenity_parking_fee"],
        amenityExtra: json["amenity_extra"],
        contactRole: json["contact_role"],
        contactFirstName: json["contact_first_name"],
        contactLastName: json["contact_last_name"],
        contactEmail: json["contact_email"],
        contactPhone: json["contact_phone"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateUpdated: DateTime.parse(json["date_updated"]),
        status: json["status"],
        addedBy: AddedBy.fromJson(json["added_by"]),
        updatedBy: json["updated_by"],
        isDuplicate: json["is_duplicate"],
        isDeleted: json["is_deleted"],
        isFeatured: json["is_featured"],
        isAds: json["is_ads"],
        units: List<Unit>.from(json["units"].map((x) => Unit.fromJson(x))),
        propertyPhoto: List<PropertyPhoto>.from(
            json["property_photo"].map((x) => PropertyPhoto.fromJson(x))),
        propertySchedule:
            List<dynamic>.from(json["property_schedule"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "inquiry": inquiry,
        "property_type": propertyType,
        "furnishing_type": furnishingType,
        "beds": beds,
        "lat": lat,
        "lng": lng,
        "location_text": locationText,
        "map": map,
        "video_link": videoLink,
        "description": description,
        "utilities": utilities,
        "amenity_pets_allowed": amenityPetsAllowed,
        "amenity_laundry_type": amenityLaundryType,
        "amenity_parking_type": amenityParkingType,
        "amenity_parking_fee": amenityParkingFee,
        "amenity_extra": amenityExtra,
        "contact_role": contactRole,
        "contact_first_name": contactFirstName,
        "contact_last_name": contactLastName,
        "contact_email": contactEmail,
        "contact_phone": contactPhone,
        "date_created": dateCreated!.toIso8601String(),
        "date_updated": dateUpdated!.toIso8601String(),
        "status": status,
        "added_by": addedBy!.toJson(),
        "updated_by": updatedBy,
        "is_duplicate": isDuplicate,
        "is_deleted": isDeleted,
        "is_featured": isFeatured,
        "is_ads": isAds,
        "units": List<dynamic>.from(units!.map((x) => x.toJson())),
        "property_photo":
            List<dynamic>.from(propertyPhoto!.map((x) => x.toJson())),
        "property_schedule":
            List<dynamic>.from(propertySchedule!.map((x) => x)),
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
    this.accountd,
    this.remainingProperty,
    this.uploadedProperty,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? name;
  String? email;
  String? address;
  String? accountd;
  int? remainingProperty;
  int? uploadedProperty;

  factory AddedBy.fromJson(Map<String, dynamic> json) => AddedBy(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        accountd: json["accountd"],
        remainingProperty: json["remaining_property"],
        uploadedProperty: json["uploaded_property"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "name": name,
        "email": email,
        "address": address,
        "accountd": accountd,
        "remaining_property": remainingProperty,
        "uploaded_property": uploadedProperty,
      };
}

class PropertyPhoto {
  PropertyPhoto({
    this.id,
    this.image,
    this.notConvert,
    this.propertyId,
    this.isDeleted,
  });

  int? id;
  String? image;
  String? notConvert;
  String? propertyId;
  String? isDeleted;

  factory PropertyPhoto.fromJson(Map<String, dynamic> json) => PropertyPhoto(
        id: json["id"],
        image: json["image"],
        notConvert: json["not_convert"],
        propertyId: json["property_id"],
        isDeleted: json["is_deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "not_convert": notConvert,
        "property_id": propertyId,
        "is_deleted": isDeleted,
      };
}

class Unit {
  Unit({
    this.id,
    this.propertyId,
    this.unit,
    this.bed,
    this.bath,
    this.photo,
    this.sqft,
    this.rent,
    this.createdAt,
    this.updatedAt,
    this.pesoRent,
  });

  int? id;
  String? propertyId;
  String? unit;
  String? bed;
  String? bath;
  dynamic photo;
  String? sqft;
  String? rent;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? pesoRent;

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        propertyId: json["property_id"],
        unit: json["unit"],
        bed: json["bed"],
        bath: json["bath"],
        photo: json["photo"],
        sqft: json["sqft"],
        rent: json["rent"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pesoRent: json["peso_rent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "property_id": propertyId,
        "unit": unit,
        "bed": bed,
        "bath": bath,
        "photo": photo,
        "sqft": sqft,
        "rent": rent,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "peso_rent": pesoRent,
      };
}
