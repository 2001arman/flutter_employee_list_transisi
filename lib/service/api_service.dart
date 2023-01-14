import 'dart:convert';

import 'package:flutter_employee_list_transisi/models/employee_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String endpoint = "https://reqres.in/api/";

  Future<List<DataEmployee>> getListEmployee(int page) async {
    try {
      var url = Uri.parse("${endpoint}users?page=$page");
      var response = await http.get(url);
      final Map<String, dynamic> parsed = jsonDecode(response.body);
      EmployeeModel employee = EmployeeModel.fromJson(parsed);
      return employee.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> createEmployee(
      String name, String job, String telephone, String email) async {
    try {
      var url = Uri.parse("${endpoint}users");
      var response = await http.post(url, body: {
        "name": email,
        "job": job,
        "telephone": telephone,
        "email": email,
      });
      final Map<String, dynamic> parsed = jsonDecode(response.body);
      return parsed;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      var url = Uri.parse("${endpoint}login");
      var response = await http.post(url, body: {
        "email": email,
        "password": password,
      });
      final Map<String, dynamic> parsed = jsonDecode(response.body);
      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
