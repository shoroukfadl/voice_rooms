// lib/features/user/data/models/user_model.dart
//
// Data layer. Enums (AppLanguage, AppThemeMode, AuthProvider) now live in
// the entity file, so they are no longer declared here.

import 'package:voice_rooms/utilities/constants/enums.dart';

import '../../domain/entities/user_entity.dart';

/// Aggregated counters shown on the Profile screen.
class UserStats {
  const UserStats({
    this.roomsHosted = 0,
    this.followers = 0,
    this.following = 0,
  });

  final int roomsHosted;
  final int followers;
  final int following;

  factory UserStats.fromJson(Map<String, dynamic> json) => UserStats(
        roomsHosted: json['roomsHosted'] ?? 0,
        followers: json['followers'] ?? 0,
        following: json['following'] ?? 0,
      );

  factory UserStats.fromEntity(UserStatsEntity entity) => UserStats(
        roomsHosted: entity.roomsHosted,
        followers: entity.followers,
        following: entity.following,
      );

  Map<String, dynamic> toJson() => {
        'roomsHosted': roomsHosted,
        'followers': followers,
        'following': following,
      };

  UserStatsEntity toEntity() => UserStatsEntity(
        roomsHosted: roomsHosted,
        followers: followers,
        following: following,
      );

  UserStats copyWith({int? roomsHosted, int? followers, int? following}) =>
      UserStats(
        roomsHosted: roomsHosted ?? this.roomsHosted,
        followers: followers ?? this.followers,
        following: following ?? this.following,
      );
}

/// Everything set on the Settings screen (notifications, AI summary,
/// security, language, theme).
class UserSettings {
  const UserSettings({
    this.notificationsEnabled = true,
    this.aiSummaryEnabled = true,
    this.twoFactorEnabled = false,
    this.language = AppLanguage.en,
    this.theme = AppThemeMode.system,
  });

  final bool notificationsEnabled;
  final bool aiSummaryEnabled;
  final bool twoFactorEnabled;
  final AppLanguage language;
  final AppThemeMode theme;

  factory UserSettings.fromJson(Map<String, dynamic> json) => UserSettings(
        notificationsEnabled: json['notificationsEnabled'] ?? true,
        aiSummaryEnabled: json['aiSummaryEnabled'] ?? true,
        twoFactorEnabled: json['twoFactorEnabled'] ?? false,
        language: AppLanguage.values.firstWhere(
          (e) => e.name == json['language'],
          orElse: () => AppLanguage.en,
        ),
        theme: AppThemeMode.values.firstWhere(
          (e) => e.name == json['theme'],
          orElse: () => AppThemeMode.system,
        ),
      );

  factory UserSettings.fromEntity(UserSettingsEntity entity) => UserSettings(
        notificationsEnabled: entity.notificationsEnabled,
        aiSummaryEnabled: entity.aiSummaryEnabled,
        twoFactorEnabled: entity.twoFactorEnabled,
        language: entity.language,
        theme: entity.theme,
      );

  Map<String, dynamic> toJson() => {
        'notificationsEnabled': notificationsEnabled,
        'aiSummaryEnabled': aiSummaryEnabled,
        'twoFactorEnabled': twoFactorEnabled,
        'language': language.name,
        'theme': theme.name,
      };

  UserSettingsEntity toEntity() => UserSettingsEntity(
        notificationsEnabled: notificationsEnabled,
        aiSummaryEnabled: aiSummaryEnabled,
        twoFactorEnabled: twoFactorEnabled,
        language: language,
        theme: theme,
      );

  UserSettings copyWith({
    bool? notificationsEnabled,
    bool? aiSummaryEnabled,
    bool? twoFactorEnabled,
    AppLanguage? language,
    AppThemeMode? theme,
  }) =>
      UserSettings(
        notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
        aiSummaryEnabled: aiSummaryEnabled ?? this.aiSummaryEnabled,
        twoFactorEnabled: twoFactorEnabled ?? this.twoFactorEnabled,
        language: language ?? this.language,
        theme: theme ?? this.theme,
      );
}

/// Lightweight presence info: who's online and which room they're in,
/// so Home/Explore can show "your friend is live" style hints later.
class UserPresence {
  const UserPresence({
    this.isOnline = false,
    this.currentRoomId,
    this.lastSeenAt,
  });

  final bool isOnline;
  final String? currentRoomId;
  final DateTime? lastSeenAt;

  factory UserPresence.fromJson(Map<String, dynamic> json) => UserPresence(
        isOnline: json['isOnline'] ?? false,
        currentRoomId: json['currentRoomId'],
        lastSeenAt: json['lastSeenAt'] != null
            ? DateTime.parse(json['lastSeenAt'])
            : null,
      );

  factory UserPresence.fromEntity(UserPresenceEntity entity) => UserPresence(
        isOnline: entity.isOnline,
        currentRoomId: entity.currentRoomId,
        lastSeenAt: entity.lastSeenAt,
      );

  Map<String, dynamic> toJson() => {
        'isOnline': isOnline,
        'currentRoomId': currentRoomId,
        'lastSeenAt': lastSeenAt?.toIso8601String(),
      };

  UserPresenceEntity toEntity() => UserPresenceEntity(
        isOnline: isOnline,
        currentRoomId: currentRoomId,
        lastSeenAt: lastSeenAt,
      );
}

/// The full user document: `users/{uid}` in Firestore.
class UserModel {
  const UserModel({
    this.uid,
    this.email,
    this.name,
    this.username,
    this.createdAt,
    this.updatedAt,
    this.emailVerified = false,
    this.authProvider = AuthProvider.email,
    this.bio = '',
    this.avatarUrl,
    this.stats = const UserStats(),
    this.settings = const UserSettings(),
    this.presence = const UserPresence(),
    this.fcmTokens = const [],
  });

  final String? uid;
  final String? email;
  final bool emailVerified;
  final AuthProvider? authProvider;

  final String? name;
  final String? username;
  final String? bio;
  final String? avatarUrl;

  final UserStats? stats;
  final UserSettings? settings;
  final UserPresence? presence;
  final List<String> fcmTokens;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        email: json['email'],
        emailVerified: json['emailVerified'] ?? false,
        authProvider: AuthProvider.values.firstWhere(
          (e) => e.name == json['authProvider'],
          orElse: () => AuthProvider.email,
        ),
        name: json['name'] ?? '',
        username: json['username'] ?? '',
        bio: json['bio'] ?? '',
        avatarUrl: json['avatarUrl'],
        stats: UserStats.fromJson(json['stats'] ?? {}),
        settings: UserSettings.fromJson(json['settings'] ?? {}),
        presence: UserPresence.fromJson(json['presence'] ?? {}),
        fcmTokens: List<String>.from(json['fcmTokens'] ?? []),
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
      );

  /// Entity -> Model (use before saving to Firestore).
  factory UserModel.fromEntity(UserEntity entity) => UserModel(
        uid: entity.uid,
        email: entity.email,
        emailVerified: entity.emailVerified,
        authProvider: entity.authProvider,
        name: entity.name,
        username: entity.username,
        bio: entity.bio,
        avatarUrl: entity.avatarUrl,
        stats: UserStats.fromEntity(entity.stats),
        settings: UserSettings.fromEntity(entity.settings),
        presence: UserPresence.fromEntity(entity.presence),
        fcmTokens: entity.fcmTokens,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );

  /// Firebase User -> Model (use after authentication).
  factory UserModel.fromFirebaseUser(dynamic firebaseUser) => UserModel(
        uid: firebaseUser.uid,
        email: firebaseUser.email,
        emailVerified: firebaseUser.emailVerified,
        authProvider: AuthProvider.email,
        name: firebaseUser.displayName,
        username: firebaseUser.displayName,
        avatarUrl: firebaseUser.photoURL,
        createdAt: firebaseUser.metadata?.creationTime,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'emailVerified': emailVerified,
        'authProvider': authProvider?.name,
        'name': name,
        'username': username,
        'bio': bio,
        'avatarUrl': avatarUrl,
        'stats': stats?.toJson(),
        'settings': settings?.toJson(),
        'presence': presence?.toJson(),
        'fcmTokens': fcmTokens,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  UserEntity toEntity() => UserEntity(
        uid: uid ?? '',
        email: email ?? '',
        emailVerified: emailVerified,
        authProvider: authProvider ?? AuthProvider.email,
        name: name ?? '',
        username: username ?? '',
        bio: bio ?? '',
        avatarUrl: avatarUrl,
        stats: stats?.toEntity() ?? const UserStatsEntity(),
        settings: settings?.toEntity() ?? const UserSettingsEntity(),
        presence: presence?.toEntity() ?? const UserPresenceEntity(),
        fcmTokens: List<String>.unmodifiable(fcmTokens),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  UserModel copyWith({
    String? name,
    String? username,
    String? bio,
    String? avatarUrl,
    UserStats? stats,
    UserSettings? settings,
    UserPresence? presence,
    List<String>? fcmTokens,
    DateTime? updatedAt,
  }) =>
      UserModel(
        uid: uid,
        email: email,
        emailVerified: emailVerified,
        authProvider: authProvider,
        name: name ?? this.name,
        username: username ?? this.username,
        bio: bio ?? this.bio,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        stats: stats ?? this.stats,
        settings: settings ?? this.settings,
        presence: presence ?? this.presence,
        fcmTokens: fcmTokens ?? this.fcmTokens,
        createdAt: createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}
