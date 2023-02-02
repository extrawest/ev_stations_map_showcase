import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PopupLayout extends ModalRoute {
  double? top;
  double? bottom;
  double? left;
  double? right;
  Color? bgColor;
  final Widget child;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => bgColor ?? Colors.black.withOpacity(0.5);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => false;

  PopupLayout(
      {Key? key, this.bgColor, required this.child, this.top, this.bottom, this.left, this.right});

  @override
  Widget buildPage(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    top ??= 10;
    bottom ??= 20;
    left ??= 20;
    right ??= 20;

    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Material(
        type: MaterialType.transparency,
        child: SafeArea(
          bottom: true,
          child: _buildOverlayContent(context),
        ),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: bottom!, left: left!, right: right!, top: top!),
      child: child,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
