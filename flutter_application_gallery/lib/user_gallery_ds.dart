import 'package:photo_manager/photo_manager.dart';

class UserGalleryDataSource {
  static Future<List<AssetEntity>> loadUserGallery(int page, int size) async {
    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList();

    AssetPathEntity path = paths[0];

    final List<AssetEntity> entities = await path.getAssetListPaged(page: page, size: size);

    return entities;
  }
}
