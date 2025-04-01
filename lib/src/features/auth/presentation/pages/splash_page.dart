import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:school/src/config/theme/app_colors.dart';
import 'package:school/src/core/router/app_routes.dart';
import 'package:school/src/core/services/services.dart';
import 'package:school/src/core/util/app_constants.dart';
import 'package:school/src/core/util/enams.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2),() async {
      final String token = await Prefs.getString(AppConstants.kRefreshToken) ?? "";
      final String role = await Prefs.getString(AppConstants.kRole) ?? "";
      debugPrint(token);
      context.goNamed(AppRoutes.login.name);
      if (token.isNotEmpty) {
        if(role==Roles.student.val){
          context.goNamed(AppRoutes.mainStudent.name);
        }else{
          context.goNamed(AppRoutes.mainTeacher.name);
        }
      } else {
        context.goNamed(AppRoutes.language.name);
      }
    });
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/img_logo.png',height: 160,fit: BoxFit.contain,),
            ).animate().scale(duration: 1.seconds),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'LUMOS MIND',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: Colors.white),
              )
            ),
          ],
        ),
      )
    );
  }
}
