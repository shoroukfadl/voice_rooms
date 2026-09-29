import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:roomly/utilities/timestanp_converter.dart';

part 'summary.freezed.dart';
part 'summary.g.dart';

@freezed
abstract class Summary with _$Summary {
  const Summary._();

  const factory Summary({
    required String id,
    @Default(<String>[]) List<String> keyPoints,
    @Default(<String>[]) List<String> actionItems,
    required String fromMessageId,
    required String toMessageId,
    @Default(0) int messageCount,
    @Default('ar') String lang,
    required String createdBy,
    @TimestampConverter() required DateTime createdAt,
  }) = _Summary;

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);

  factory Summary.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) =>
      Summary.fromJson({...?doc.data(), 'id': doc.id});

  Map<String, dynamic> toFirestore() => toJson()..remove('id');
}
