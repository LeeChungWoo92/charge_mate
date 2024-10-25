import 'package:charge_mate/data/repository/auth_repository.dart';
import 'package:charge_mate/presentation/login/login_view_model.dart';
import 'package:charge_mate/presentation/user_info/user_info_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final getIt = GetIt.instance;

void diSetup() {
  final googleSignIn = GoogleSignIn(scopes: ['email']);
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(googleSignIn));

  getIt.registerFactory<LoginViewModel>(() => LoginViewModel(getIt<AuthRepository>()));
  getIt.registerFactory<UserInfoViewModel>(() => UserInfoViewModel(getIt<AuthRepository>()));

}