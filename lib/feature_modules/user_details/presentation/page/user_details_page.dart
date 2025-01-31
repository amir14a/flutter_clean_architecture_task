import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_task/common/strings/app_strings_en.dart';
import 'package:flutter_clean_architecture_task/common/styles/colors.dart';
import 'package:flutter_clean_architecture_task/common/styles/text_styles.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/presentation/widget/app_primary_button.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/presentation/widget/app_text_box.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 48),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
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
              decoration: BoxDecoration(
                color: BACKGROUND_COLOR,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(USER_DETAILS, style: TEXT_STYLE_TITLE)],
                  ),
                  const SizedBox(height: 4),
                  Divider(indent: 16, endIndent: 16),
                  Padding(
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
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: AppTextBox(text: 'Amir'),
                  ),
                  const SizedBox(height: 16),
                  Padding(
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
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: AppTextBox(text: 'a@a.com'),
                  ),
                  const SizedBox(height: 16),
                  Padding(
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
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: PHONE_HINT,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: PRIMARY_COLOR, width: 2)),
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TEXT_STYLE_HINT),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                      child: AppPrimaryButton(text: SUBMIT, onTap: () {})),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
