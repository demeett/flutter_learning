import 'package:flutter_learning/404/bloc/login/model/login_model.dart';
import 'package:flutter_learning/404/bloc/login/service/login_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late ILoginService loginService;
  setUp(() {
    loginService = LoginService(NetworkManager(options: BaseOptions(baseUrl: 'https://reqres.in/')));
  });

  test("Login test", () async {
    final response = await loginService.login(LoginModel('eve.holt@reqres.in', 'cityslicka'));
    expect(response.data?.token, "QpwL5tke4Pnpja7X4");
  });
}
