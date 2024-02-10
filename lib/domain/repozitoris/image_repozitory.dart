
import 'dart:convert';

import 'package:cat_app/core/param/image_param.dart';
import 'package:cat_app/domain/models/image_model/api_response.dart';

import '../../core/apis.dart';
import '../../data/network.dart';

abstract class ImageRepozitory{
  Future<List<CatImage>> fetchAllCatImage(ImageParam param);
  Future<String?> uploadImage(String path,String description);
}

class ImageRepozitoryImplaments implements ImageRepozitory{
  final Network network;
  const ImageRepozitoryImplaments({required this.network});

  @override
  Future<List<CatImage>> fetchAllCatImage(ImageParam param) async{
    String respone = await network.methodGet(api: Api.api,query: param.toQueryParametrs) ?? "[]";
    List data = jsonDecode(respone);
    List<CatImage> images = data.map((e) => CatImage.fromJson(e)).toList();
    return images;
  }

  @override
  Future<String?> uploadImage(String path, String description) async{
   final response = await network.multipart(api: Api.apiUploud, filePath: path,body: {"sub_id" : description});
   if(response != null){
     return "Successful uploaded!";
   }
   return null;
  }

}