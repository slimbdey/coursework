import 'package:coursework/domain/db_info.dart';

abstract class DbInfoRepository {
  Future<DbInfo> getDbInfo();
}