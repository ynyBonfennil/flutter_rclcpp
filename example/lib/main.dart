import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:isolate';
import 'package:provider/provider.dart';

import 'package:flutter_rclcpp/flutter_rclcpp.dart' as flutter_rclcpp;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Isolate? newIsolate;
  late ReceivePort receivePort;

  bool running = false;
  String subscriptionMsg = "";

  Ros2IsolateController ros2IsolateController = Ros2IsolateController();

  @override
  void initState() {
    super.initState();
    ros2IsolateController.start();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return ChangeNotifierProvider(
      create: (context) => ros2IsolateController,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Native Packages'),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(subscriptionMsg),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Ros2IsolateController extends ChangeNotifier {
  Isolate? ros2Isolate;
  late ReceivePort receivePort;
  late SendPort sendPort;
  Capability? capability;

  bool _created = false;
  bool _paused = false;

  Future<void> createIsolate() async {
    receivePort = ReceivePort();
    ros2Isolate =
        await Isolate.spawn(_ros2IsolateEntryPoint, receivePort.sendPort);
  }

  Future<void> start() async {
    if (_created == false && _paused == false) {
      await createIsolate();
      _created = true;
      notifyListeners();
    }
  }

  void terminate() {
    ros2Isolate?.kill();
    _created = false;
    notifyListeners();
  }
}

Future<void> _ros2IsolateEntryPoint(SendPort ros2SP) async {
  var ros2RP = ReceivePort();
  ros2SP.send(ros2RP.sendPort);

  flutter_rclcpp.Ros2Init();
  flutter_rclcpp.Ros2CreateNode("asdf");
  flutter_rclcpp.SubscribeSub();
  Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
    flutter_rclcpp.Ros2SpinSome();
  });
}
