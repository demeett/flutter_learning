import 'package:dio/dio.dart';
import 'package:flutter_learning/303/reqrest_resource/service/reqrest_service.dart';
import 'package:flutter_learning/303/reqrest_resource/viewModel/req_res_provider.dart';
import 'package:flutter_learning/303/testable/user_save_model.dart';
import 'package:flutter_learning/product/global/resource_context.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([ReqResProvider]) // test edilecek sınıfı yazıyoruz.
void main() {
  setUp(() {
    Map<String, Object> values = <String, Object>{'dd': "demet"};
    SharedPreferences.setMockInitialValues(values);
  });
  test("description", () {
    var mockProvider = ReqResProvider(ReqresService(Dio()));
    final resourceContext = ResourceContext();
    final result = mockProvider.saveToLocale(resourceContext, []);
    expect(result, false);
  });
  test("userTest", () async {
    var userViewModel = UserSaveViewModel();
    final result = await userViewModel.getReadData("dd", await SharedPreferences.getInstance());
    expect(result, true);
  });
}
