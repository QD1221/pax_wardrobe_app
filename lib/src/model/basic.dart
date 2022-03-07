import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic.freezed.dart';

@freezed
class Basic with _$Basic {
  factory Basic({
    double? width,
    int? height,
    int? depth,
    int? frameColor,
}) = _Basic;
}