import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:roomly/utilities/timestanp_converter.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

enum ChatType { direct, group }

@freezed
abstract class LastMessage with _$LastMessage {
  const factory LastMessage({
    required String text,
    required String senderId,
    @Default('text') String type,
    @TimestampConverter() required DateTime at,
  }) = _LastMessage;

  factory LastMessage.fromJson(Map<String, dynamic> json) =>
      _$LastMessageFromJson(json);
}

@freezed
abstract class Chat with _$Chat {
  const Chat._();

  const factory Chat({
    required String id,
    @JsonKey(unknownEnumValue: ChatType.direct) required ChatType type,
    required List<String> members,
    String? name, // للمجموعات
    String? photoUrl, // للمجموعات
    String? createdBy,
    @Default(<String>[]) List<String> admins,
    LastMessage? lastMessage,
    @TimestampConverter() required DateTime lastActivity,
    @Default(<String, int>{}) Map<String, int> unread, // uid -> count
    @TimestampConverter() required DateTime createdAt,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  factory Chat.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) =>
      Chat.fromJson({...?doc.data(), 'id': doc.id});

  Map<String, dynamic> toFirestore() => toJson()..remove('id');

  int unreadFor(String uid) => unread[uid] ?? 0;

  String? otherMember(String myUid) =>
      type == ChatType.direct ? members.firstWhere((m) => m != myUid) : null;
}
