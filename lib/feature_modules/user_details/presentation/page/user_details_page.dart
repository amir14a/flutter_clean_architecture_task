import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_task/common/config/app_configs.dart';
import 'package:flutter_clean_architecture_task/common/strings/app_strings_en.dart';
import 'package:flutter_clean_architecture_task/common/styles/colors.dart';
import 'package:flutter_clean_architecture_task/common/styles/text_styles.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/presentation/cubit/user_details_page_cubit.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/presentation/cubit/user_details_page_state.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/presentation/widget/app_primary_button.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/presentation/widget/app_text_box.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/presentation/widget/input_shimmer.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: BlocBuilder<UserDetailsPageCubit, UserDetailsPageState>(
        builder: (BuildContext context, UserDetailsPageState state) {
          if (state is UserDetailsLoaded && state.baseClass && state.userEntity.phone?.isNotEmpty == true) {
            context.read<UserDetailsPageCubit>().phoneTextController.text = state.userEntity.phone!;
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5),
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.person,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: BACKGROUND_COLOR,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32),
                      topLeft: Radius.circular(32),
                    ),
                  ),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<UserDetailsPageCubit>().fetchUserDetails();
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text(USER_DETAILS, style: TEXT_STYLE_TITLE)],
                          ),
                          const SizedBox(height: 4),
                          const Divider(indent: 16, endIndent: 16),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                YOUR_NAME,
                                style: TEXT_STYLE_SUB_TITLE,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                            child: AnimatedSwitcher(
                              duration: APP_ANIMATION_DURATION,
                              child: state is UserDetailsLoading
                                  ? const InputShimmer()
                                  : state is UserDetailsLoaded
                                      ? AppTextBox(text: state.userEntity.name)
                                      : state is UserDetailsFailedToLoad
                                          ? const AppTextBox(text: ERROR_LOADING_USER, key: Key('errorTextBox'))
                                          : const SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                YOUR_EMAIL,
                                style: TEXT_STYLE_SUB_TITLE,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                            child: AnimatedSwitcher(
                              duration: APP_ANIMATION_DURATION,
                              child: state is UserDetailsLoading
                                  ? const InputShimmer()
                                  : state is UserDetailsLoaded
                                      ? AppTextBox(text: state.userEntity.email)
                                      : state is UserDetailsFailedToLoad
                                          ? const AppTextBox(text: ERROR_LOADING_USER, key: Key('errorTextBox'))
                                          : const SizedBox(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                YOUR_PHONE,
                                style: TEXT_STYLE_SUB_TITLE,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                            child: state is UserDetailsLoading
                                ? const InputShimmer()
                                : TextField(
                                    controller: context.read<UserDetailsPageCubit>().phoneTextController,
                                    decoration: InputDecoration(
                                      hintText: PHONE_HINT,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16),
                                          borderSide: const BorderSide(color: PRIMARY_COLOR, width: 2)),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintStyle: TEXT_STYLE_HINT,
                                    ),
                                    keyboardType: TextInputType.phone,
                                  ),
                          ),
                          AnimatedSize(
                            duration: APP_ANIMATION_DURATION * .5,
                            child:
                                (state is UserPhoneSubmitted && state.message != null && state.message!.isNotEmpty)
                                    ? SizedBox(
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                                          child: Text(state.message!,
                                              textAlign: TextAlign.center, style: TEXT_STYLE_SUCCESS),
                                        ),
                                      )
                                    : (state is UserDetailsFailedToLoad &&
                                            state.message != null &&
                                            state.message!.isNotEmpty)
                                        ? SizedBox(
                                            width: double.infinity,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                                              child: Text(state.message!,
                                                  textAlign: TextAlign.center, style: TEXT_STYLE_FAILED),
                                            ),
                                          )
                                        : (state is UserPhoneFailedToSubmit &&
                                                state.message != null &&
                                                state.message!.isNotEmpty)
                                            ? SizedBox(
                                                width: double.infinity,
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                                                  child: Text(state.message!,
                                                      textAlign: TextAlign.center, style: TEXT_STYLE_FAILED),
                                                ),
                                              )
                                            : const SizedBox(),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                              child: AppPrimaryButton(
                                text: SUBMIT,
                                onTap: () {
                                  context.read<UserDetailsPageCubit>().submitUserPhone();
                                },
                                disabled: !(state is UserPhoneSubmitted || state is UserDetailsLoaded),
                                isLoading: state is UserPhoneSubmitting,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
