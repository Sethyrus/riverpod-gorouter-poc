import 'package:flutter_kit/utils/debugger.dart';
import 'package:riverpod101/models/user_profile.dart';
import 'package:riverpod101/utils/consts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  /// Lista de usuarios registrados en la aplicación
  /// El build hace una primera carga de la información del usuario logeado
  /// y cachea el resultado para futuras consultas. Si se invalida el provider
  /// se vuelve a ejecutar este método.
  @override
  Future<UserProfile> build() async {
    Debugger.log('Auth.build()');

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? email = await Future.delayed(
      defaultDuration,
      () => prefs.getString('email'),
    );

    if (email != null) {
      final user = users.firstWhereOrNull(
        (UserProfile u) => u.email == email,
      );

      if (user != null) return user;
    }

    return UserProfile.empty;
  }

  /// Simula un inicio de sesión. Busca el usuario por email en la lista de
  /// usuarios y si existe guarda el email en las preferencias de la aplicación.
  /// Al finalizar la operación, invalida el provider para que se vuelva a
  /// ejecutar el build.
  Future<void> login(String user, String pass) async {
    final UserProfile userProfile = await Future.delayed(
      defaultDuration,
      () =>
          users.firstWhereOrNull(
            (UserProfile u) => u.name == user,
          ) ??
          UserProfile.empty,
    );

    if (userProfile.email.isNotEmpty) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('email', userProfile.email);
    }

    ref.invalidateSelf();

    await future;
  }

  /// Simula un cierre de sesión. Elimina el email de las preferencias de la
  /// aplicación. Al finalizar la operación, invalida el provider para que se
  /// vuelva a ejecutar el build.
  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('email');

    ref.invalidateSelf();

    await future;
  }
}
