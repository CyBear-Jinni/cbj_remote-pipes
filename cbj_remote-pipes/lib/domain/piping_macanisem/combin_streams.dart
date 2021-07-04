import 'dart:async';
import 'package:cbj_remote_pipes/infrastructure/gen/cbj_hub_server/cbj_hub_server.pbgrpc.dart';


class PipItDown {
  static final StreamController<RequestsAndStatusFromHub> _hubStreamController =
      StreamController<RequestsAndStatusFromHub>();

  static final StreamController<ClientStatusRequests> _clientStreamController =
      StreamController<ClientStatusRequests>();

  static Stream<RequestsAndStatusFromHub> get hubStream =>
      _hubStreamController.stream;

  static Stream<ClientStatusRequests> get clientStream =>
      _clientStreamController.stream;

  static void addHubStreamController(Stream<RequestsAndStatusFromHub> stream) {
    _hubStreamController.addStream(stream);
  }

  static void addClientStream(Stream<ClientStatusRequests> stream) {
    _clientStreamController.addStream(stream);
  }
}
