import 'package:coursework/application/infrastructure/db_info_repository.dart';
import 'package:coursework/application/common/datasource.dart';
import 'package:coursework/domain/db_info.dart';

class NetworkDbInfoRepository extends DbInfoRepository {
  final Datasource datasource;

  NetworkDbInfoRepository({required this.datasource});

  @override
  Future<DbInfo> getDbInfo() async {
    final dbInfoDto = await datasource.getDbInfo();

    return DbInfo(
      gerunds: dbInfoDto.gerunds,
      idioms: dbInfoDto.idioms,
      phrasals: dbInfoDto.phrasals,
      phrases: dbInfoDto.phrases,
      words: dbInfoDto.words,
    );
  }
}
