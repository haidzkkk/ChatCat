import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum buttonColor{
  primary,
  success,
  warning,
  danger
}

enum titleColor{
  light,
  dark
}

class ButtonContain extends StatelessWidget {
  final String? title;
  final Color? buttonColors;
  final Color? titleColors;
  final Function? onPressed;

  // ignore: sort_constructors_first
  const ButtonContain({
    Key? key,
    this.title = 'Login',
    this.buttonColors,
    this.titleColors,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: ()=>onPressed!,
      child: Text(
        title!,
        overflow: TextOverflow.ellipsis,
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              color: titleColors,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
      ),
    );
  }
}
