import 'package:flutter/material.dart';
import 'package:cgi_task_v1/splash/widgets/ct_logo.dart';
import 'package:cgi_task_v1/splash/widgets/get_started_button.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: GetStartedButton(),
        body: CGITaskLogo(),
      ),
    );
  }
}
