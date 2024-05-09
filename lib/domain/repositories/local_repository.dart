import 'package:effective_test/data/repositories/local_repo.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalRepository extends LocalRepo {
  static Future<void> init() async {
    final appDocsDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocsDir.path);
    // ..registerAdapter(ProfileEntityAdapter())
    // ..registerAdapter(ProfileLocalCategoryTypeAdapter())
    // ..registerAdapter(EducationTypeAdapter())
    // ..registerAdapter(NationTypeAdapter())
    // ..registerAdapter(ModerationStatusTypeAdapter());
  }

  @override
  Future<bool> checkAuth() async {
    final hiveBox = await Hive.openBox<bool>('auth');
    final isAuth = hiveBox.get('isAuth', defaultValue: false) ?? false;
    await hiveBox.close();
    return isAuth;
  }

  @override
  Future<void> setAuth() async {
    final hiveBox = await Hive.openBox<bool>('auth');
    await hiveBox.put('isAuth', true);
    await hiveBox.close();
  }

  // @override
  // Future<List<ProfileEntity>> getFavoriteProfiles() async {
  //   final hiveBox = await Hive.openBox<ProfileEntity>('favoriteProfiles');
  //   final profiles = hiveBox.values.toList();
  //   await hiveBox.close();
  //   return profiles;
  // }

  // @override
  // Future<void> addFavoriteProfile(ProfileEntity profileEntity) async {
  //   final hiveBox = await Hive.openBox<ProfileEntity>('favoriteProfiles');
  //   await hiveBox.put(profileEntity.id, profileEntity);
  //   await hiveBox.close();
  // }

  // @override
  // Future<void> editFavoriteProfile(ProfileEntity newProfileEntity) async {
  //   final hiveBox = await Hive.openBox<ProfileEntity>('favoriteProfiles');
  //   if (hiveBox.containsKey(newProfileEntity.id)) {
  //     await hiveBox.put(newProfileEntity.id, newProfileEntity);
  //   }
  //   await hiveBox.close();
  // }

  @override
  Future<void> removeFavoriteProfile(String id) async {
    final hiveBox = await Hive.openBox('favoriteProfiles');
    await hiveBox.delete(id);
    await hiveBox.close();
  }
}
