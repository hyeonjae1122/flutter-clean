import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';

// part 'photo.freezed.dart';
part 'photo.g.dart';
// Equtable을 사용함으로서 불변객체로
@JsonSerializable()
class Photo extends Equatable {
  final int id;
  final String tags;
  @JsonKey(name: 'previewURL')
  final String previewURL;

  Photo({
    required this.id,
    required this.tags,
    required this.previewURL
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  @override
  List<Object?> get props => [id];
}

// @freezed
// class Photo with _$Photo {
//   factory Photo({
//     required int id,
//     required String tags,
//     @JsonKey(name: 'previewURL') required String previewURL,
//   }) = _Photo;
//
//   factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
// }
