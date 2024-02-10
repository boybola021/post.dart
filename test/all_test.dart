import 'dart:convert';
import 'dart:developer';
import 'package:cat_app/core/apis.dart';
import 'package:cat_app/data/network.dart';
import 'package:flutter_test/flutter_test.dart';


void main(){
  group("All test", () {
    test("Api respone test", ()async{
      final response = await HttpNetwork().methodGet(api: Api.api,);
      final json = jsonDecode(response!) as List;
      // final data = json.map<Breed>((e){
      //   final item = e as Map;
      //   final res = item["breeds"];
      //   return res;//Breed.fromJson(res as Map<String,Object?>);
      // }).toList();
      log("====$json===");
    });
  });
}