// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Translation {
  String get text;
  @TimestampConverter()
  DateTime get at;

  /// Create a copy of Translation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TranslationCopyWith<Translation> get copyWith =>
      _$TranslationCopyWithImpl<Translation>(this as Translation, _$identity);

  /// Serializes this Translation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as Translation;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Translation &&
            (identical(other.text, _this.text) || other.text == _this.text) &&
            (identical(other.at, _this.at) || other.at == _this.at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as Translation;
    return Object.hash(runtimeType, _this.text, _this.at);
  }

  @override
  String toString() {
    final _this = this as Translation;
    return 'Translation(text: ${_this.text}, at: ${_this.at})';
  }
}

/// @nodoc
abstract mixin class $TranslationCopyWith<$Res> {
  factory $TranslationCopyWith(
          Translation value, $Res Function(Translation) _then) =
      _$TranslationCopyWithImpl;
  @useResult
  $Res call({String text, @TimestampConverter() DateTime at});
}

/// @nodoc
class _$TranslationCopyWithImpl<$Res> implements $TranslationCopyWith<$Res> {
  _$TranslationCopyWithImpl(this._self, this._then);

  final Translation _self;
  final $Res Function(Translation) _then;

  /// Create a copy of Translation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? at = null,
  }) {
    return _then(Translation(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      at: null == at
          ? _self.at
          : at // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [Translation].
extension TranslationPatterns on Translation {
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
    TResult Function(_Translation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Translation() when $default != null:
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
    TResult Function(_Translation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Translation():
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
    TResult? Function(_Translation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Translation() when $default != null:
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
    TResult Function(String text, @TimestampConverter() DateTime at)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Translation() when $default != null:
        return $default(_that.text, _that.at);
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
    TResult Function(String text, @TimestampConverter() DateTime at) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Translation():
        return $default(_that.text, _that.at);
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
    TResult? Function(String text, @TimestampConverter() DateTime at)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Translation() when $default != null:
        return $default(_that.text, _that.at);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Translation implements Translation {
  const _Translation(
      {required this.text, @TimestampConverter() required this.at});
  factory _Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);

  @override
  final String text;
  @override
  @TimestampConverter()
  final DateTime at;

  /// Create a copy of Translation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TranslationCopyWith<_Translation> get copyWith =>
      __$TranslationCopyWithImpl<_Translation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TranslationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Translation &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.at, at) || other.at == at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, text, at);
  }

  @override
  String toString() {
    return 'Translation(text: $text, at: $at)';
  }
}

/// @nodoc
abstract mixin class _$TranslationCopyWith<$Res>
    implements $TranslationCopyWith<$Res> {
  factory _$TranslationCopyWith(
          _Translation value, $Res Function(_Translation) _then) =
      __$TranslationCopyWithImpl;
  @override
  @useResult
  $Res call({String text, @TimestampConverter() DateTime at});
}

/// @nodoc
class __$TranslationCopyWithImpl<$Res> implements _$TranslationCopyWith<$Res> {
  __$TranslationCopyWithImpl(this._self, this._then);

  final _Translation _self;
  final $Res Function(_Translation) _then;

  /// Create a copy of Translation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
    Object? at = null,
  }) {
    return _then(_Translation(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      at: null == at
          ? _self.at
          : at // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$Message {
  String get id;
  String get senderId;
  @JsonKey(unknownEnumValue: MessageType.text)
  MessageType get type;
  String get text;
  String? get mediaUrl;
  String? get lang;
  String? get replyTo;
  @TimestampConverter()
  DateTime get createdAt;
  List<String> get deliveredTo;
  List<String> get readBy;
  Map<String, Translation> get translations;
  bool get deleted;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageCopyWith<Message> get copyWith =>
      _$MessageCopyWithImpl<Message>(this as Message, _$identity);

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as Message;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Message &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.senderId, _this.senderId) ||
                other.senderId == _this.senderId) &&
            (identical(other.type, _this.type) || other.type == _this.type) &&
            (identical(other.text, _this.text) || other.text == _this.text) &&
            (identical(other.mediaUrl, _this.mediaUrl) ||
                other.mediaUrl == _this.mediaUrl) &&
            (identical(other.lang, _this.lang) || other.lang == _this.lang) &&
            (identical(other.replyTo, _this.replyTo) ||
                other.replyTo == _this.replyTo) &&
            (identical(other.createdAt, _this.createdAt) ||
                other.createdAt == _this.createdAt) &&
            const DeepCollectionEquality()
                .equals(other.deliveredTo, _this.deliveredTo) &&
            const DeepCollectionEquality().equals(other.readBy, _this.readBy) &&
            const DeepCollectionEquality()
                .equals(other.translations, _this.translations) &&
            (identical(other.deleted, _this.deleted) ||
                other.deleted == _this.deleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as Message;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.senderId,
        _this.type,
        _this.text,
        _this.mediaUrl,
        _this.lang,
        _this.replyTo,
        _this.createdAt,
        const DeepCollectionEquality().hash(_this.deliveredTo),
        const DeepCollectionEquality().hash(_this.readBy),
        const DeepCollectionEquality().hash(_this.translations),
        _this.deleted);
  }

  @override
  String toString() {
    final _this = this as Message;
    return 'Message(id: ${_this.id}, senderId: ${_this.senderId}, type: ${_this.type}, text: ${_this.text}, mediaUrl: ${_this.mediaUrl}, lang: ${_this.lang}, replyTo: ${_this.replyTo}, createdAt: ${_this.createdAt}, deliveredTo: ${_this.deliveredTo}, readBy: ${_this.readBy}, translations: ${_this.translations}, deleted: ${_this.deleted})';
  }
}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) =
      _$MessageCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String senderId,
      @JsonKey(unknownEnumValue: MessageType.text) MessageType type,
      String text,
      String? mediaUrl,
      String? lang,
      String? replyTo,
      @TimestampConverter() DateTime createdAt,
      List<String> deliveredTo,
      List<String> readBy,
      Map<String, Translation> translations,
      bool deleted});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? type = null,
    Object? text = null,
    Object? mediaUrl = freezed,
    Object? lang = freezed,
    Object? replyTo = freezed,
    Object? createdAt = null,
    Object? deliveredTo = null,
    Object? readBy = null,
    Object? translations = null,
    Object? deleted = null,
  }) {
    return _then(Message(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: freezed == mediaUrl
          ? _self.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      replyTo: freezed == replyTo
          ? _self.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveredTo: null == deliveredTo
          ? _self.deliveredTo
          : deliveredTo // ignore: cast_nullable_to_non_nullable
              as List<String>,
      readBy: null == readBy
          ? _self.readBy
          : readBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      translations: null == translations
          ? _self.translations
          : translations // ignore: cast_nullable_to_non_nullable
              as Map<String, Translation>,
      deleted: null == deleted
          ? _self.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [Message].
extension MessagePatterns on Message {
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
    TResult Function(_Message value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Message() when $default != null:
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
    TResult Function(_Message value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Message():
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
    TResult? Function(_Message value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Message() when $default != null:
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
            String senderId,
            @JsonKey(unknownEnumValue: MessageType.text) MessageType type,
            String text,
            String? mediaUrl,
            String? lang,
            String? replyTo,
            @TimestampConverter() DateTime createdAt,
            List<String> deliveredTo,
            List<String> readBy,
            Map<String, Translation> translations,
            bool deleted)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Message() when $default != null:
        return $default(
            _that.id,
            _that.senderId,
            _that.type,
            _that.text,
            _that.mediaUrl,
            _that.lang,
            _that.replyTo,
            _that.createdAt,
            _that.deliveredTo,
            _that.readBy,
            _that.translations,
            _that.deleted);
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
            String senderId,
            @JsonKey(unknownEnumValue: MessageType.text) MessageType type,
            String text,
            String? mediaUrl,
            String? lang,
            String? replyTo,
            @TimestampConverter() DateTime createdAt,
            List<String> deliveredTo,
            List<String> readBy,
            Map<String, Translation> translations,
            bool deleted)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Message():
        return $default(
            _that.id,
            _that.senderId,
            _that.type,
            _that.text,
            _that.mediaUrl,
            _that.lang,
            _that.replyTo,
            _that.createdAt,
            _that.deliveredTo,
            _that.readBy,
            _that.translations,
            _that.deleted);
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
            String senderId,
            @JsonKey(unknownEnumValue: MessageType.text) MessageType type,
            String text,
            String? mediaUrl,
            String? lang,
            String? replyTo,
            @TimestampConverter() DateTime createdAt,
            List<String> deliveredTo,
            List<String> readBy,
            Map<String, Translation> translations,
            bool deleted)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Message() when $default != null:
        return $default(
            _that.id,
            _that.senderId,
            _that.type,
            _that.text,
            _that.mediaUrl,
            _that.lang,
            _that.replyTo,
            _that.createdAt,
            _that.deliveredTo,
            _that.readBy,
            _that.translations,
            _that.deleted);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Message extends Message {
  const _Message(
      {required this.id,
      required this.senderId,
      @JsonKey(unknownEnumValue: MessageType.text) this.type = MessageType.text,
      this.text = '',
      this.mediaUrl,
      this.lang,
      this.replyTo,
      @TimestampConverter() required this.createdAt,
      List<String> deliveredTo = const <String>[],
      List<String> readBy = const <String>[],
      Map<String, Translation> translations = const <String, Translation>{},
      this.deleted = false})
      : _deliveredTo = deliveredTo,
        _readBy = readBy,
        _translations = translations,
        super._();
  factory _Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  @JsonKey(unknownEnumValue: MessageType.text)
  final MessageType type;
  @override
  @JsonKey()
  final String text;
  @override
  final String? mediaUrl;
  @override
  final String? lang;
  @override
  final String? replyTo;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  final List<String> _deliveredTo;
  @override
  @JsonKey()
  List<String> get deliveredTo {
    if (_deliveredTo is EqualUnmodifiableListView) return _deliveredTo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deliveredTo);
  }

  final List<String> _readBy;
  @override
  @JsonKey()
  List<String> get readBy {
    if (_readBy is EqualUnmodifiableListView) return _readBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readBy);
  }

  final Map<String, Translation> _translations;
  @override
  @JsonKey()
  Map<String, Translation> get translations {
    if (_translations is EqualUnmodifiableMapView) return _translations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_translations);
  }

  @override
  @JsonKey()
  final bool deleted;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessageCopyWith<_Message> get copyWith =>
      __$MessageCopyWithImpl<_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Message &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.replyTo, replyTo) || other.replyTo == replyTo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other.deliveredTo, _deliveredTo) &&
            const DeepCollectionEquality().equals(other.readBy, _readBy) &&
            const DeepCollectionEquality()
                .equals(other.translations, _translations) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        senderId,
        type,
        text,
        mediaUrl,
        lang,
        replyTo,
        createdAt,
        const DeepCollectionEquality().hash(_deliveredTo),
        const DeepCollectionEquality().hash(_readBy),
        const DeepCollectionEquality().hash(_translations),
        deleted);
  }

  @override
  String toString() {
    return 'Message(id: $id, senderId: $senderId, type: $type, text: $text, mediaUrl: $mediaUrl, lang: $lang, replyTo: $replyTo, createdAt: $createdAt, deliveredTo: $deliveredTo, readBy: $readBy, translations: $translations, deleted: $deleted)';
  }
}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) =
      __$MessageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String senderId,
      @JsonKey(unknownEnumValue: MessageType.text) MessageType type,
      String text,
      String? mediaUrl,
      String? lang,
      String? replyTo,
      @TimestampConverter() DateTime createdAt,
      List<String> deliveredTo,
      List<String> readBy,
      Map<String, Translation> translations,
      bool deleted});
}

/// @nodoc
class __$MessageCopyWithImpl<$Res> implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? type = null,
    Object? text = null,
    Object? mediaUrl = freezed,
    Object? lang = freezed,
    Object? replyTo = freezed,
    Object? createdAt = null,
    Object? deliveredTo = null,
    Object? readBy = null,
    Object? translations = null,
    Object? deleted = null,
  }) {
    return _then(_Message(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: freezed == mediaUrl
          ? _self.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      replyTo: freezed == replyTo
          ? _self.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveredTo: null == deliveredTo
          ? _self._deliveredTo
          : deliveredTo // ignore: cast_nullable_to_non_nullable
              as List<String>,
      readBy: null == readBy
          ? _self._readBy
          : readBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      translations: null == translations
          ? _self._translations
          : translations // ignore: cast_nullable_to_non_nullable
              as Map<String, Translation>,
      deleted: null == deleted
          ? _self.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
