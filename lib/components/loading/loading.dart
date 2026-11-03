import 'package:flutter/material.dart';

import '../../resources/gen/colors.gen.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
    required this.visible,
  });

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        child: const IgnorePointer(
          ignoring: true,
          child: Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(ColorName.blue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
