// To parse this JSON data, do
//
//     final allOrders = allOrdersFromJson(jsonString);

import 'dart:convert';

AllOrders allOrdersFromJson(String str) => AllOrders.fromJson(json.decode(str));

String allOrdersToJson(AllOrders data) => json.encode(data.toJson());

class AllOrders {
  AllOrders({
    this.responseCode,
    this.responseMessage,
    this.status,
    this.orders,
    this.total,
  });

  int? responseCode;
  String? responseMessage;
  bool? status;
  List<Order>? orders;
  int? total;

  factory AllOrders.fromJson(Map<String, dynamic> json) => AllOrders(
        responseCode: json["responseCode"],
        responseMessage: json["responseMessage"],
        status: json["status"],
        orders: json["orders"] == null ? [] : List<Order>.from(json["orders"]!.map((x) => Order.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "responseMessage": responseMessage,
        "status": status,
        "orders": orders == null ? [] : List<dynamic>.from(orders!.map((x) => x.toJson())),
        "total": total,
      };
}

class Order {
  Order({
    this.user,
    this.shippingAddress,
    this.id,
    this.orderItems,
    this.paymentMethod,
    this.totalPrice,
    this.isPaid,
    this.isDelivered,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.paymentResult,
    this.paidAt,
  });

  Customer? user;
  ShippingAddress? shippingAddress;
  String? id;
  List<OrderItem>? orderItems;
  String? paymentMethod;
  int? totalPrice;
  bool? isPaid;
  bool? isDelivered;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  PaymentResult? paymentResult;
  DateTime? paidAt;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        user: json["user"] == null ? null : Customer.fromJson(json["user"]),
        shippingAddress: json["shippingAddress"] == null ? null : ShippingAddress.fromJson(json["shippingAddress"]),
        id: json["_id"],
        orderItems: json["orderItems"] == null ? [] : List<OrderItem>.from(json["orderItems"]!.map((x) => OrderItem.fromJson(x))),
        paymentMethod: json["paymentMethod"],
        totalPrice: json["totalPrice"],
        isPaid: json["isPaid"],
        isDelivered: json["isDelivered"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        paymentResult: json["paymentResult"] == null ? null : PaymentResult.fromJson(json["paymentResult"]),
        paidAt: json["paidAt"] == null ? null : DateTime.parse(json["paidAt"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "shippingAddress": shippingAddress?.toJson(),
        "_id": id,
        "orderItems": orderItems == null ? [] : List<dynamic>.from(orderItems!.map((x) => x.toJson())),
        "paymentMethod": paymentMethod,
        "totalPrice": totalPrice,
        "isPaid": isPaid,
        "isDelivered": isDelivered,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "paymentResult": paymentResult?.toJson(),
        "paidAt": paidAt?.toIso8601String(),
      };
}

class OrderItem {
  OrderItem({
    this.name,
    this.image,
    this.price,
    this.product,
    this.id,
  });

  String? name;
  String? image;
  String? price;
  String? product;
  String? id;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        name: json["name"],
        image: json["image"],
        price: json["price"],
        product: json["product"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "price": price,
        "product": product,
        "_id": id,
      };
}

class PaymentResult {
  PaymentResult({
    this.id,
    this.status,
    this.updateTime,
    this.emailAddress,
  });

  String? id;
  String? status;
  String? updateTime;
  String? emailAddress;

  factory PaymentResult.fromJson(Map<String, dynamic> json) => PaymentResult(
        id: json["id"],
        status: json["status"],
        updateTime: json["update_time"],
        emailAddress: json["email_address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "update_time": updateTime,
        "email_address": emailAddress,
      };
}

class ShippingAddress {
  ShippingAddress({
    this.addressLine,
    this.latitude,
    this.longitude,
  });

  String? addressLine;
  double? latitude;
  double? longitude;

  factory ShippingAddress.fromJson(Map<String, dynamic> json) => ShippingAddress(
        addressLine: json["addressLine"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "addressLine": addressLine,
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Customer {
  Customer({
    this.customerId,
    this.name,
  });

  String? customerId;
  String? name;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customerId: json["customer_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "name": name,
      };
}
