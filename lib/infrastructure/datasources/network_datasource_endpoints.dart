enum NetworkDatasourceEndpoints {
  dbInfo,
  search,
  idioms,
  phrases,
  gerunds,
  generals,
}

extension NetworkDatasourceEndpointsExtension on NetworkDatasourceEndpoints {
  String get path => switch (this) {
    NetworkDatasourceEndpoints.dbInfo => 'users/getdbinfo',
    NetworkDatasourceEndpoints.search => 'words/getfor',
    NetworkDatasourceEndpoints.idioms => 'words/getidiomsfor',
    NetworkDatasourceEndpoints.phrases => 'words/getphrasesfor',
    NetworkDatasourceEndpoints.gerunds => 'words/getgerundsfor',
    NetworkDatasourceEndpoints.generals => 'words/getgeneralsfor',
  };
}