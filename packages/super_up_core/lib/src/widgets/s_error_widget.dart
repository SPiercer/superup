import 'package:flutter/material.dart';

class SErrorWidget extends StatelessWidget {
  final String? err;
  const SErrorWidget({
    Key? key,
    this.err,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(err ?? "Some thing went wrong try again!"),
    );
  }
}
