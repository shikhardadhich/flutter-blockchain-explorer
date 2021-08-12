import 'package:flutter/cupertino.dart';

class CenteredView extends StatelessWidget {
  const CenteredView({Key? key, this.child}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 60),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }
}
