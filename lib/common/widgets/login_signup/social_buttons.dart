import 'package:e_commerce/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: ConstantColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: ConstantSizes.iconMd,
              height: ConstantSizes.iconMd,
              image: AssetImage(ConstantImages.google),
            ),
          ),
        ),
        const SizedBox(width: ConstantSizes.spaceBetweenItems),
        Container(
          decoration: BoxDecoration(border: Border.all(color: ConstantColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: ConstantSizes.iconMd,
              height: ConstantSizes.iconMd,
              image: AssetImage(ConstantImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}