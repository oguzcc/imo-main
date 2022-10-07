import 'package:imo/src/feature/auth/domain/user_repository.dart';

import '../../../../core/http/base_api.dart';

class UserRepositoryImpl extends UserRepository {
  final BaseApi _client;

  UserRepositoryImpl() : _client = BaseApi(path: 'user');

  @override
  Future getUser() async {
    try {
      final response = await _client.get(
        innerPath: 'me',
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
