import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;

  final bool loading;

  final VoidCallback? onPress;

  const AppButton({
    Key? key,
    required this.title,
    this.loading = false,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  )),
      ),
    );
  }
}
