import 'package:flutter/material.dart';
import 'package:juno_app/widgets/styles/inputs.dart';
import 'package:juno_app/theme/custom_color_scheme.dart';

class TitleProfile extends StatelessWidget {
  const TitleProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height * .395,
          width: size.width,
        ),
        Text(
          'Juno Company',
          style: Inputs.title()
              .copyWith(color: Theme.of(context).colorScheme.oppositeColor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        const Text(
          'Financial Services',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
