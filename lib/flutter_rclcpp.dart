import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';
import 'package:ffi/ffi.dart';

import 'flutter_rclcpp_bindings_generated.dart';

void Ros2Init() => _bindings.Ros2Init();
void Ros2CreateNode(String name)
{
  Pointer<Char> name_ptr = name.toNativeUtf8().cast<Char>();
  _bindings.Ros2CreateNode(name_ptr);
  malloc.free(name_ptr);
}
void Ros2SpinSome() => _bindings.Ros2SpinSome();

void onSubscribeSub(dart_std_msgs_msg_string msg) {
  print(msg.data);
}

final onSubscribeSubPtr = Pointer.fromFunction<Void Function(dart_std_msgs_msg_string)>(onSubscribeSub);

void SubscribeSub() => _bindings.SubscribeSub(onSubscribeSubPtr);

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
