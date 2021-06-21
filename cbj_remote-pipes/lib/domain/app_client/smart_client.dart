import 'dart:async';

import 'package:cbj_remote_pipes/infrastructure/smart_device_server_and_client/protoc_as_dart/smart_connection.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class SmartClient {
  static ClientChannel? channel;
  static SmartServerClient? stub;

  ///  Turn smart device on
  Future<void> createStreamWithHub(String addressToHub) async {
    channel = await createSmartServerClient(addressToHub);
    stub = SmartServerClient(channel!);
    ResponseStream<RequestsAndStatusFromHub> response;
    Stream<ClientStatusRequests> streamClientStatusRequests =
        Stream.value(ClientStatusRequests());
    try {
      response = stub!.registerClient(streamClientStatusRequests);
      response.listen((value) {
        print('Greeter client received: $value');
      });
      // await channel!.shutdown();
      // return response.success.toString();
    } catch (e) {
      print('Caught error: $e');
    }
    // await channel!.shutdown();
    // throw 'Error';
  }

  ///  Turn smart device on
  Future<void> createStreamWithClient(String addressToHub) async {
    channel = await createSmartServerClient(addressToHub);
    stub = SmartServerClient(channel!);
    ResponseStream<RequestsAndStatusFromClient> response;
    Stream<HubStatusAndRequests> streamClientStatusRequests =
        Stream.value(HubStatusAndRequests());
    try {
      response = stub!.registerHub(streamClientStatusRequests);
      response.listen((value) {
        print('Greeter client received: $value');
      });
      // await channel!.shutdown();
      // return response.success.toString();
    } catch (e) {
      print('Caught error: $e');
    }
    // await channel!.shutdown();
    // throw 'Error';
  }

  static Future<ClientChannel> createSmartServerClient(String deviceIp) async {
    await channel?.shutdown();
    return ClientChannel(deviceIp,
        port: 50051,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));
  }
}
