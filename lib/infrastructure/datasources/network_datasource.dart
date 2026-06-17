import 'package:coursework/application/common/datasource.dart';
import 'package:coursework/application/dtos/db_info_dto.dart';

class NetworkDatasource extends Datasource {

  @override
  Future<DbInfoDto> getDbInfo() async {
    final response = await dioClient.getList<DbInfoDto>('/users/getdbinfo', DbInfoDto.fromJson);
    return DbInfoDto.fromJson(response as Map<String, dynamic>);
  }
}
