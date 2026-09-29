// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LastMessage {
  String get text;
  String get senderId;
  String get type;
  @TimestampConverter()
  DateTime get at;

  /// Create a copy of LastMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LastMessageCopyWith<LastMessage> get copyWith =>
      _$LastMessageCopyWithImpl<LastMessage>(this as LastMessage, _$identity);

  /// Serializes this LastMessage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as LastMessage;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LastMessage &&
            (identical(other.text, _this.text) || other.text == _this.text) &&
            (identical(other.senderId, _this.senderId) ||
                other.senderId == _this.senderId) &&
            (identical(other.type, _this.type) || other.type == _this.type) &&
            (identical(other.at, _this.at) || other.at == _this.at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as LastMessage;
    return Object.hash(
        runtimeType, _this.text, _this.senderId, _this.type, _this.at);
  }

  @override
  String toString() {
    final _this = this as LastMessage;
    return 'LastMessage(text: ${_this.text}, senderId: ${_this.senderId}, type: ${_this.type}, at: ${_this.at})';
  }
}

/// @nodoc
abstract mixin class $LastMessageCopyWith<$Res> {
  factory $LastMessageCopyWith(
          LastMessage value, $Res Function(LastMessage) _then) =
      _$LastMessageCopyWithImpl;
  @useResult
  $Res call(
      {String text,
      String senderId,
      String type,
      @TimestampConverter() DateTime at});
}

/// @nodoc
class _$LastMessageCopyWithImpl<$Res> implements $LastMessageCopyWith<$Res> {
  _$LastMessageCopyWithImpl(this._self, this._then);

  final LastMessage _self;
  final $Res Function(LastMessage) _then;

  /// Create a copy of LastMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? senderId = null,
    Object? type = null,
    Object? at = null,
  }) {
    return _then(LastMessage(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      at: null == at
          ? _self.at
          : at // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [LastMessage].
extension LastMessagePatterns on LastMessage {
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
    TResult Function(_LastMessage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LastMessage() when $default != null:
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
    TResult Function(_LastMessage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LastMessage():
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
    TResult? Function(_LastMessage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LastMessage() when $default != null:
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
    TResult Function(String text, String senderId, String type,
            @TimestampConverter() DateTime at)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LastMessage() when $default != null:
        return $default(_that.text, _that.senderId, _that.type, _that.at);
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
    TResult Function(String text, String senderId, String type,
            @TimestampConverter() DateTime at)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LastMessage():
        return $default(_that.text, _that.senderId, _that.type, _that.at);
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
    TResult? Function(String text, String senderId, String type,
            @TimestampConverter() DateTime at)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LastMessage() when $default != null:
        return $default(_that.text, _that.senderId, _that.type, _that.at);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LastMessage implements LastMessage {
  const _LastMessage(
      {required this.text,
      required this.senderId,
      this.type = 'text',
      @TimestampConverter() required this.at});
  factory _LastMessage.fromJson(Map<String, dynamic> json) =>
      _$LastMessageFromJson(json);

  @override
  final String text;
  @override
  final String senderId;
  @override
  @JsonKey()
  final String type;
  @override
  @TimestampConverter()
  final DateTime at;

  /// Create a copy of LastMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LastMessageCopyWith<_LastMessage> get copyWith =>
      __$LastMessageCopyWithImpl<_LastMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LastMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LastMessage &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.at, at) || other.at == at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, text, senderId, type, at);
  }

  @override
  String toString() {
    return 'LastMessage(text: $text, senderId: $senderId, type: $type, at: $at)';
  }
}

/// @nodoc
abstract mixin class _$LastMessageCopyWith<$Res>
    implements $LastMessageCopyWith<$Res> {
  factory _$LastMessageCopyWith(
          _LastMessage value, $Res Function(_LastMessage) _then) =
      __$LastMessageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String text,
      String senderId,
      String type,
      @TimestampConverter() DateTime at});
}

/// @nodoc
class __$LastMessageCopyWithImpl<$Res> implements _$LastMessageCopyWith<$Res> {
  __$LastMessageCopyWithImpl(this._self, this._then);

  final _LastMessage _self;
  final $Res Function(_LastMessage) _then;

  /// Create a copy of LastMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
    Object? senderId = null,
    Object? type = null,
    Object? at = null,
  }) {
    return _then(_LastMessage(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      at: null == at
          ? _self.at
          : at // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$Chat {
  String get id;
  @JsonKey(unknownEnumValue: ChatType.direct)
  ChatType get type;
  List<String> get members;
  String? get name;
  String? get photoUrl;
  String? get createdBy;
  List<String> get admins;
  LastMessage? get lastMessage;
  @TimestampConverter()
  DateTime get lastActivity;
  Map<String, int> get unread;
  @TimestampConverter()
  DateTime get createdAt;

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatCopyWith<Chat> get copyWith =>
      _$ChatCopyWithImpl<Chat>(this as Chat, _$identity);

  /// Serializes this Chat to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as Chat;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Chat &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.type, _this.type) || other.type == _this.type) &&
            const DeepCollectionEquality()
                .equals(other.members, _this.members) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.photoUrl, _this.photoUrl) ||
                other.photoUrl == _this.photoUrl) &&
            (identical(other.createdBy, _this.createdBy) ||
                other.createdBy == _this.createdBy) &&
            const DeepCollectionEquality().equals(other.admins, _this.admins) &&
            (identical(other.lastMessage, _this.lastMessage) ||
                other.lastMessage == _this.lastMessage) &&
            (identical(other.lastActivity, _this.lastActivity) ||
                other.lastActivity == _this.lastActivity) &&
            const DeepCollectionEquality().equals(other.unread, _this.unread) &&
            (identical(other.createdAt, _this.createdAt) ||
                other.createdAt == _this.createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as Chat;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.type,
        const DeepCollectionEquality().hash(_this.members),
        _this.name,
        _this.photoUrl,
        _this.createdBy,
        const DeepCollectionEquality().hash(_this.admins),
        _this.lastMessage,
        _this.lastActivity,
        const DeepCollectionEquality().hash(_this.unread),
        _this.createdAt);
  }

  @override
  String toString() {
    final _this = this as Chat;
    return 'Chat(id: ${_this.id}, type: ${_this.type}, members: ${_this.members}, name: ${_this.name}, photoUrl: ${_this.photoUrl}, createdBy: ${_this.createdBy}, admins: ${_this.admins}, lastMessage: ${_this.lastMessage}, lastActivity: ${_this.lastActivity}, unread: ${_this.unread}, createdAt: ${_this.createdAt})';
  }
}

/// @nodoc
abstract mixin class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) _then) =
      _$ChatCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(unknownEnumValue: ChatType.direct) ChatType type,
      List<String> members,
      String? name,
      String? photoUrl,
      String? createdBy,
      List<String> admins,
      LastMessage? lastMessage,
      @TimestampConverter() DateTime lastActivity,
      Map<String, int> unread,
      @TimestampConverter() DateTime createdAt});

  $LastMessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class _$ChatCopyWithImpl<$Res> implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._self, this._then);

  final Chat _self;
  final $Res Function(Chat) _then;

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? members = null,
    Object? name = freezed,
    Object? photoUrl = freezed,
    Object? createdBy = freezed,
    Object? admins = null,
    Object? lastMessage = freezed,
    Object? lastActivity = null,
    Object? unread = null,
    Object? createdAt = null,
  }) {
    return _then(Chat(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChatType,
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      admins: null == admins
          ? _self.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastMessage: freezed == lastMessage
          ? _self.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as LastMessage?,
      lastActivity: null == lastActivity
          ? _self.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime,
      unread: null == unread
          ? _self.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LastMessageCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
      return null;
    }

    return $LastMessageCopyWith<$Res>(_self.lastMessage!, (value) {
      return _then(_self.copyWith(lastMessage: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Chat].
extension ChatPatterns on Chat {
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
    TResult Function(_Chat value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Chat() when $default != null:
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
    TResult Function(_Chat value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Chat():
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
    TResult? Function(_Chat value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Chat() when $default != null:
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
            @JsonKey(unknownEnumValue: ChatType.direct) ChatType type,
            List<String> members,
            String? name,
            String? photoUrl,
            String? createdBy,
            List<String> admins,
            LastMessage? lastMessage,
            @TimestampConverter() DateTime lastActivity,
            Map<String, int> unread,
            @TimestampConverter() DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Chat() when $default != null:
        return $default(
            _that.id,
            _that.type,
            _that.members,
            _that.name,
            _that.photoUrl,
            _that.createdBy,
            _that.admins,
            _that.lastMessage,
            _that.lastActivity,
            _that.unread,
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
            @JsonKey(unknownEnumValue: ChatType.direct) ChatType type,
            List<String> members,
            String? name,
            String? photoUrl,
            String? createdBy,
            List<String> admins,
            LastMessage? lastMessage,
            @TimestampConverter() DateTime lastActivity,
            Map<String, int> unread,
            @TimestampConverter() DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Chat():
        return $default(
            _that.id,
            _that.type,
            _that.members,
            _that.name,
            _that.photoUrl,
            _that.createdBy,
            _that.admins,
            _that.lastMessage,
            _that.lastActivity,
            _that.unread,
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
            @JsonKey(unknownEnumValue: ChatType.direct) ChatType type,
            List<String> members,
            String? name,
            String? photoUrl,
            String? createdBy,
            List<String> admins,
            LastMessage? lastMessage,
            @TimestampConverter() DateTime lastActivity,
            Map<String, int> unread,
            @TimestampConverter() DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Chat() when $default != null:
        return $default(
            _that.id,
            _that.type,
            _that.members,
            _that.name,
            _that.photoUrl,
            _that.createdBy,
            _that.admins,
            _that.lastMessage,
            _that.lastActivity,
            _that.unread,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Chat extends Chat {
  const _Chat(
      {required this.id,
      @JsonKey(unknownEnumValue: ChatType.direct) required this.type,
      required List<String> members,
      this.name,
      this.photoUrl,
      this.createdBy,
      List<String> admins = const <String>[],
      this.lastMessage,
      @TimestampConverter() required this.lastActivity,
      Map<String, int> unread = const <String, int>{},
      @TimestampConverter() required this.createdAt})
      : _members = members,
        _admins = admins,
        _unread = unread,
        super._();
  factory _Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(unknownEnumValue: ChatType.direct)
  final ChatType type;
  final List<String> _members;
  @override
  List<String> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  final String? name;
  @override
  final String? photoUrl;
  @override
  final String? createdBy;
  final List<String> _admins;
  @override
  @JsonKey()
  List<String> get admins {
    if (_admins is EqualUnmodifiableListView) return _admins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_admins);
  }

  @override
  final LastMessage? lastMessage;
  @override
  @TimestampConverter()
  final DateTime lastActivity;
  final Map<String, int> _unread;
  @override
  @JsonKey()
  Map<String, int> get unread {
    if (_unread is EqualUnmodifiableMapView) return _unread;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_unread);
  }

  @override
  @TimestampConverter()
  final DateTime createdAt;

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatCopyWith<_Chat> get copyWith =>
      __$ChatCopyWithImpl<_Chat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Chat &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.members, _members) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            const DeepCollectionEquality().equals(other.admins, _admins) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastActivity, lastActivity) ||
                other.lastActivity == lastActivity) &&
            const DeepCollectionEquality().equals(other.unread, _unread) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        type,
        const DeepCollectionEquality().hash(_members),
        name,
        photoUrl,
        createdBy,
        const DeepCollectionEquality().hash(_admins),
        lastMessage,
        lastActivity,
        const DeepCollectionEquality().hash(_unread),
        createdAt);
  }

  @override
  String toString() {
    return 'Chat(id: $id, type: $type, members: $members, name: $name, photoUrl: $photoUrl, createdBy: $createdBy, admins: $admins, lastMessage: $lastMessage, lastActivity: $lastActivity, unread: $unread, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$ChatCopyWith(_Chat value, $Res Function(_Chat) _then) =
      __$ChatCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(unknownEnumValue: ChatType.direct) ChatType type,
      List<String> members,
      String? name,
      String? photoUrl,
      String? createdBy,
      List<String> admins,
      LastMessage? lastMessage,
      @TimestampConverter() DateTime lastActivity,
      Map<String, int> unread,
      @TimestampConverter() DateTime createdAt});

  @override
  $LastMessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class __$ChatCopyWithImpl<$Res> implements _$ChatCopyWith<$Res> {
  __$ChatCopyWithImpl(this._self, this._then);

  final _Chat _self;
  final $Res Function(_Chat) _then;

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? members = null,
    Object? name = freezed,
    Object? photoUrl = freezed,
    Object? createdBy = freezed,
    Object? admins = null,
    Object? lastMessage = freezed,
    Object? lastActivity = null,
    Object? unread = null,
    Object? createdAt = null,
  }) {
    return _then(_Chat(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChatType,
      members: null == members
          ? _self._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      admins: null == admins
          ? _self._admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastMessage: freezed == lastMessage
          ? _self.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as LastMessage?,
      lastActivity: null == lastActivity
          ? _self.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime,
      unread: null == unread
          ? _self._unread
          : unread // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LastMessageCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
      return null;
    }

    return $LastMessageCopyWith<$Res>(_self.lastMessage!, (value) {
      return _then(_self.copyWith(lastMessage: value));
    });
  }
}

// dart format on
