import 'package:flutter/material.dart';
import 'package:juno_app/pages/home_page.dart';

Map<String, Widget Function(BuildContext)> routes() => {
      HomePage.routeName: (_) => const HomePage(),
    };
