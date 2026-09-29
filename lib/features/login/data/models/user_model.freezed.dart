// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSettings {
  String get appLang;
  String get theme;
  bool get autoTranslate;
  bool get correctBeforeSend;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserSettingsCopyWith<UserSettings> get copyWith =>
      _$UserSettingsCopyWithImpl<UserSettings>(
          this as UserSettings, _$identity);

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as UserSettings;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserSettings &&
            (identical(other.appLang, _this.appLang) ||
                other.appLang == _this.appLang) &&
            (identical(other.theme, _this.theme) ||
                other.theme == _this.theme) &&
            (identical(other.autoTranslate, _this.autoTranslate) ||
                other.autoTranslate == _this.autoTranslate) &&
            (identical(other.correctBeforeSend, _this.correctBeforeSend) ||
                other.correctBeforeSend == _this.correctBeforeSend));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as UserSettings;
    return Object.hash(runtimeType, _this.appLang, _this.theme,
        _this.autoTranslate, _this.correctBeforeSend);
  }

  @override
  String toString() {
    final _this = this as UserSettings;
    return 'UserSettings(appLang: ${_this.appLang}, theme: ${_this.theme}, autoTranslate: ${_this.autoTranslate}, correctBeforeSend: ${_this.correctBeforeSend})';
  }
}

/// @nodoc
abstract mixin class $UserSettingsCopyWith<$Res> {
  factory $UserSettingsCopyWith(
          UserSettings value, $Res Function(UserSettings) _then) =
      _$UserSettingsCopyWithImpl;
  @useResult
  $Res call(
      {String appLang,
      String theme,
      bool autoTranslate,
      bool correctBeforeSend});
}

/// @nodoc
class _$UserSettingsCopyWithImpl<$Res> implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._self, this._then);

  final UserSettings _self;
  final $Res Function(UserSettings) _then;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appLang = null,
    Object? theme = null,
    Object? autoTranslate = null,
    Object? correctBeforeSend = null,
  }) {
    return _then(UserSettings(
      appLang: null == appLang
          ? _self.appLang
          : appLang // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      autoTranslate: null == autoTranslate
          ? _self.autoTranslate
          : autoTranslate // ignore: cast_nullable_to_non_nullable
              as bool,
      correctBeforeSend: null == correctBeforeSend
          ? _self.correctBeforeSend
          : correctBeforeSend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserSettings].
extension UserSettingsPatterns on UserSettings {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserSettings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserSettings() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserSettings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserSettings():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserSettings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserSettings() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String appLang, String theme, bool autoTranslate,
            bool correctBeforeSend)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserSettings() when $default != null:
        return $default(_that.appLang, _that.theme, _that.autoTranslate,
            _that.correctBeforeSend);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String appLang, String theme, bool autoTranslate,
            bool correctBeforeSend)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserSettings():
        return $default(_that.appLang, _that.theme, _that.autoTranslate,
            _that.correctBeforeSend);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String appLang, String theme, bool autoTranslate,
            bool correctBeforeSend)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserSettings() when $default != null:
        return $default(_that.appLang, _that.theme, _that.autoTranslate,
            _that.correctBeforeSend);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserSettings implements UserSettings {
  const _UserSettings(
      {this.appLang = 'ar',
      this.theme = 'system',
      this.autoTranslate = true,
      this.correctBeforeSend = true});
  factory _UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);

  @override
  @JsonKey()
  final String appLang;
  @override
  @JsonKey()
  final String theme;
  @override
  @JsonKey()
  final bool autoTranslate;
  @override
  @JsonKey()
  final bool correctBeforeSend;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserSettingsCopyWith<_UserSettings> get copyWith =>
      __$UserSettingsCopyWithImpl<_UserSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserSettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserSettings &&
            (identical(other.appLang, appLang) || other.appLang == appLang) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.autoTranslate, autoTranslate) ||
                other.autoTranslate == autoTranslate) &&
            (identical(other.correctBeforeSend, correctBeforeSend) ||
                other.correctBeforeSend == correctBeforeSend));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
        runtimeType, appLang, theme, autoTranslate, correctBeforeSend);
  }

  @override
  String toString() {
    return 'UserSettings(appLang: $appLang, theme: $theme, autoTranslate: $autoTranslate, correctBeforeSend: $correctBeforeSend)';
  }
}

/// @nodoc
abstract mixin class _$UserSettingsCopyWith<$Res>
    implements $UserSettingsCopyWith<$Res> {
  factory _$UserSettingsCopyWith(
          _UserSettings value, $Res Function(_UserSettings) _then) =
      __$UserSettingsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String appLang,
      String theme,
      bool autoTranslate,
      bool correctBeforeSend});
}

/// @nodoc
class __$UserSettingsCopyWithImpl<$Res>
    implements _$UserSettingsCopyWith<$Res> {
  __$UserSettingsCopyWithImpl(this._self, this._then);

  final _UserSettings _self;
  final $Res Function(_UserSettings) _then;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appLang = null,
    Object? theme = null,
    Object? autoTranslate = null,
    Object? correctBeforeSend = null,
  }) {
    return _then(_UserSettings(
      appLang: null == appLang
          ? _self.appLang
          : appLang // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      autoTranslate: null == autoTranslate
          ? _self.autoTranslate
          : autoTranslate // ignore: cast_nullable_to_non_nullable
              as bool,
      correctBeforeSend: null == correctBeforeSend
          ? _self.correctBeforeSend
          : correctBeforeSend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$UserModel {
  String get id;
  String get name;
  String get phone;
  String? get photoUrl;
  String? get about;
  String get preferredLang;
  UserSettings get settings;
  bool get isOnline;
  @TimestampConverter()
  DateTime get lastSeen;
  List<String> get fcmTokens;
  @TimestampConverter()
  DateTime get createdAt;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as UserModel;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.phone, _this.phone) ||
                other.phone == _this.phone) &&
            (identical(other.photoUrl, _this.photoUrl) ||
                other.photoUrl == _this.photoUrl) &&
            (identical(other.about, _this.about) ||
                other.about == _this.about) &&
            (identical(other.preferredLang, _this.preferredLang) ||
                other.preferredLang == _this.preferredLang) &&
            (identical(other.settings, _this.settings) ||
                other.settings == _this.settings) &&
            (identical(other.isOnline, _this.isOnline) ||
                other.isOnline == _this.isOnline) &&
            (identical(other.lastSeen, _this.lastSeen) ||
                other.lastSeen == _this.lastSeen) &&
            const DeepCollectionEquality()
                .equals(other.fcmTokens, _this.fcmTokens) &&
            (identical(other.createdAt, _this.createdAt) ||
                other.createdAt == _this.createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as UserModel;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.name,
        _this.phone,
        _this.photoUrl,
        _this.about,
        _this.preferredLang,
        _this.settings,
        _this.isOnline,
        _this.lastSeen,
        const DeepCollectionEquality().hash(_this.fcmTokens),
        _this.createdAt);
  }

  @override
  String toString() {
    final _this = this as UserModel;
    return 'UserModel(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone}, photoUrl: ${_this.photoUrl}, about: ${_this.about}, preferredLang: ${_this.preferredLang}, settings: ${_this.settings}, isOnline: ${_this.isOnline}, lastSeen: ${_this.lastSeen}, fcmTokens: ${_this.fcmTokens}, createdAt: ${_this.createdAt})';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String phone,
      String? photoUrl,
      String? about,
      String preferredLang,
      UserSettings settings,
      bool isOnline,
      @TimestampConverter() DateTime lastSeen,
      List<String> fcmTokens,
      @TimestampConverter() DateTime createdAt});

  $UserSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? photoUrl = freezed,
    Object? about = freezed,
    Object? preferredLang = null,
    Object? settings = null,
    Object? isOnline = null,
    Object? lastSeen = null,
    Object? fcmTokens = null,
    Object? createdAt = null,
  }) {
    return _then(UserModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _self.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredLang: null == preferredLang
          ? _self.preferredLang
          : preferredLang // ignore: cast_nullable_to_non_nullable
              as String,
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as UserSettings,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      lastSeen: null == lastSeen
          ? _self.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fcmTokens: null == fcmTokens
          ? _self.fcmTokens
          : fcmTokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSettingsCopyWith<$Res> get settings {
    return $UserSettingsCopyWith<$Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            String phone,
            String? photoUrl,
            String? about,
            String preferredLang,
            UserSettings settings,
            bool isOnline,
            @TimestampConverter() DateTime lastSeen,
            List<String> fcmTokens,
            @TimestampConverter() DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.phone,
            _that.photoUrl,
            _that.about,
            _that.preferredLang,
            _that.settings,
            _that.isOnline,
            _that.lastSeen,
            _that.fcmTokens,
            _that.createdAt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            String phone,
            String? photoUrl,
            String? about,
            String preferredLang,
            UserSettings settings,
            bool isOnline,
            @TimestampConverter() DateTime lastSeen,
            List<String> fcmTokens,
            @TimestampConverter() DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel():
        return $default(
            _that.id,
            _that.name,
            _that.phone,
            _that.photoUrl,
            _that.about,
            _that.preferredLang,
            _that.settings,
            _that.isOnline,
            _that.lastSeen,
            _that.fcmTokens,
            _that.createdAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String name,
            String phone,
            String? photoUrl,
            String? about,
            String preferredLang,
            UserSettings settings,
            bool isOnline,
            @TimestampConverter() DateTime lastSeen,
            List<String> fcmTokens,
            @TimestampConverter() DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.phone,
            _that.photoUrl,
            _that.about,
            _that.preferredLang,
            _that.settings,
            _that.isOnline,
            _that.lastSeen,
            _that.fcmTokens,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserModel extends UserModel {
  const _UserModel(
      {required this.id,
      required this.name,
      required this.phone,
      this.photoUrl,
      this.about,
      this.preferredLang = 'en',
      this.settings = const UserSettings(),
      this.isOnline = false,
      @TimestampConverter() required this.lastSeen,
      List<String> fcmTokens = const <String>[],
      @TimestampConverter() required this.createdAt})
      : _fcmTokens = fcmTokens,
        super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String? photoUrl;
  @override
  final String? about;
  @override
  @JsonKey()
  final String preferredLang;
  @override
  @JsonKey()
  final UserSettings settings;
  @override
  @JsonKey()
  final bool isOnline;
  @override
  @TimestampConverter()
  final DateTime lastSeen;
  final List<String> _fcmTokens;
  @override
  @JsonKey()
  List<String> get fcmTokens {
    if (_fcmTokens is EqualUnmodifiableListView) return _fcmTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fcmTokens);
  }

  @override
  @TimestampConverter()
  final DateTime createdAt;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.preferredLang, preferredLang) ||
                other.preferredLang == preferredLang) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            const DeepCollectionEquality()
                .equals(other.fcmTokens, _fcmTokens) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        name,
        phone,
        photoUrl,
        about,
        preferredLang,
        settings,
        isOnline,
        lastSeen,
        const DeepCollectionEquality().hash(_fcmTokens),
        createdAt);
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, phone: $phone, photoUrl: $photoUrl, about: $about, preferredLang: $preferredLang, settings: $settings, isOnline: $isOnline, lastSeen: $lastSeen, fcmTokens: $fcmTokens, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String phone,
      String? photoUrl,
      String? about,
      String preferredLang,
      UserSettings settings,
      bool isOnline,
      @TimestampConverter() DateTime lastSeen,
      List<String> fcmTokens,
      @TimestampConverter() DateTime createdAt});

  @override
  $UserSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? photoUrl = freezed,
    Object? about = freezed,
    Object? preferredLang = null,
    Object? settings = null,
    Object? isOnline = null,
    Object? lastSeen = null,
    Object? fcmTokens = null,
    Object? createdAt = null,
  }) {
    return _then(_UserModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _self.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredLang: null == preferredLang
          ? _self.preferredLang
          : preferredLang // ignore: cast_nullable_to_non_nullable
              as String,
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as UserSettings,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      lastSeen: null == lastSeen
          ? _self.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fcmTokens: null == fcmTokens
          ? _self._fcmTokens
          : fcmTokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSettingsCopyWith<$Res> get settings {
    return $UserSettingsCopyWith<$Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

// dart format on
