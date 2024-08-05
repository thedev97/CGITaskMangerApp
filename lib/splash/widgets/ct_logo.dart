import 'package:cgi_task_v1/shared/utils/styles/font_styles.dart';
import 'package:flutter/material.dart';

class CGITaskLogo extends StatelessWidget {
  const CGITaskLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('CGI', style: CGITaskFonts.regularRedFonts20),
                const SizedBox(width: 5),
                Text('Task Manager'.toUpperCase(),
                    style: CGITaskFonts.regularGreyFonts20)
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Manage your daily\ntasks in one workspace'.toUpperCase(),
              style: CGITaskFonts.regularFonts14,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
