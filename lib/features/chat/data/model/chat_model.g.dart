// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LastMessage _$LastMessageFromJson(Map<String, dynamic> json) => _LastMessage(
      text: json['text'] as String,
      senderId: json['senderId'] as String,
      type: json['type'] as String? ?? 'text',
      at: const TimestampConverter().fromJson(json['at']),
    );

Map<String, dynamic> _$LastMessageToJson(_LastMessage instance) =>
    <String, dynamic>{
      'text': instance.text,
      'senderId': instance.senderId,
      'type': instance.type,
      'at': const TimestampConverter().toJson(instance.at),
    };

_Chat _$ChatFromJson(Map<String, dynamic> json) => _Chat(
      id: json['id'] as String,
      type: $enumDecode(_$ChatTypeEnumMap, json['type'],
          unknownValue: ChatType.direct),
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String?,
      photoUrl: json['photoUrl'] as String?,
      createdBy: json['createdBy'] as String?,
      admins: (json['admins'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      lastMessage: json['lastMessage'] == null
          ? null
          : LastMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
      lastActivity: const TimestampConverter().fromJson(json['lastActivity']),
      unread: (json['unread'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const <String, int>{},
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$ChatToJson(_Chat instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$ChatTypeEnumMap[instance.type]!,
      'members': instance.members,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'createdBy': instance.createdBy,
      'admins': instance.admins,
      'lastMessage': instance.lastMessage?.toJson(),
      'lastActivity': const TimestampConverter().toJson(instance.lastActivity),
      'unread': instance.unread,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

const _$ChatTypeEnumMap = {
  ChatType.direct: 'direct',
  ChatType.group: 'group',
};
