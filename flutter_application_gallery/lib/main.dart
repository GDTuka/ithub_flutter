import 'package:flutter/material.dart';
import 'package:flutter_application_gallery/user_gallery_ds.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:photo_manager/photo_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserGallerry(),
    );
  }
}

class UserGallerry extends StatefulWidget {
  const UserGallerry({super.key});

  @override
  State<UserGallerry> createState() => _UserGallerryState();
}

class _UserGallerryState extends State<UserGallerry> {
  int pageSize = 5;
  int page = 0;

  @override
  void initState() {
    controller.addPageRequestListener((pageKey) {
      loadPhotos();
    });

    super.initState();
  }

  PagingController<int, AssetEntity> controller = PagingController(firstPageKey: 0);

  Future<void> loadPhotos() async {
    List<AssetEntity> userPhotos = await UserGalleryDataSource.loadUserGallery(page, pageSize);

    if (userPhotos.length < pageSize) {
      controller.appendLastPage(userPhotos);
    } else {
      page++;
      controller.appendPage(userPhotos, page);
    }

    //* вот так можно вызваать боттомшит и вернуть оттуда информацию, примечательно то что информация может быть null
    AssetEntity? entity = await showModalBottomSheet<AssetEntity?>(
      context: context,
      builder: (context) {
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: PagedGridView(
          pagingController: controller,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, AssetEntity item, index) {
              return AssetEntityImage(
                item,
                fit: BoxFit.cover,
              );
            },
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
        ),
      ),
    );
  }
}
