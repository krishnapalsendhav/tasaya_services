import 'dart:convert';
import '../model/all_orders_model.dart';
import '../constant/constant_methods.dart';
import '../model/category_model.dart';
import '../model/services_login_model.dart';
import 'package:http/http.dart' as http;

import '../secrets/secrets.dart';

class Services {
  Future<ServiceLogin?> serviceRegister(String body) async {
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/user/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );
      if (response.statusCode == 201) {
        (response.body);
        return serviceLoginFromJson(response.body);
      } else {
        errorDailog('Server Return Status Code : ${response.statusCode.toString()}');
      }
    } catch (e) {
      errorDailog(e.toString());
    }
    return null;
  }

  Future<ServiceLogin?> serviceLogin(String number, String password) async {
    try {
      var response = await http.post(Uri.parse("$baseUrl/user/login"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, dynamic>{"phone": number, "password": password},
          ));
      if (response.statusCode == 200) {
        return serviceLoginFromJson(response.body);
      } else {
        errorDailog('Server Return Status Code : ${response.statusCode.toString()}');
      }
    } catch (e) {
      errorDailog(e.toString());
    }
    return null;
  }

  Future<ServicesCategory?> getCategory() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/category/get'));
      if (response.statusCode == 200) {
        return servicesCategoryFromJson(response.body);
      } else {
        errorDailog('Server Return Status Code : ${response.statusCode.toString()}');
      }
    } catch (e) {
      errorDailog(e.toString());
    }
    return null;
  }

  Future<AllOrders?> getAllOrders() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/order/get'));
      if (response.statusCode == 200) {
        return allOrdersFromJson(response.body);
      } else {
        errorDailog('Server Return Status Code : ${response.statusCode.toString()}');
      }
    } catch (e) {
      errorDailog(e.toString());
    }
    return null;
  }
}
