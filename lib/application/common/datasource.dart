import 'package:coursework/core/dio_client.dart';
import 'package:coursework/application/dtos/db_info_dto.dart';

abstract class Datasource {
  final DioClient dioClient = DioClient();

  Future<DbInfoDto> getDbInfo();
}
