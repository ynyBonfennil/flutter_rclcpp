import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';

import 'flutter_rclcpp_bindings_generated.dart';

void create_node() => _bindings.create_node();
void spin_some() => _bindings.spin_some();
void register_subscription_callback(MessageCallback) =>
    _bindings.register_subscription_callback(MessageCallback);

const String _libName = 'flutter_rclcpp';

/// The dynamic library in which the symbols for [FlutterRclcppBindings] can be found.
final DynamicLibrary _dylib = () {
  if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.open('$_libName.framework/$_libName');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('lib$_libName.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open('$_libName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// The bindings to the native functions in [_dylib].
final FlutterRclcppBindings _bindings = FlutterRclcppBindings(_dylib);
