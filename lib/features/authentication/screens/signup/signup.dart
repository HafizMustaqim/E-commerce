import 'package:e_commerce/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce/common/widgets/login_signup/social_buttons.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ConstantSizes.defaultSpace), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(ConstantTexts.signUpTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: ConstantSizes.spaceBetweenSections),

              //Form
              const SignUpForm(),
              const SizedBox(height: ConstantSizes.spaceBetweenSections),

              //Divider
              FormDivider(dividerText: ConstantTexts.orSignInWith.capitalize!),
              const SizedBox(height: ConstantSizes.spaceBetweenSections),

              //Footer
              const SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}