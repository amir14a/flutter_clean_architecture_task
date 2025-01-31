import 'package:flutter_clean_architecture_task/common/config/app_environment.dart';

const CURRENT_ENVIRONMENT = AppEnvironment.development;

const DEVELOPMENT_BASE_URL = '-'; //eg: https://192.168.1.15:8080
const STAGING_BASE_URL = '-'; //eg: https://test.domain.com
const PRODUCTION_BASE_URL = '-'; //eg: https://domain.com

String get APP_BASE_URL {
  return switch (CURRENT_ENVIRONMENT) {
    AppEnvironment.development => DEVELOPMENT_BASE_URL,
    AppEnvironment.staging => STAGING_BASE_URL,
    AppEnvironment.production => PRODUCTION_BASE_URL,
  };
}

const USE_REMOTE_DATA_SOURCE = false;
const FAKE_DELAY_DURATION = Duration(milliseconds: 1500);
