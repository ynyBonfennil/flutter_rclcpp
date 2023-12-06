import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';
import 'package:ffi/ffi.dart';

import 'flutter_rclcpp_bindings_generated.dart';

void ros2_init() => _bindings.ros2_init();
void ros2_create_node(String name)
{
  Pointer<Char> name_ptr = name.toNativeUtf8().cast<Char>();
  _bindings.ros2_create_node(name_ptr);
  malloc.free(name_ptr);
}
void ros2_spin_some() => _bindings.ros2_spin_some();

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
