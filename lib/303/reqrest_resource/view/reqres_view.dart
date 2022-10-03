import 'package:flutter/material.dart';
import 'package:flutter_learning/200/image_learn_202.dart';
import 'package:flutter_learning/303/reqrest_resource/service/reqrest_service.dart';
import 'package:flutter_learning/product/extension/string_extension.dart';
import 'package:flutter_learning/product/global/resource_context.dart';
import 'package:flutter_learning/product/global/theme_notifier.dart';
import 'package:provider/provider.dart';

import '../../../product/service/project_dio.dart';
import '../model/resource_model.dart';
import '../viewModel/req_res_provider.dart';

class ReqresScreeen extends StatelessWidget with ProjectDioMixin {
  ReqresScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProvider>(create: (context) {
      return ReqResProvider(ReqresService(service)); //nesne oluşumunu burda yapıyorum .
    }, builder: (context, child) {
      return const ReqresView();
    });
  }
}

class ReqresView extends StatefulWidget {
  const ReqresView({super.key});

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

class _ReqresViewState extends State<ReqresView> with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMethod(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<ThemeNotifier>().changeTheme();
          },
          child: const Icon(Icons.abc),
        ),
        body: Column(
          children: [
            Selector<ReqResProvider, bool>(builder: (context, value, child) {
              return value ? const Placeholder() : Text(value.toString());
            }, selector: (context, provider) {
              return provider.isLoading;
            }),
            Expanded(child: _resourceMethod(context, context.watch<ReqResProvider>().resource)),
          ],
        ));
  }

  AppBar appBarMethod(BuildContext context) {
    return AppBar(
      title: context.watch<ReqResProvider>().isLoading ? const CircularProgressIndicator() : null,
      actions: [
        ElevatedButton(
            onPressed: () {
              context.read<ReqResProvider>().saveToLocale(context.read<ResourceContext>(), null);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const ImageLearn202();
                },
              ));
            },
            child: const Icon(Icons.abc_outlined))
      ],
    );
  }

  ListView _resourceMethod(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Color(items[index].color?.colorValue ?? 0),
          child: Text(items[index].name ?? ""),
        );
      },
      itemCount: items.length,
    );
  }
}
