import 'dart:async';

import 'package:cbj_remote_pipes/domain/piping_macanisem/combin_streams.dart';
import 'package:cbj_remote_pipes/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:grpc/grpc.dart';

/// This class get what to execute straight from the grpc request,
class SmartServerU extends CbjHubServiceBase {
  static const DeviceStateGRPC _deviceState = DeviceStateGRPC.waitingInComp;

  @override
  Stream<RequestsAndStatusFromHub> clientTransferDevices(
      ServiceCall call, Stream<ClientStatusRequests> request) async* {
    print('RegisterClient have been called');

    PipItDown.clientsGroup.add(request);

    yield* PipItDown.hubsGroup.stream;
  }

  @override
  Stream<ClientStatusRequests> hubTransferDevices(
      ServiceCall call, Stream<RequestsAndStatusFromHub> request) async* {
    print('RegisterHub have been called');

    PipItDown.hubsGroup.add(request);
    yield* PipItDown.clientsGroup.stream;
  }

  ///  Listening to port and deciding what to do with the response
  void waitForConnection() {
    print('Wait for connection');

    final SmartServerU smartServer = SmartServerU();
    smartServer.startListen(); // Will go throw the model with the
    // grpc logic and converter to objects
  }

  ///  Listening in the background to incoming connections
  Future<void> startListen() async {
    await startLocalServer();
  }

  Future startLocalServer() async {
    final server = Server([SmartServerU()]);
    await server.serve(port: 50051);
    print('Server listening on port ${server.port}...');
  }
}
