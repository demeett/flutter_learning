import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

import 'model_unknown.dart';

void main() {
  late final INetworkManager networkManager;
  setUp(() {
    networkManager = NetworkManager(options: BaseOptions(baseUrl: "https://reqres.in/api"));
  });
  test("description", () async {
    final response = await networkManager.send<UnknownModel, List<UnknownModel>>('/unknown',
        parseModel: UnknownModel(), method: RequestType.GET);
  });
}
