
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'weight.freezed.dart';
part 'weight.g.dart';

@freezed
class Weight with _$Weight{
 @JsonSerializable()
  const factory Weight({
   required String imperial,
    required String metric,
}) = _Weight;
  factory Weight.fromJson(Map<String,dynamic>json) => _$WeightFromJson(json);
}