import 'package:effective_test/data/repositories/local_repo.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalRepository extends LocalRepo {
  static final LocalRepository _instance = LocalRepository._();
  factory LocalRepository() => _instance;
  LocalRepository._();

  static Future<void> init() async {
    final appDocsDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocsDir.path);
  }

  @override
  Future<String> getLastCountryFrom() async {
    final hiveBox = await Hive.openBox<String>('countries');
    return hiveBox.get('last_country_from') ?? '';
  }

  @override
  Future<void> setLastCountryFrom(String value) async {
    final hiveBox = await Hive.openBox<String>('countries');
    await hiveBox.put('last_country_from', value);
  }
}
