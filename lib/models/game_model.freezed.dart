// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameModel {
  List<List<String>> get board => throw _privateConstructorUsedError;
  String get currentPlayer => throw _privateConstructorUsedError;
  bool get isDraw => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;
  StatusMessage get statusMessage => throw _privateConstructorUsedError;
  Player get playerX => throw _privateConstructorUsedError;
  Player get playerO => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameModelCopyWith<GameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameModelCopyWith<$Res> {
  factory $GameModelCopyWith(GameModel value, $Res Function(GameModel) then) =
      _$GameModelCopyWithImpl<$Res, GameModel>;
  @useResult
  $Res call(
      {List<List<String>> board,
      String currentPlayer,
      bool isDraw,
      bool isPlaying,
      StatusMessage statusMessage,
      Player playerX,
      Player playerO});

  $StatusMessageCopyWith<$Res> get statusMessage;
  $PlayerCopyWith<$Res> get playerX;
  $PlayerCopyWith<$Res> get playerO;
}

/// @nodoc
class _$GameModelCopyWithImpl<$Res, $Val extends GameModel>
    implements $GameModelCopyWith<$Res> {
  _$GameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = null,
    Object? currentPlayer = null,
    Object? isDraw = null,
    Object? isPlaying = null,
    Object? statusMessage = null,
    Object? playerX = null,
    Object? playerO = null,
  }) {
    return _then(_value.copyWith(
      board: null == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      currentPlayer: null == currentPlayer
          ? _value.currentPlayer
          : currentPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      isDraw: null == isDraw
          ? _value.isDraw
          : isDraw // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as StatusMessage,
      playerX: null == playerX
          ? _value.playerX
          : playerX // ignore: cast_nullable_to_non_nullable
              as Player,
      playerO: null == playerO
          ? _value.playerO
          : playerO // ignore: cast_nullable_to_non_nullable
              as Player,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusMessageCopyWith<$Res> get statusMessage {
    return $StatusMessageCopyWith<$Res>(_value.statusMessage, (value) {
      return _then(_value.copyWith(statusMessage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res> get playerX {
    return $PlayerCopyWith<$Res>(_value.playerX, (value) {
      return _then(_value.copyWith(playerX: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res> get playerO {
    return $PlayerCopyWith<$Res>(_value.playerO, (value) {
      return _then(_value.copyWith(playerO: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GameModelCopyWith<$Res> implements $GameModelCopyWith<$Res> {
  factory _$$_GameModelCopyWith(
          _$_GameModel value, $Res Function(_$_GameModel) then) =
      __$$_GameModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<String>> board,
      String currentPlayer,
      bool isDraw,
      bool isPlaying,
      StatusMessage statusMessage,
      Player playerX,
      Player playerO});

  @override
  $StatusMessageCopyWith<$Res> get statusMessage;
  @override
  $PlayerCopyWith<$Res> get playerX;
  @override
  $PlayerCopyWith<$Res> get playerO;
}

/// @nodoc
class __$$_GameModelCopyWithImpl<$Res>
    extends _$GameModelCopyWithImpl<$Res, _$_GameModel>
    implements _$$_GameModelCopyWith<$Res> {
  __$$_GameModelCopyWithImpl(
      _$_GameModel _value, $Res Function(_$_GameModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = null,
    Object? currentPlayer = null,
    Object? isDraw = null,
    Object? isPlaying = null,
    Object? statusMessage = null,
    Object? playerX = null,
    Object? playerO = null,
  }) {
    return _then(_$_GameModel(
      board: null == board
          ? _value._board
          : board // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      currentPlayer: null == currentPlayer
          ? _value.currentPlayer
          : currentPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      isDraw: null == isDraw
          ? _value.isDraw
          : isDraw // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as StatusMessage,
      playerX: null == playerX
          ? _value.playerX
          : playerX // ignore: cast_nullable_to_non_nullable
              as Player,
      playerO: null == playerO
          ? _value.playerO
          : playerO // ignore: cast_nullable_to_non_nullable
              as Player,
    ));
  }
}

/// @nodoc

class _$_GameModel implements _GameModel {
  _$_GameModel(
      {required final List<List<String>> board,
      this.currentPlayer = 'X',
      this.isDraw = false,
      this.isPlaying = true,
      this.statusMessage = const StatusMessage(
          message: 'ゲーム開始',
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.normal),
      required this.playerX,
      required this.playerO})
      : _board = board;

  final List<List<String>> _board;
  @override
  List<List<String>> get board {
    if (_board is EqualUnmodifiableListView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_board);
  }

  @override
  @JsonKey()
  final String currentPlayer;
  @override
  @JsonKey()
  final bool isDraw;
  @override
  @JsonKey()
  final bool isPlaying;
  @override
  @JsonKey()
  final StatusMessage statusMessage;
  @override
  final Player playerX;
  @override
  final Player playerO;

  @override
  String toString() {
    return 'GameModel(board: $board, currentPlayer: $currentPlayer, isDraw: $isDraw, isPlaying: $isPlaying, statusMessage: $statusMessage, playerX: $playerX, playerO: $playerO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameModel &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            (identical(other.currentPlayer, currentPlayer) ||
                other.currentPlayer == currentPlayer) &&
            (identical(other.isDraw, isDraw) || other.isDraw == isDraw) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.playerX, playerX) || other.playerX == playerX) &&
            (identical(other.playerO, playerO) || other.playerO == playerO));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_board),
      currentPlayer,
      isDraw,
      isPlaying,
      statusMessage,
      playerX,
      playerO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameModelCopyWith<_$_GameModel> get copyWith =>
      __$$_GameModelCopyWithImpl<_$_GameModel>(this, _$identity);
}

abstract class _GameModel implements GameModel {
  factory _GameModel(
      {required final List<List<String>> board,
      final String currentPlayer,
      final bool isDraw,
      final bool isPlaying,
      final StatusMessage statusMessage,
      required final Player playerX,
      required final Player playerO}) = _$_GameModel;

  @override
  List<List<String>> get board;
  @override
  String get currentPlayer;
  @override
  bool get isDraw;
  @override
  bool get isPlaying;
  @override
  StatusMessage get statusMessage;
  @override
  Player get playerX;
  @override
  Player get playerO;
  @override
  @JsonKey(ignore: true)
  _$$_GameModelCopyWith<_$_GameModel> get copyWith =>
      throw _privateConstructorUsedError;
}
