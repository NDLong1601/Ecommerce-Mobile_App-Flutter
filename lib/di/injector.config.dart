// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_mobile_app/core/logging/app_logger.dart' as _i701;
import 'package:ecommerce_mobile_app/core/logging/console_app_logger.dart'
    as _i314;
import 'package:ecommerce_mobile_app/cubit/create_account/create_account_cubit.dart'
    as _i483;
import 'package:ecommerce_mobile_app/cubit/sign_in/sign_in_cubit.dart' as _i980;
import 'package:ecommerce_mobile_app/di/third_party_module.dart' as _i498;
import 'package:ecommerce_mobile_app/services/remote/firebase_service.dart'
    as _i527;
import 'package:ecommerce_mobile_app/services/remote/remote.dart' as _i83;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final thirdPartyModule = _$ThirdPartyModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => thirdPartyModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i558.FlutterSecureStorage>(
      () => thirdPartyModule.flutterSecureStorage,
    );
    gh.factory<_i59.FirebaseAuth>(() => thirdPartyModule.firebaseAuth);
    gh.lazySingleton<_i701.AppLogger>(() => _i314.ConsoleAppLogger());
    gh.lazySingleton<_i527.FirebaseService>(
      () => _i527.FirebaseService(gh<_i59.FirebaseAuth>()),
    );
    gh.factory<_i980.SignInCubit>(
      () => _i980.SignInCubit(gh<_i83.FirebaseService>()),
    );
    gh.factory<_i483.CreateAccountCubit>(
      () => _i483.CreateAccountCubit(gh<_i83.FirebaseService>()),
    );
    return this;
  }
}

class _$ThirdPartyModule extends _i498.ThirdPartyModule {}
