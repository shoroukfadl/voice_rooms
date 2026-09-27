import 'package:equatable/equatable.dart';
import 'package:roomly/utilities/constants/enums.dart';

class UserStatsEntity extends Equatable {
  const UserStatsEntity({
    this.roomsHosted = 0,
    this.followers = 0,
    this.following = 0,
  });

  final int roomsHosted;
  final int followers;
  final int following;

  UserStatsEntity copyWith({
    int? roomsHosted,
    int? followers,
    int? following,
  }) =>
      UserStatsEntity(
        roomsHosted: roomsHosted ?? this.roomsHosted,
        followers: followers ?? this.followers,
        following: following ?? this.following,
      );

  @override
  List<Object?> get props => [roomsHosted, followers, following];
}

class UserSettingsEntity extends Equatable {
  const UserSettingsEntity({
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

  UserSettingsEntity copyWith({
    bool? notificationsEnabled,
    bool? aiSummaryEnabled,
    bool? twoFactorEnabled,
    AppLanguage? language,
    AppThemeMode? theme,
  }) =>
      UserSettingsEntity(
        notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
        aiSummaryEnabled: aiSummaryEnabled ?? this.aiSummaryEnabled,
        twoFactorEnabled: twoFactorEnabled ?? this.twoFactorEnabled,
        language: language ?? this.language,
        theme: theme ?? this.theme,
      );

  @override
  List<Object?> get props => [
        notificationsEnabled,
        aiSummaryEnabled,
        twoFactorEnabled,
        language,
        theme,
      ];
}

class UserPresenceEntity extends Equatable {
  const UserPresenceEntity({
    this.isOnline = false,
    this.currentRoomId,
    this.lastSeenAt,
  });

  final bool isOnline;
  final String? currentRoomId;
  final DateTime? lastSeenAt;

  bool get isInRoom => currentRoomId != null;

  UserPresenceEntity copyWith({
    bool? isOnline,
    String? currentRoomId,
    DateTime? lastSeenAt,
  }) =>
      UserPresenceEntity(
        isOnline: isOnline ?? this.isOnline,
        currentRoomId: currentRoomId ?? this.currentRoomId,
        lastSeenAt: lastSeenAt ?? this.lastSeenAt,
      );

  @override
  List<Object?> get props => [isOnline, currentRoomId, lastSeenAt];
}

class UserEntity extends Equatable {
  const UserEntity({
    required this.uid,
    required this.email,
    this.emailVerified = false,
    this.authProvider = AuthProvider.email,
    this.name = '',
    this.username = '',
    this.bio = '',
    this.avatarUrl,
    this.stats = const UserStatsEntity(),
    this.settings = const UserSettingsEntity(),
    this.presence = const UserPresenceEntity(),
    this.fcmTokens = const [],
    this.createdAt,
    this.updatedAt,
  });

  final String uid;
  final String email;
  final bool emailVerified;
  final AuthProvider authProvider;

  final String name;
  final String username;
  final String bio;
  final String? avatarUrl;

  final UserStatsEntity stats;
  final UserSettingsEntity settings;
  final UserPresenceEntity presence;
  final List<String> fcmTokens;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  bool get hasAvatar => avatarUrl != null && avatarUrl!.isNotEmpty;

  UserEntity copyWith({
    String? name,
    String? username,
    String? bio,
    String? avatarUrl,
    UserStatsEntity? stats,
    UserSettingsEntity? settings,
    UserPresenceEntity? presence,
    List<String>? fcmTokens,
    DateTime? updatedAt,
  }) =>
      UserEntity(
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

  @override
  List<Object?> get props => [
        uid,
        email,
        emailVerified,
        authProvider,
        name,
        username,
        bio,
        avatarUrl,
        stats,
        settings,
        presence,
        fcmTokens,
        createdAt,
        updatedAt,
      ];
}
