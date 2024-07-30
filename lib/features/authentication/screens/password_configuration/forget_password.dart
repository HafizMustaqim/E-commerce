import 'package:e_commerce/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(ConstantSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //Headings
            Text(ConstantTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: ConstantSizes.spaceBetweenItems),
            Text(ConstantTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: ConstantSizes.spaceBetweenSections * 2),

            //Text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: Validator.validateEmail,
                decoration: const InputDecoration(labelText: ConstantTexts.email, prefixIcon: Icon(Iconsax.direct)),
              ),
            ),
            const SizedBox(height: ConstantSizes.spaceBetweenSections),

            //Submit Button
            SizedBox(
              width: double.infinity, 
              child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(), child: const Text('Submit')),
            ),
          ],
        ),
      )
    );
  }
}