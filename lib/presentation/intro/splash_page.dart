import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/colors.dart';
import '../../core/router/app_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => context.goNamed(
        RouteConstants.root,
        pathParameters: PathParameters().toMap(),
      ),
    );

   return Scaffold(
      backgroundColor: Colors.white, // Ubah sesuai kebutuhan Anda
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            Image.asset(
              'assets/icons/logo.jpg', // Ubah dengan path gambar Anda
              width: 71, // Ubah sesuai kebutuhan Anda
            ),
            SizedBox(height: 20),
            // Text
            Text(
              'LUXESHOP',
              style: TextStyle(
                color: AppColors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Your additional text or widgets can be added here
          ],
        ),
      ),
    );
  }
}