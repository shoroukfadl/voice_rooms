// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Summary {
  String get id;
  List<String> get keyPoints;
  List<String> get actionItems;
  String get fromMessageId;
  String get toMessageId;
  int get messageCount;
  String get lang;
  String get createdBy;
  @TimestampConverter()
  DateTime get createdAt;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SummaryCopyWith<Summary> get copyWith =>
      _$SummaryCopyWithImpl<Summary>(this as Summary, _$identity);

  /// Serializes this Summary to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as Summary;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Summary &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            const DeepCollectionEquality()
                .equals(other.keyPoints, _this.keyPoints) &&
            const DeepCollectionEquality()
                .equals(other.actionItems, _this.actionItems) &&
            (identical(other.fromMessageId, _this.fromMessageId) ||
                other.fromMessageId == _this.fromMessageId) &&
            (identical(other.toMessageId, _this.toMessageId) ||
                other.toMessageId == _this.toMessageId) &&
            (identical(other.messageCount, _this.messageCount) ||
                other.messageCount == _this.messageCount) &&
            (identical(other.lang, _this.lang) || other.lang == _this.lang) &&
            (identical(other.createdBy, _this.createdBy) ||
                other.createdBy == _this.createdBy) &&
            (identical(other.createdAt, _this.createdAt) ||
                other.createdAt == _this.createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as Summary;
    return Object.hash(
        runtimeType,
        _this.id,
        const DeepCollectionEquality().hash(_this.keyPoints),
        const DeepCollectionEquality().hash(_this.actionItems),
        _this.fromMessageId,
        _this.toMessageId,
        _this.messageCount,
        _this.lang,
        _this.createdBy,
        _this.createdAt);
  }

  @override
  String toString() {
    final _this = this as Summary;
    return 'Summary(id: ${_this.id}, keyPoints: ${_this.keyPoints}, actionItems: ${_this.actionItems}, fromMessageId: ${_this.fromMessageId}, toMessageId: ${_this.toMessageId}, messageCount: ${_this.messageCount}, lang: ${_this.lang}, createdBy: ${_this.createdBy}, createdAt: ${_this.createdAt})';
  }
}

/// @nodoc
abstract mixin class $SummaryCopyWith<$Res> {
  factory $SummaryCopyWith(Summary value, $Res Function(Summary) _then) =
      _$SummaryCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      List<String> keyPoints,
      List<String> actionItems,
      String fromMessageId,
      String toMessageId,
      int messageCount,
      String lang,
      String createdBy,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$SummaryCopyWithImpl<$Res> implements $SummaryCopyWith<$Res> {
  _$SummaryCopyWithImpl(this._self, this._then);

  final Summary _self;
  final $Res Function(Summary) _then;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? keyPoints = null,
    Object? actionItems = null,
    Object? fromMessageId = null,
    Object? toMessageId = null,
    Object? messageCount = null,
    Object? lang = null,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(Summary(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      keyPoints: null == keyPoints
          ? _self.keyPoints
          : keyPoints // ignore: cast_nullable_to_non_nullable
              as List<String>,
      actionItems: null == actionItems
          ? _self.actionItems
          : actionItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fromMessageId: null == fromMessageId
          ? _self.fromMessageId
          : fromMessageId // ignore: cast_nullable_to_non_nullable
              as String,
      toMessageId: null == toMessageId
          ? _self.toMessageId
          : toMessageId // ignore: cast_nullable_to_non_nullable
              as String,
      messageCount: null == messageCount
          ? _self.messageCount
          : messageCount // ignore: cast_nullable_to_non_nullable
              as int,
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [Summary].
extension SummaryPatterns on Summary {
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
    TResult Function(_Summary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Summary() when $default != null:
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
    TResult Function(_Summary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Summary():
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
    TResult? Function(_Summary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Summary() when $default != null:
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
            List<String> keyPoints,
            List<String> actionItems,
            String fromMessageId,
            String toMessageId,
            int messageCount,
            String lang,
            String createdBy,
            @TimestampConverter() DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Summary() when $default != null:
        return $default(
            _that.id,
            _that.keyPoints,
            _that.actionItems,
            _that.fromMessageId,
            _that.toMessageId,
            _that.messageCount,
            _that.lang,
            _that.createdBy,
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
            List<String> keyPoints,
            List<String> actionItems,
            String fromMessageId,
            String toMessageId,
            int messageCount,
            String lang,
            String createdBy,
            @TimestampConverter() DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Summary():
        return $default(
            _that.id,
            _that.keyPoints,
            _that.actionItems,
            _that.fromMessageId,
            _that.toMessageId,
            _that.messageCount,
            _that.lang,
            _that.createdBy,
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
            List<String> keyPoints,
            List<String> actionItems,
            String fromMessageId,
            String toMessageId,
            int messageCount,
            String lang,
            String createdBy,
            @TimestampConverter() DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Summary() when $default != null:
        return $default(
            _that.id,
            _that.keyPoints,
            _that.actionItems,
            _that.fromMessageId,
            _that.toMessageId,
            _that.messageCount,
            _that.lang,
            _that.createdBy,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Summary extends Summary {
  const _Summary(
      {required this.id,
      List<String> keyPoints = const <String>[],
      List<String> actionItems = const <String>[],
      required this.fromMessageId,
      required this.toMessageId,
      this.messageCount = 0,
      this.lang = 'ar',
      required this.createdBy,
      @TimestampConverter() required this.createdAt})
      : _keyPoints = keyPoints,
        _actionItems = actionItems,
        super._();
  factory _Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);

  @override
  final String id;
  final List<String> _keyPoints;
  @override
  @JsonKey()
  List<String> get keyPoints {
    if (_keyPoints is EqualUnmodifiableListView) return _keyPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyPoints);
  }

  final List<String> _actionItems;
  @override
  @JsonKey()
  List<String> get actionItems {
    if (_actionItems is EqualUnmodifiableListView) return _actionItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actionItems);
  }

  @override
  final String fromMessageId;
  @override
  final String toMessageId;
  @override
  @JsonKey()
  final int messageCount;
  @override
  @JsonKey()
  final String lang;
  @override
  final String createdBy;
  @override
  @TimestampConverter()
  final DateTime createdAt;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SummaryCopyWith<_Summary> get copyWith =>
      __$SummaryCopyWithImpl<_Summary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SummaryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Summary &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.keyPoints, _keyPoints) &&
            const DeepCollectionEquality()
                .equals(other.actionItems, _actionItems) &&
            (identical(other.fromMessageId, fromMessageId) ||
                other.fromMessageId == fromMessageId) &&
            (identical(other.toMessageId, toMessageId) ||
                other.toMessageId == toMessageId) &&
            (identical(other.messageCount, messageCount) ||
                other.messageCount == messageCount) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        const DeepCollectionEquality().hash(_keyPoints),
        const DeepCollectionEquality().hash(_actionItems),
        fromMessageId,
        toMessageId,
        messageCount,
        lang,
        createdBy,
        createdAt);
  }

  @override
  String toString() {
    return 'Summary(id: $id, keyPoints: $keyPoints, actionItems: $actionItems, fromMessageId: $fromMessageId, toMessageId: $toMessageId, messageCount: $messageCount, lang: $lang, createdBy: $createdBy, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$SummaryCopyWith<$Res> implements $SummaryCopyWith<$Res> {
  factory _$SummaryCopyWith(_Summary value, $Res Function(_Summary) _then) =
      __$SummaryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      List<String> keyPoints,
      List<String> actionItems,
      String fromMessageId,
      String toMessageId,
      int messageCount,
      String lang,
      String createdBy,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$SummaryCopyWithImpl<$Res> implements _$SummaryCopyWith<$Res> {
  __$SummaryCopyWithImpl(this._self, this._then);

  final _Summary _self;
  final $Res Function(_Summary) _then;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? keyPoints = null,
    Object? actionItems = null,
    Object? fromMessageId = null,
    Object? toMessageId = null,
    Object? messageCount = null,
    Object? lang = null,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(_Summary(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      keyPoints: null == keyPoints
          ? _self._keyPoints
          : keyPoints // ignore: cast_nullable_to_non_nullable
              as List<String>,
      actionItems: null == actionItems
          ? _self._actionItems
          : actionItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fromMessageId: null == fromMessageId
          ? _self.fromMessageId
          : fromMessageId // ignore: cast_nullable_to_non_nullable
              as String,
      toMessageId: null == toMessageId
          ? _self.toMessageId
          : toMessageId // ignore: cast_nullable_to_non_nullable
              as String,
      messageCount: null == messageCount
          ? _self.messageCount
          : messageCount // ignore: cast_nullable_to_non_nullable
              as int,
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
