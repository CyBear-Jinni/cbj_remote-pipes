import 'package:cbj_remote_pipes/domain/hube_server/smart_server_u.dart';

class SetupPipes {
  Future<void> main() async {
    final SmartServerU smartServerU = SmartServerU();
    smartServerU.startLocalServer();
  }
}
