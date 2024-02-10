

import 'package:cat_app/data/network.dart';
import 'package:cat_app/domain/repozitoris/image_repozitory.dart';

late final ImageRepozitory repozitory;

void serviceLocator(){
  repozitory = ImageRepozitoryImplaments(network: HttpNetwork());
}