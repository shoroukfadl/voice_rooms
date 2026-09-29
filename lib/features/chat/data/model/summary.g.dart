// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Summary _$SummaryFromJson(Map<String, dynamic> json) => _Summary(
      id: json['id'] as String,
      keyPoints: (json['keyPoints'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      actionItems: (json['actionItems'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      fromMessageId: json['fromMessageId'] as String,
      toMessageId: json['toMessageId'] as String,
      messageCount: (json['messageCount'] as num?)?.toInt() ?? 0,
      lang: json['lang'] as String? ?? 'ar',
      createdBy: json['createdBy'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$SummaryToJson(_Summary instance) => <String, dynamic>{
      'id': instance.id,
      'keyPoints': instance.keyPoints,
      'actionItems': instance.actionItems,
      'fromMessageId': instance.fromMessageId,
      'toMessageId': instance.toMessageId,
      'messageCount': instance.messageCount,
      'lang': instance.lang,
      'createdBy': instance.createdBy,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
