import 'package:coursework/application/infrastructure/db_info_repository.dart';
import 'package:coursework/application/infrastructure/login_service.dart';
import 'package:coursework/application/infrastructure/queries/shuffled_notion_provider.dart';
import 'package:coursework/application/infrastructure/queries/training_set_provider.dart';
import 'package:coursework/application/infrastructure/word_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginService extends Mock implements LoginService {}

class MockWordRepository extends Mock implements WordRepository {}

class MockDbInfoRepository extends Mock implements DbInfoRepository {}

class MockShuffledNotionProvider extends Mock
    implements ShuffledNotionProvider {}

class MockTrainingSetProvider extends Mock implements TrainingSetProvider {}

class FakeUser extends Fake implements User {
  FakeUser({this.email = 'user@test.com'});

  @override
  final String? email;
}
