import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../core/apis.dart';


/// data provaydr
abstract class Network {
  Future<String?> methodGet({
    required String api,
    Object? id,
    String baseUrl = Api.baseUrl,
    Map<String, String>? query,
    Map<String, String> header = Api.headers,
  });

  Future<void> methodDelate({
    required String api,
    required Object id,
    String baseUrl = Api.baseUrl,
    Map<String, String> header = Api.headers,
  });

  Future<void> methodPost({
    required String api,
    String baseUrl = Api.baseUrl,
    required Map<String, String> data,
    Map<String, String> header = Api.headers,
  });

  Future<void> methodPut({
    required String api,
    required Object id,
    String baseUrl = Api.baseUrl,
    required Map<String, Object?> data,
    Map<String, String> header = Api.headers,
  });

  Future<String?>multipart({required String api,required String filePath,Map<String,String> header = Api.headersMedia,String baseUrl = Api.baseUrl,Map<String,String>? body,});
}

class HttpNetwork implements Network {
  @override
  Future<String?> methodGet({
    required String api,
    Object? id,
    String baseUrl = Api.baseUrl,
    Map<String, String>? query,
    Map<String, String> header = Api.headers,
  }) async {
    try {
      Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}", query);
      final response = await http.get(url, headers: header);
      if (response.statusCode == 200) {
        return utf8.decoder.convert(response.bodyBytes);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future<void> methodDelate({
    required String api,
    required Object id,
    String baseUrl = Api.baseUrl,
    Map<String, String> header = Api.headers,
  }) async {
    try {
      Uri url = Uri.https(baseUrl, "$api/$id");
      final response = await  http.delete(
        url,
      );
      if (response.statusCode == 200) {
        debugPrint(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> methodPost({
    required String api,
    String baseUrl = Api.baseUrl,
    required Map<String, String> data,
    Map<String, String> header = Api.headers,
  }) async {
    try {
      Uri url = Uri.https(baseUrl, api);
      final response = await  http.post(url, body: jsonEncode(data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> methodPut({
    required String api,
    required Object id,
    String baseUrl = Api.baseUrl,
    required Map<String, Object?> data,
    Map<String, String> header = Api.headers,
  }) async {
    try {
      Uri url = Uri.https(baseUrl, "$api/$id");
      final response = await  http.post(url, body: jsonEncode(data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String?>multipart({required String api,required String filePath,Map<String,String> header = Api.headersMedia,String baseUrl = Api.baseUrl,Map<String,String>? body,})async{
   final url = Uri.https(baseUrl,api);
   final request =  http.MultipartRequest("POST",url);
   request.headers.addAll(header);
   request.files.add(await http.MultipartFile.fromPath("file", filePath,contentType: MediaType("image", "jpeg")));
   if(body != null) request.fields.addAll(body);
   http.StreamedResponse response = await request.send();
   debugPrint("Response: ${response.statusCode}");
   debugPrint("Response: ${response.stream.toStringStream()}");
   if(response.statusCode == 200 || response.statusCode == 201){
     return await response.stream.bytesToString();
   }else{
     return null;
   }
  }

}
