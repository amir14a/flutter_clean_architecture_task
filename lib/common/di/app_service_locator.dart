import 'package:dio/dio.dart';
import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter_clean_architecture_task/common/config/app_configs.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/data_source/local/user_encrypt_shared_preferences_data_source.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/data_source/remote/user_dio_remote_data_source.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/data/repository_impl/user_repository_impl.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/use_case/get_user_details_use_case.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/use_case/submit_user_phone_use_case.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/presentation/cubit/user_details_page_cubit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

provideDependencies() async {
  //provide encryptedSharedPreferencesAsync
  await EncryptedSharedPreferencesAsync.initialize(dotenv.get('SHARED_PREFERENCES_KEY'));
  getIt.registerSingleton(EncryptedSharedPreferencesAsync.getInstance());

  //provide local data source
  getIt.registerSingleton(UserEncryptSharedPreferencesDataSource(getIt()));

  //provide dio
  var dio = Dio();
  dio.options.headers.addAll({"Content-type": "application/json"});
  getIt.registerSingleton(dio);

  //provide remote data source
  getIt.registerSingleton(UserDioRemoteDataSource(getIt()));

  //provide repository
  getIt.registerSingleton(UserRepositoryImpl(
    remoteDataSource: getIt<UserDioRemoteDataSource>(),
    localDataSource: getIt<UserEncryptSharedPreferencesDataSource>(),
    useRemote: USE_REMOTE_DATA_SOURCE,
  ));

  //provide use cases
  getIt.registerSingleton(GetUserDetailsUseCase(getIt<UserRepositoryImpl>()));
  getIt.registerSingleton(SubmitUserPhoneUseCase(getIt<UserRepositoryImpl>()));

  //provide user details page cubit
  getIt.registerFactory(
      () => UserDetailsPageCubit(getUserDetailsUseCase: getIt(), submitUserPhoneUseCase: getIt()));
}
