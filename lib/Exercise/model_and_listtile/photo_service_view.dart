import 'package:flutter/material.dart';
import 'package:flutter_learning/Exercise/model_and_listtile/main_api_service.dart';
import 'package:flutter_learning/Exercise/model_and_listtile/photos_model.dart';

class PhotoServiceView extends StatefulWidget {
  const PhotoServiceView({super.key});

  @override
  State<PhotoServiceView> createState() => _PhotoServiceViewState();
}

class _PhotoServiceViewState extends State<PhotoServiceView> {
  late final IPhotoApiService photoService;
  List<Photos>? data;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    photoService = PhotoApiService();
    getModel();
  }

  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> getModel() async {
    _changeLoading();
    data = await photoService.getPhotoItems();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    final double widthSize = (MediaQuery.of(context).size.width - 20) / 2;
    return Scaffold(
      appBar: AppBar(),
      body: data != null
          ? Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: SizedBox(
                height: 300,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: widthSize,
                            height: MediaQuery.of(context).size.height / 2,
                            child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Padding(
                                        padding: EdgeInsets.only(top: widthSize / 10),
                                        child: Image.network(
                                          data?[index].thumbnailUrl ?? '',
                                          //fit: BoxFit.none,
                                          alignment: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 13, right: 13),
                                      child: ListTile(
                                        title: const Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            'FİLMLER',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        subtitle: Text(
                                          data?[index].title ?? '',
                                          textAlign: TextAlign.justify,
                                          maxLines: 3,
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          );
                        },
                        itemCount: 10,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Placeholder(),
    );
  }
}
