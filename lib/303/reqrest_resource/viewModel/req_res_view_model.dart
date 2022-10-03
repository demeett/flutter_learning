import 'package:flutter_learning/200/cache/shared_learn_cache.dart';
import 'package:flutter_learning/303/reqrest_resource/model/resource_model.dart';
import 'package:flutter_learning/303/reqrest_resource/service/reqrest_service.dart';
import 'package:flutter_learning/product/service/project_dio.dart';

import '../view/reqres_view.dart';

//Bu kısmı eğer view classlarında extend etmek istiyorsak türünü abstract class yazmak zorundayız .
abstract class ReqresViewModel extends LoadingStateFull<ReqresView> with ProjectDioMixin {
  late final IReqresService reqresService;
  List<Data> resource = [];
  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(service);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resource = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }

  
}
