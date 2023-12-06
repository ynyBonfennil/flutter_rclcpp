// ignore_for_file: always_specify_types
// ignore_for_file: camel_case_types
// ignore_for_file: non_constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// Bindings for `src/flutter_rclcpp.h`.
///
/// Regenerate bindings with `flutter pub run ffigen --config ffigen.yaml`.
///
class FlutterRclcppBindings {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  FlutterRclcppBindings(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  FlutterRclcppBindings.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void Ros2Init() {
    return _Ros2Init();
  }

  late final _Ros2InitPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function()>>('Ros2Init');
  late final _Ros2Init = _Ros2InitPtr.asFunction<void Function()>();

  void Ros2CreateNode(
    ffi.Pointer<ffi.Char> arg0,
  ) {
    return _Ros2CreateNode(
      arg0,
    );
  }

  late final _Ros2CreateNodePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Char>)>>(
          'Ros2CreateNode');
  late final _Ros2CreateNode =
      _Ros2CreateNodePtr.asFunction<void Function(ffi.Pointer<ffi.Char>)>();

  void Ros2SpinSome() {
    return _Ros2SpinSome();
  }

  late final _Ros2SpinSomePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function()>>('Ros2SpinSome');
  late final _Ros2SpinSome = _Ros2SpinSomePtr.asFunction<void Function()>();

  void SubscribeSub(
    ffi.Pointer<ffi.NativeFunction<ffi.Void Function(dart_std_msgs_msg_string)>>
        arg0,
  ) {
    return _SubscribeSub(
      arg0,
    );
  }

  late final _SubscribeSubPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Pointer<
                  ffi.NativeFunction<
                      ffi.Void Function(
                          dart_std_msgs_msg_string)>>)>>('SubscribeSub');
  late final _SubscribeSub = _SubscribeSubPtr.asFunction<
      void Function(
          ffi.Pointer<
              ffi
              .NativeFunction<ffi.Void Function(dart_std_msgs_msg_string)>>)>();

  void UnsubscribeSub() {
    return _UnsubscribeSub();
  }

  late final _UnsubscribeSubPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function()>>('UnsubscribeSub');
  late final _UnsubscribeSub = _UnsubscribeSubPtr.asFunction<void Function()>();

  void CreatePublisherPub() {
    return _CreatePublisherPub();
  }

  late final _CreatePublisherPubPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function()>>('CreatePublisherPub');
  late final _CreatePublisherPub =
      _CreatePublisherPubPtr.asFunction<void Function()>();

  void PublishPub(
    dart_std_msgs_msg_string arg0,
  ) {
    return _PublishPub(
      arg0,
    );
  }

  late final _PublishPubPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(dart_std_msgs_msg_string)>>(
          'PublishPub');
  late final _PublishPub =
      _PublishPubPtr.asFunction<void Function(dart_std_msgs_msg_string)>();

  void RemovePublisherPub() {
    return _RemovePublisherPub();
  }

  late final _RemovePublisherPubPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function()>>('RemovePublisherPub');
  late final _RemovePublisherPub =
      _RemovePublisherPubPtr.asFunction<void Function()>();
}

final class dart_std_msgs_msg_string extends ffi.Struct {
  external ffi.Pointer<ffi.Char> data;
}
