import 'package:flutter/material.dart';
import 'package:cgi_task_v1/shared/utils/styles/font_styles.dart';
import 'package:cgi_task_v1/shared/widgets/app_bar/ct_app_bar.dart';

PreferredSizeWidget buildAppBar(BuildContext context, {Widget? addTask}) {
  return CGITaskAppBar(
    centerTitle: true,
    automaticallyImplyLeading: false,
    title: Row(
      children: <Widget>[
        Text('CGI', style: CGITaskFonts.regularRedFonts18),
        const SizedBox(width: 5),
        Text('Task Manager'.toUpperCase(),
            style: CGITaskFonts.regularGreyFonts18)
      ],
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: addTask ?? Container(),
      )
    ],
  );
}

PreferredSizeWidget buildLeadingAppBar({required String title}) {
  return CGITaskAppBar(
    centerTitle: true,
    isDefaultStyle: true,
    automaticallyImplyLeading: true,
    title: Text(title, style: CGITaskFonts.regularFonts18),
  );
}
