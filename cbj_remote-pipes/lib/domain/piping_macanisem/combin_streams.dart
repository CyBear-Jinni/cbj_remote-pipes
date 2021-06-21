import 'dart:async';

import 'package:cbj_remote_pipes/infrastructure/smart_device_server_and_client/protoc_as_dart/smart_connection.pb.dart';

class PipItDown {
  static StreamController<RequestsAndStatusFromHub> hubStreamController =
      StreamController<RequestsAndStatusFromHub>();

  static StreamController<ClientStatusRequests> clientStreamController =
      StreamController<ClientStatusRequests>();

  static void addHubStreamController(Stream<RequestsAndStatusFromHub> stream) {
    hubStreamController.addStream(stream);
  }

  static void addClientStream(Stream<ClientStatusRequests> stream) {
    clientStreamController.addStream(stream);
  }
}
