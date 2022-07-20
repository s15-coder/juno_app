import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:juno_app/config/config.dart';
import 'package:juno_app/widgets/header_profile.dart';
import 'package:juno_app/widgets/styles/inputs.dart';
import 'package:juno_app/widgets/title_profile.dart';
import 'package:juno_app/theme/custom_color_scheme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = "ProfilePage";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          const HeaderProfile(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TitleProfile(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SocialMediaItem(iconData: FontAwesomeIcons.slack),
                  SpaceSocialMedia(),
                  SocialMediaItem(iconData: FontAwesomeIcons.github),
                  SpaceSocialMedia(),
                  SocialMediaItem(iconData: FontAwesomeIcons.whatsapp),
                  SpaceSocialMedia(),
                  SocialMediaItem(iconData: FontAwesomeIcons.linkedinIn),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * .1, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      textAlign: TextAlign.start,
                      style: Inputs.title().copyWith(
                          color: Theme.of(context).colorScheme.oppositeColor),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.oppositeColor),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

class SpaceSocialMedia extends StatelessWidget {
  const SpaceSocialMedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 8);
  }
}

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem({
    Key? key,
    required this.iconData,
  }) : super(key: key);
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 27,
      child: Icon(
        iconData,
        color: Colors.white,
        size: 30,
      ),
      backgroundColor: blueJuno,
    );
  }
}
