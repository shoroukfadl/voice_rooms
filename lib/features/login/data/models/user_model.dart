import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:roomly/utilities/timestanp_converter.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserSettings with _$UserSettings {
  const factory UserSettings({
    @Default('ar') String appLang,
    @Default('system') String theme,
    @Default(true) bool autoTranslate,
    @Default(true) bool correctBeforeSend,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String name,
    required String phone,
    String? photoUrl,
    String? about,
    @Default('en') String preferredLang,
    @Default(UserSettings()) UserSettings settings,
    @Default(false) bool isOnline,
    @TimestampConverter() required DateTime lastSeen,
    @Default(<String>[]) List<String> fcmTokens,
    @TimestampConverter() required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) =>
      UserModel.fromJson({...?doc.data(), 'id': doc.id});

  Map<String, dynamic> toFirestore() => toJson()..remove('id');
}
