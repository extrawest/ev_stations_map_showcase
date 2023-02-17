import 'package:flutter/material.dart';

class PopupContent extends StatefulWidget {
  final Widget? content;

  const PopupContent({
    Key? key,
    this.content,
  }) : super(key: key);

  @override
  PopupContentState createState() => PopupContentState();
}

class PopupContentState extends State<PopupContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: widget.content);
  }
}
