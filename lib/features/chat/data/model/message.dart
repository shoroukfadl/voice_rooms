import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:roomly/utilities/timestanp_converter.dart';

part 'message.freezed.dart';
part 'message.g.dart';

enum MessageType { text, image, file }

/// ترجمة متخزنة جوه الرسالة (كاش)
@freezed
abstract class Translation with _$Translation {
  const factory Translation({
    required String text,
    @TimestampConverter() required DateTime at,
  }) = _Translation;

  factory Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);
}

@freezed
abstract class Message with _$Message {
  const Message._();

  const factory Message({
    required String id,
    required String senderId,
    @JsonKey(unknownEnumValue: MessageType.text)
    @Default(MessageType.text)
    MessageType type,
    @Default('') String text,
    String? mediaUrl,
    String? lang, // اللغة المكتشفة
    String? replyTo,
    @TimestampConverter() required DateTime createdAt,
    @Default(<String>[]) List<String> deliveredTo,
    @Default(<String>[]) List<String> readBy,
    @Default(<String, Translation>{}) Map<String, Translation> translations,
    @Default(false) bool deleted,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  factory Message.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) =>
      Message.fromJson({...?doc.data(), 'id': doc.id});

  Map<String, dynamic> toFirestore() => toJson()..remove('id');

  bool isMine(String uid) => senderId == uid;
  bool isReadBy(String uid) => readBy.contains(uid);

  /// الترجمة المخزّنة للغة معينة (لو موجودة)
  String? translationFor(String lang) => translations[lang]?.text;

  /// محتاجة ترجمة؟ (لغتها مختلفة عن لغة المستخدم ومفيش كاش)
  bool needsTranslation(String userLang) =>
      type == MessageType.text &&
      lang != null &&
      lang != userLang &&
      !translations.containsKey(userLang);
}
