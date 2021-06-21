import 'dart:async';

import 'package:cbj_remote_pipes/infrastructure/smart_device_server_and_client/protoc_as_dart/smart_connection.pb.dart';

class PipItDown {
  static StreamController<RequestsAndStatusFromHub> hubStreamController =
      StreamController<RequestsAndStatusFromHub>();
  static StreamController<ClientStatusRequests> clientStreamController =
      StreamController<ClientStatusRequests>();

  // static Stream<RequestsAndStatusFromHub>? hubStream;
  // static Stream<ClientStatusRequests>? clientStream;

  static void addHubStreamController(Stream<RequestsAndStatusFromHub> stream) {
    hubStreamController.addStream(stream);
  }

  static void addClientStream(Stream<ClientStatusRequests> stream) {
    clientStreamController.addStream(stream);
  }

  void connectStreams() {
    Stream streamMultipleListeners =
        hubStreamController.stream.asBroadcastStream();

    streamMultipleListeners.listen((event) {
      // clientStreamController!.add('asd');
    });
  }
}

class NumberCreator {
  NumberCreator() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      _controller.sink.add(RequestsAndStatusFromHub());
      _count++;
    });
  }

  var _count = 1;

  final _controller = StreamController<RequestsAndStatusFromHub>();

  Stream<RequestsAndStatusFromHub> get stream => _controller.stream;
}
