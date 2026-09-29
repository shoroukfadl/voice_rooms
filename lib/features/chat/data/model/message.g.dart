// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Translation _$TranslationFromJson(Map<String, dynamic> json) => _Translation(
      text: json['text'] as String,
      at: const TimestampConverter().fromJson(json['at']),
    );

Map<String, dynamic> _$TranslationToJson(_Translation instance) =>
    <String, dynamic>{
      'text': instance.text,
      'at': const TimestampConverter().toJson(instance.at),
    };

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      type: $enumDecodeNullable(_$MessageTypeEnumMap, json['type'],
              unknownValue: MessageType.text) ??
          MessageType.text,
      text: json['text'] as String? ?? '',
      mediaUrl: json['mediaUrl'] as String?,
      lang: json['lang'] as String?,
      replyTo: json['replyTo'] as String?,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      deliveredTo: (json['deliveredTo'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      readBy: (json['readBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      translations: (json['translations'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, Translation.fromJson(e as Map<String, dynamic>)),
          ) ??
          const <String, Translation>{},
      deleted: json['deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'text': instance.text,
      'mediaUrl': instance.mediaUrl,
      'lang': instance.lang,
      'replyTo': instance.replyTo,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'deliveredTo': instance.deliveredTo,
      'readBy': instance.readBy,
      'translations':
          instance.translations.map((k, e) => MapEntry(k, e.toJson())),
      'deleted': instance.deleted,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.file: 'file',
};
