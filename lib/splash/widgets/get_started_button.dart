import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cgi_task_v1/routes/app_routes_const.dart';
import 'package:cgi_task_v1/shared/utils/styles/font_styles.dart';
import 'package:cgi_task_v1/shared/widgets/button/ct_elevated_button.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: CGITaskElevatedButton(
        text: 'Get Started'.toUpperCase(),
        buttonStyle: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        buttonTextStyle: CGITaskFonts.buttonRegularFonts15,
        onPressed: () => context.push(AppRoutes.home),
      ),
    );
  }
}
