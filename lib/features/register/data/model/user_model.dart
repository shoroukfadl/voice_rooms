// ============================================================
// USER DOCUMENT — Firestore shape
// Collection: users/{uid}
// ============================================================
//
// {
//   "uid": "9f3a1c2e-8b4d-4a91-9c2f-1e7d5b6a0c33",
//   "email": "mostafa@email.com",
//   "emailVerified": true,
//   "authProvider": "email",              // "email" | "google" | "apple"
//
//   "name": "Mostafa Adel",
//   "username": "mostafa.adel",
//   "bio": "Flutter engineer. Building Voice Rooms on the side.",
//   "avatarUrl": "https://.../avatars/9f3a1c2e.jpg",
//
//   "stats": {
//     "roomsHosted": 18,
//     "followers": 1200,
//     "following": 96
//   },
//
//   "settings": {
//     "notificationsEnabled": true,
//     "aiSummaryEnabled": true,
//     "twoFactorEnabled": false,
//     "language": "en",                   // "en" | "ar"
//     "theme": "system"                   // "light" | "dark" | "system"
//   },
//
//   "presence": {
//     "isOnline": false,
//     "currentRoomId": null,
//     "lastSeenAt": "2026-09-23T10:42:00Z"
//   },
//
//   "fcmTokens": ["dK7f...", "aP2q..."],   // one per device, for push
//
//   "createdAt": "2026-06-01T08:15:00Z",
//   "updatedAt": "2026-09-23T10:42:00Z"
// }
//
// ============================================================

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

  Map<String, dynamic> toJson() => {
        'roomsHosted': roomsHosted,
        'followers': followers,
        'following': following,
      };

  UserStats copyWith({int? roomsHosted, int? followers, int? following}) =>
      UserStats(
        roomsHosted: roomsHosted ?? this.roomsHosted,
        followers: followers ?? this.followers,
        following: following ?? this.following,
      );
}

enum AppLanguage { en, ar }

enum AppThemeMode { light, dark, system }

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

  Map<String, dynamic> toJson() => {
        'notificationsEnabled': notificationsEnabled,
        'aiSummaryEnabled': aiSummaryEnabled,
        'twoFactorEnabled': twoFactorEnabled,
        'language': language.name,
        'theme': theme.name,
      };

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

/// Lightweight presence info — who's online and which room they're in,
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

  Map<String, dynamic> toJson() => {
        'isOnline': isOnline,
        'currentRoomId': currentRoomId,
        'lastSeenAt': lastSeenAt?.toIso8601String(),
      };
}

enum AuthProvider { email, google, apple }

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
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
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
