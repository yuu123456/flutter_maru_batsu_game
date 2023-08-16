// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StatusMessage {
  String get message => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  double get fontSize => throw _privateConstructorUsedError;
  FontWeight get fontWeight => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatusMessageCopyWith<StatusMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusMessageCopyWith<$Res> {
  factory $StatusMessageCopyWith(
          StatusMessage value, $Res Function(StatusMessage) then) =
      _$StatusMessageCopyWithImpl<$Res, StatusMessage>;
  @useResult
  $Res call(
      {String message, Color color, double fontSize, FontWeight fontWeight});
}

/// @nodoc
class _$StatusMessageCopyWithImpl<$Res, $Val extends StatusMessage>
    implements $StatusMessageCopyWith<$Res> {
  _$StatusMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? color = null,
    Object? fontSize = null,
    Object? fontWeight = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      fontSize: null == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as double,
      fontWeight: null == fontWeight
          ? _value.fontWeight
          : fontWeight // ignore: cast_nullable_to_non_nullable
              as FontWeight,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StatusMessageCopyWith<$Res>
    implements $StatusMessageCopyWith<$Res> {
  factory _$$_StatusMessageCopyWith(
          _$_StatusMessage value, $Res Function(_$_StatusMessage) then) =
      __$$_StatusMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message, Color color, double fontSize, FontWeight fontWeight});
}

/// @nodoc
class __$$_StatusMessageCopyWithImpl<$Res>
    extends _$StatusMessageCopyWithImpl<$Res, _$_StatusMessage>
    implements _$$_StatusMessageCopyWith<$Res> {
  __$$_StatusMessageCopyWithImpl(
      _$_StatusMessage _value, $Res Function(_$_StatusMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? color = null,
    Object? fontSize = null,
    Object? fontWeight = null,
  }) {
    return _then(_$_StatusMessage(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      fontSize: null == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as double,
      fontWeight: null == fontWeight
          ? _value.fontWeight
          : fontWeight // ignore: cast_nullable_to_non_nullable
              as FontWeight,
    ));
  }
}

/// @nodoc

class _$_StatusMessage implements _StatusMessage {
  const _$_StatusMessage(
      {this.message = 'ゲーム開始',
      this.color = Colors.black,
      this.fontSize = 24,
      this.fontWeight = FontWeight.normal});

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final Color color;
  @override
  @JsonKey()
  final double fontSize;
  @override
  @JsonKey()
  final FontWeight fontWeight;

  @override
  String toString() {
    return 'StatusMessage(message: $message, color: $color, fontSize: $fontSize, fontWeight: $fontWeight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatusMessage &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize) &&
            (identical(other.fontWeight, fontWeight) ||
                other.fontWeight == fontWeight));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, color, fontSize, fontWeight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatusMessageCopyWith<_$_StatusMessage> get copyWith =>
      __$$_StatusMessageCopyWithImpl<_$_StatusMessage>(this, _$identity);
}

abstract class _StatusMessage implements StatusMessage {
  const factory _StatusMessage(
      {final String message,
      final Color color,
      final double fontSize,
      final FontWeight fontWeight}) = _$_StatusMessage;

  @override
  String get message;
  @override
  Color get color;
  @override
  double get fontSize;
  @override
  FontWeight get fontWeight;
  @override
  @JsonKey(ignore: true)
  _$$_StatusMessageCopyWith<_$_StatusMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
