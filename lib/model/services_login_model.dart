// To parse this JSON data, do
//
//     final serviceLogin = serviceLoginFromJson(jsonString);

import 'package:hive/hive.dart';
import 'dart:convert';

part 'services_login_model.g.dart';

ServiceLogin serviceLoginFromJson(String str) => ServiceLogin.fromJson(json.decode(str));

String serviceLoginToJson(ServiceLogin data) => json.encode(data.toJson());

String userToJson(User data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class ServiceLogin {
    ServiceLogin({
        this.responseCode,
        this.responseMessage,
        this.status,
        this.user,
    });

    @HiveField(1)
    int? responseCode;
    @HiveField(2)
    String? responseMessage;
    @HiveField(3)
    bool? status;
    @HiveField(4)
    User? user;

    factory ServiceLogin.fromJson(Map<String, dynamic> json) => ServiceLogin(
        responseCode: json["responseCode"],
        responseMessage: json["responseMessage"],
        status: json["status"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "responseMessage": responseMessage,
        "status": status,
        "user": user?.toJson(),
    };
}

@HiveType(typeId: 2)
class User {
    User({
        this.aadhar,
        this.pan,
        this.bankDetails,
        this.address,
        this.experience,
        this.id,
        this.name,
        this.email,
        this.password,
        this.phone,
        this.avatar,
        this.date,
        this.v,
    });

    @HiveField(1)
    Aadhar? aadhar;
    @HiveField(2)
    Aadhar? pan;
    @HiveField(3)
    BankDetails? bankDetails;
    @HiveField(4)
    Address? address;
    @HiveField(5)
    Experience? experience;
    @HiveField(6)
    String? id;
    @HiveField(7)
    String? name;
    @HiveField(8)
    String? email;
    @HiveField(9)
    String? password;
    @HiveField(10)
    int? phone;
    @HiveField(11)
    String? avatar;
    @HiveField(12)
    DateTime? date;
    @HiveField(13)
    int? v;

    factory User.fromJson(Map<String, dynamic> json) => User(
        aadhar: json["aadhar"] == null ? null : Aadhar.fromJson(json["aadhar"]),
        pan: json["pan"] == null ? null : Aadhar.fromJson(json["pan"]),
        bankDetails: json["bankDetails"] == null ? null : BankDetails.fromJson(json["bankDetails"]),
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        experience: json["experience"] == null ? null : Experience.fromJson(json["experience"]),
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        avatar: json["avatar"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "aadhar": aadhar?.toJson(),
        "pan": pan?.toJson(),
        "bankDetails": bankDetails?.toJson(),
        "address": address?.toJson(),
        "experience": experience?.toJson(),
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "avatar": avatar,
        "date": date?.toIso8601String(),
        "__v": v,
    };
}

@HiveType(typeId: 3)
class Aadhar {
    Aadhar({
        this.img,
        this.number,
    });

    @HiveField(1)
    String? img;
    @HiveField(2)
    String? number;

    factory Aadhar.fromJson(Map<String, dynamic> json) => Aadhar(
        img: json["img"],
        number: json["number"],
    );

    Map<String, dynamic> toJson() => {
        "img": img,
        "number": number,
    };
}

@HiveType(typeId: 4)
class Address {
    Address({
        this.latlang,
        this.addressLine,
        this.city,
        this.state,
        this.pincode,
        this.locality,
    });

    @HiveField(1)
    Latlang? latlang;
    @HiveField(2)
    String? addressLine;
    @HiveField(3)
    String? city;
    @HiveField(4)
    String? state;
    @HiveField(5)
    int? pincode;
    @HiveField(6)
    String? locality;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        latlang: json["latlang"] == null ? null : Latlang.fromJson(json["latlang"]),
        addressLine: json["addressLine"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        locality: json["locality"],
    );

    Map<String, dynamic> toJson() => {
        "latlang": latlang?.toJson(),
        "addressLine": addressLine,
        "city": city,
        "state": state,
        "pincode": pincode,
        "locality": locality,
    };
}

@HiveType(typeId: 5)
class Latlang {
    Latlang({
        this.latitude,
        this.longitude,
    });

    @HiveField(1)
    double? latitude;
    @HiveField(2)
    double? longitude;

    factory Latlang.fromJson(Map<String, dynamic> json) => Latlang(
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

@HiveType(typeId: 6)
class BankDetails {
    BankDetails({
        this.accountHolderName,
        this.accountNumber,
        this.ifscCode,
        this.registerMobileNumber,
    });

    @HiveField(1)
    String? accountHolderName;
    @HiveField(2)
    String? accountNumber;
    @HiveField(3)
    String? ifscCode;
    @HiveField(4)
    String? registerMobileNumber;

    factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
        accountHolderName: json["accountHolderName"],
        accountNumber: json["accountNumber"],
        ifscCode: json["ifscCode"],
        registerMobileNumber: json["registerMobileNumber"],
    );

    Map<String, dynamic> toJson() => {
        "accountHolderName": accountHolderName,
        "accountNumber": accountNumber,
        "ifscCode": ifscCode,
        "registerMobileNumber": registerMobileNumber,
    };
}

@HiveType(typeId: 7)
class Experience {
    Experience({
        this.category,
        this.time,
        this.location,
        this.description,
    });

    @HiveField(1)
    Category? category;
    @HiveField(2)
    double? time;
    @HiveField(3)
    String? location;
    @HiveField(4)
    String? description;

    factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        time: json["time"]?.toDouble(),
        location: json["location"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "category": category?.toJson(),
        "time": time,
        "location": location,
        "description": description,
    };
}

@HiveType(typeId: 8)
class Category {
    Category({
        this.name,
        this.id,
    });

    @HiveField(1)
    String? name;
    @HiveField(2)
    String? id;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}
