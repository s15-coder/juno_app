import 'package:flutter/material.dart';
import 'package:juno_app/pages/home_page.dart';
import 'package:juno_app/pages/profile_page.dart';

Map<String, Widget Function(BuildContext)> routes() => {
      HomePage.routeName: (_) => const HomePage(),
      ProfilePage.routeName: (_) => const ProfilePage(),
    };
