// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/cupertino.dart' as _i719;
import 'package:flutter/material.dart' as _i409;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:fruit_hub/core/app_data/api/api_client.dart' as _i261;
import 'package:fruit_hub/core/app_data/api/dio_client.dart' as _i280;
import 'package:fruit_hub/core/app_data/fire_base/firebase_serves.dart'
    as _i296;
import 'package:fruit_hub/core/app_data/local_storage/local_storage_client.dart'
    as _i239;
import 'package:fruit_hub/core/di/modules.dart' as _i859;
import 'package:fruit_hub/core/error_handling/dio_error_handler.dart' as _i938;
import 'package:fruit_hub/core/routes/navigator_observer.dart' as _i320;
import 'package:fruit_hub/core/widget/dialog_utils.dart' as _i849;
import 'package:fruit_hub/features/auth/data/repo/auth_repository_imp.dart'
    as _i518;
import 'package:fruit_hub/features/auth/domain/repository/auth_repository.dart'
    as _i978;
import 'package:fruit_hub/features/auth/domain/usecases/login_with_email_and_password_usecase.dart'
    as _i569;
import 'package:fruit_hub/features/auth/domain/usecases/register_with_email_and_password_usecase.dart'
    as _i167;
import 'package:fruit_hub/features/auth/presentation/cubit/login_cubit.dart'
    as _i129;
import 'package:fruit_hub/features/auth/presentation/cubit/register_cubit.dart'
    as _i291;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItRegisterModule = _$GetItRegisterModule();
    gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
      () => getItRegisterModule.navigatorKey,
    );
    gh.singleton<_i973.InternetConnectionChecker>(
      () => getItRegisterModule.checker,
    );
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => getItRegisterModule.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i558.FlutterSecureStorage>(
      () => getItRegisterModule.secureStorage,
    );
    gh.singleton<_i849.DialogUtils>(() => _i849.DialogUtils());
    gh.singleton<_i320.AppNavigatorObserver>(
      () => _i320.AppNavigatorObserver(),
    );
    gh.lazySingleton<_i296.FirebaseServes>(() => _i296.FirebaseServes());
    gh.singleton<_i239.LocalStorageClient>(
      () => _i239.LocalStorageClient(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i978.AuthRepository>(
      () => _i518.AuthRepositoryImp(gh<_i296.FirebaseServes>()),
    );
    gh.singleton<_i938.DioErrorHandler>(
      () => _i938.DioErrorHandler(
        gh<_i239.LocalStorageClient>(),
        gh<_i719.GlobalKey<_i719.NavigatorState>>(),
      ),
    );
    gh.factory<_i167.RegisterWithEmailAndPasswordUsecase>(
      () =>
          _i167.RegisterWithEmailAndPasswordUsecase(gh<_i978.AuthRepository>()),
    );
    gh.factory<_i569.LoginWithEmailAndPasswordUsecase>(
      () => _i569.LoginWithEmailAndPasswordUsecase(gh<_i978.AuthRepository>()),
    );
    gh.singleton<_i261.ApiClient>(
      () => _i280.DioApiClient(
        gh<_i239.LocalStorageClient>(),
        gh<_i938.DioErrorHandler>(),
        gh<_i719.GlobalKey<_i719.NavigatorState>>(),
      ),
    );
    gh.factory<_i129.LoginCubit>(
      () => _i129.LoginCubit(gh<_i569.LoginWithEmailAndPasswordUsecase>()),
    );
    gh.factory<_i291.RegisterCubit>(
      () =>
          _i291.RegisterCubit(gh<_i167.RegisterWithEmailAndPasswordUsecase>()),
    );
    return this;
  }
}

class _$GetItRegisterModule extends _i859.GetItRegisterModule {}
