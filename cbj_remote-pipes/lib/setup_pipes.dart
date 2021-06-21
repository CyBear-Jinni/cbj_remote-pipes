import 'package:cbj_remote_pipes/domain/app_client/smart_client.dart';

class SetupPipes {
  Future<void> main() async {
    // SmartServerU smartServerU = SmartServerU();

    SmartClient smartClient = SmartClient();
    smartClient.createStreamWithHub('192.168.31.154');
    // smartServerU.startLocalServer();
  }
}
