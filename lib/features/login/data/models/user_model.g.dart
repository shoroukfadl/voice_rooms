// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) =>
    _UserSettings(
      appLang: json['appLang'] as String? ?? 'ar',
      theme: json['theme'] as String? ?? 'system',
      autoTranslate: json['autoTranslate'] as bool? ?? true,
      correctBeforeSend: json['correctBeforeSend'] as bool? ?? true,
    );

Map<String, dynamic> _$UserSettingsToJson(_UserSettings instance) =>
    <String, dynamic>{
      'appLang': instance.appLang,
      'theme': instance.theme,
      'autoTranslate': instance.autoTranslate,
      'correctBeforeSend': instance.correctBeforeSend,
    };

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      photoUrl: json['photoUrl'] as String?,
      about: json['about'] as String?,
      preferredLang: json['preferredLang'] as String? ?? 'en',
      settings: json['settings'] == null
          ? const UserSettings()
          : UserSettings.fromJson(json['settings'] as Map<String, dynamic>),
      isOnline: json['isOnline'] as bool? ?? false,
      lastSeen: const TimestampConverter().fromJson(json['lastSeen']),
      fcmTokens: (json['fcmTokens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'photoUrl': instance.photoUrl,
      'about': instance.about,
      'preferredLang': instance.preferredLang,
      'settings': instance.settings.toJson(),
      'isOnline': instance.isOnline,
      'lastSeen': const TimestampConverter().toJson(instance.lastSeen),
      'fcmTokens': instance.fcmTokens,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
