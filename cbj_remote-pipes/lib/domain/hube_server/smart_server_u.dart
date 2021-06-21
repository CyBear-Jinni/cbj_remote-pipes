import 'dart:async';

import 'package:cbj_remote_pipes/domain/piping_macanisem/combin_streams.dart';
import 'package:cbj_remote_pipes/infrastructure/smart_device_server_and_client/protoc_as_dart/smart_connection.pbgrpc.dart';
import 'package:grpc/grpc.dart';

/// This class get what to execute straight from the grpc request,
class SmartServerU extends SmartServerServiceBase {
  static const DeviceStateGRPC _deviceState = DeviceStateGRPC.waitingInComp;

  @override
  Stream<RequestsAndStatusFromHub> registerClient(
      ServiceCall call, Stream<ClientStatusRequests> request) async* {
    print('RegisterClient have been called');

    PipItDown.addClientStream(request);
    yield* PipItDown.hubStream;
  }

  @override
  Stream<ClientStatusRequests> registerHub(
      ServiceCall call, Stream<RequestsAndStatusFromHub> request) async* {
    print('RegisterHub have been called');

    PipItDown.addHubStreamController(request);
    yield* PipItDown.clientStream;
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

  @override
  Future<CompInfo> getCompInfo(ServiceCall call, CommendStatus request) async {
    return CompInfo();
  }

  //  Return the status of the specified device
  @override
  Future<SmartDeviceStatus> getStatus(
      ServiceCall call, SmartDeviceInfo request) async {
    return SmartDeviceStatus();
  }

  @override
  Future<CommendStatus> updateDeviceName(
      ServiceCall call, SmartDeviceUpdateDetails request) async {
    return CommendStatus();
  }

  @override
  Future<CommendStatus> setOffDevice(
      ServiceCall call, SmartDeviceInfo request) async {
    return CommendStatus();
  }

  @override
  Future<CommendStatus> setOnDevice(
      ServiceCall call, SmartDeviceInfo request) async {
    return CommendStatus();
  }

  @override
  Future<CommendStatus> setBlindsUp(
      ServiceCall call, SmartDeviceInfo request) async {
    return CommendStatus();
  }

  @override
  Future<CommendStatus> setBlindsDown(
      ServiceCall call, SmartDeviceInfo request) async {
    return CommendStatus();
  }

  @override
  Future<CommendStatus> setBlindsStop(
      ServiceCall call, SmartDeviceInfo request) async {
    return CommendStatus();
  }

  @override
  Future<CommendStatus> setFirebaseAccountInformation(
      ServiceCall call, FirebaseAccountInformation request) async {
    return CommendStatus();
  }

  @override
  Future<CommendStatus> setCompInfo(ServiceCall call, CompInfo request) async {
    return CommendStatus();
  }

  @override
  Future<CommendStatus> firstSetup(
      ServiceCall call, FirstSetupMessage request) async {
    return CommendStatus();
  }
}
