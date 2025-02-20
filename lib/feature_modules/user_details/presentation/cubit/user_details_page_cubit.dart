import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_task/common/config/app_configs.dart';
import 'package:flutter_clean_architecture_task/common/exception/empty_input_exception.dart';
import 'package:flutter_clean_architecture_task/common/strings/app_strings_en.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/exception/invalid_iranian_phone_exception.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/use_case/get_user_details_use_case.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/domain/use_case/submit_user_phone_use_case.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/presentation/cubit/user_details_page_state.dart';

class UserDetailsPageCubit extends Cubit<UserDetailsPageState> {
  final GetUserDetailsUseCase getUserDetailsUseCase;
  final SubmitUserPhoneUseCase submitUserPhoneUseCase;
  final phoneTextController = TextEditingController();

  UserDetailsPageCubit({
    required this.getUserDetailsUseCase,
    required this.submitUserPhoneUseCase,
  }) : super(UserDetailsInitialState());

  fetchUserDetails() async {
    emit(UserDetailsLoading());
    // Performing fake delay to show loading animation in ui
    await Future.delayed(FAKE_DELAY_DURATION);
    try {
      var user = await getUserDetailsUseCase.execute();
      emit(UserDetailsLoaded(user));
    }
    //We can handle network exceptions here
    on Exception {
      emit(UserDetailsFailedToLoad(message: FAILED_TO_LOAD_DATA));
    }
  }

  submitUserPhone() async {
    if (state is UserDetailsLoaded) {
      var userPhone = phoneTextController.text;
      var userEntity = (state as UserDetailsLoaded).userEntity;
      emit(UserPhoneSubmitting(userEntity));
      try {
        //We can also check some validation scenarios in presentation layer
        if (userPhone.isEmpty) {
          throw EmptyInputException(message: USER_INPUT_IS_EMPTY);
        }
        // Performing fake delay to show loading animation in ui
        await Future.delayed(FAKE_DELAY_DURATION);
        var result = await submitUserPhoneUseCase.execute(userPhone: userPhone);
        if (result) {
          emit(UserPhoneSubmitted(userEntity, message: USER_PHONE_SUBMITTED_SUCCESSFULLY, phone: userPhone));
        }
      } on InvalidIranianPhoneException {
        emit(UserPhoneFailedToSubmit(userEntity, message: USER_PHONE_MUST_BE_IRANIAN_PHONE, phone: userPhone));
      } on EmptyInputException catch (e) {
        emit(UserPhoneFailedToSubmit(userEntity, message: e.message, phone: userPhone));
      } on Exception {
        emit(UserPhoneFailedToSubmit(userEntity, message: FAILED_TO_SUBMIT_PHONE_NUMBER, phone: userPhone));
      }
    }
  }
}
