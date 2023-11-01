// ignore_for_file: prefer_final_fields, non_constant_identifier_names, unused_local_variable, file_names

import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:webullish_fast/Services/ApiConst.dart';
import 'StorageKey.dart';

class ApiServices {
  GetStorage _box = GetStorage();

  Future<List<dynamic>> getRequestList({required url}) async {
    var jwt_token = _box.read(StorageKey.token);
    try {
      var response =
          await http.get(Uri.parse(apiConst.baseUrl + url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt_token'
      });

      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);

        return responsebody;
      }

      if (response.statusCode == 401) {
        var responsebody = jsonDecode(response.body);

        return [
          {'error': responsebody}
        ];
      } else {
        return [
          {'error': response.statusCode}
        ];
      }
    } catch (e) {
      return [
        {"error": e}
      ];
    }
  }

  Future<Map<dynamic, dynamic>> getRequestMap({required url}) async {
    var jwt_token = _box.read(StorageKey.token);

    try {
      var response = await http.get(Uri.parse(apiConst.baseUrl + url),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $jwt_token'
          });

      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);

        return responsebody;
      }

      if (response.statusCode == 401) {
        var responsebody = jsonDecode(response.body);

        return {'error': response.body};
      } else {
        return {'error': response.statusCode};
      }
    } catch (e) {
      return {"error": e};
    }
  }

  Future<Map<dynamic, dynamic>> postRequestMap(
      {required url, required Map<dynamic, dynamic> body}) async {
    var jwt_token = _box.read(StorageKey.token);

    try {
      var response = await http.post(Uri.parse(apiConst.baseUrl + url),
          body: json.encode(body),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $jwt_token',
            'Content-Type': 'application/json',
          });

      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);

        return responsebody;
      }

      if (response.statusCode == 401) {
        var responsebody = jsonDecode(response.body);

        return {'error': responsebody};
      } else {
        return {'error': jsonDecode(response.body)};
      }
    } catch (e) {
      return {"error": e};
    }
  }

  Future<Map<dynamic, dynamic>> postRequestList(
      {required url, required Map<dynamic, dynamic> body}) async {
    var jwt_token = _box.read(StorageKey.token);

    try {
      var response =
          await http.post(Uri.parse(url), body: json.encode(body), headers: {
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwt_token'
      });
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      }

      if (response.statusCode == 401) {
        var responsebody = jsonDecode(response.body);
        return {'error': response.body};
      } else {
        return {"error": response.statusCode};
      }
    } catch (e) {
      return {"error": e};
    }
  }

  Future<Map<dynamic, dynamic>> authRequest(
      {required String url, Map<dynamic, dynamic>? credintial}) async {
    var userData = _box.read(StorageKey.userdata);

    var body = credintial ?? userData;

    try {
      var response = await http.post(Uri.parse(apiConst.baseUrl + url),
          body: json.encode(body),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json; charset=UTF-8',
          });

      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        _box.write(StorageKey.token, responsebody['access_token']);
        _box.write(StorageKey.userdata, responsebody);

        return responsebody;
      } else {
        return {"error": response.body};
      }
    } catch (e) {
      return {"error": e};
    }
  }

  Future<Map<String, dynamic>> apiPut({
    url,
    body,
  }) async {
    try {
      var response = await http.put(Uri.parse('$url'),
          headers: <String, String>{
            'Accept': 'application/json; charset=UTF-8',
          },
          body: json.encode(body));

      if (response.statusCode == 401) {}
      if (response.statusCode == 403) {}
      if (response.statusCode == 200) {
        return {'response': response.statusCode};
      }

      return {'error': response.body};
    } catch (e) {
      return {'error': e};
    }
  }

  Future<Map<String, dynamic>> apiDelete(url) async {
    try {
      var response =
          await http.delete(Uri.parse('$url'), headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
      });

      if (response.statusCode == 401) {}
      if (response.statusCode == 403) {}
      if (response.statusCode == 200) {
        return {'response': response.statusCode};
      }

      return {'error': response.statusCode};
    } catch (e) {
      return {'error': e};
    }
  }
}
