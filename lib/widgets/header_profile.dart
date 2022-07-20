import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:juno_app/bloc/theme/theme_cubit.dart';
import 'package:juno_app/config/config.dart';
import 'package:juno_app/widgets/custom_circle_avatar.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeProvider = BlocProvider.of<ThemeCubit>(context);
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.25,
          color: blueJuno,
        ),
        Column(
          children: [
            Center(
              child: Transform.translate(
                offset: Offset(0, size.height * 0.14),
                child: CustomCircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: size.width * 0.25,
                ),
              ),
            )
          ],
        ),
        Column(
          children: [
            Center(
              child: Transform.translate(
                offset: Offset(0, size.height * 0.15),
                child: CustomCircleAvatar(
                  maxRadius: size.width * 0.24,
                  backgroundColor: Colors.white,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/juno_app.jpg',
                      )),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 35),
          width: size.width,
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: themeProvider.switchTheme,
                icon: Icon(
                  FontAwesomeIcons.moon,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
