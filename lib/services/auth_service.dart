import 'package:riverpod101/models/user_profile.dart';
import 'package:riverpod101/utils/consts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';

part 'auth_service.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  Future<UserProfile?> build() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? email = prefs.getString('email');

    if (email != null) {
      return users.firstWhereOrNull(
        (UserProfile u) => u.email == email,
      );
    }

    return null;
  }

  Future<void> login(String user, String pass) async {
    final UserProfile? userProfile = users.firstWhereOrNull(
      (UserProfile u) => u.name == user,
    );

    if (userProfile != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('email', userProfile.email);
    }

    ref.invalidateSelf();

    // await future;
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('email');

    ref.invalidateSelf();
  }
}
