import 'package:coursework/application/common/datasource.dart';
import 'package:coursework/application/dtos/db_info_dto.dart';

class NetworkDatasource extends Datasource {

  @override
  Future<DbInfoDto> getDbInfo() async {
    return dioClient.get<DbInfoDto>('users/getdbinfo', DbInfoDto.fromJson);
  }
}
