import 'package:cbj_remote_pipes/domain/hube_server/smart_server_u.dart';

class SetupPipes {
  Future<void> main() async {
    SmartServerU smartServerU = SmartServerU();
    smartServerU.startLocalServer();

    // SmartClient smartClient = SmartClient();
    // smartClient.createStreamWithHub('192.168.31.154');
  }
}
