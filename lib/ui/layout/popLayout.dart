import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future showPopLayout(BuildContext context, Widget widget, String title) {
  return Navigator.push(
    context,
    PopupLayout(
      top: MediaQuery.of(context).size.height * 0.300,
      left: 0,
      right: 0,
      bottom: 0,
      child: PopupContent(
        content: Scaffold(
          body: widget,
        ),
      ),
    ),
  );
}

/// a bottom up - popup modal
class PopupLayout extends ModalRoute<void> {
  double top;
  double bottom;
  double left;
  double right;
  Color? bgColor;
  final Widget child;

  @override
  Duration get transitionDuration => Duration(milliseconds: 200);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => bgColor == null // ignore: prefer_if_null_operators
      ? Colors.black.withOpacity(0.5)
      : bgColor!;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => false;

  PopupLayout({
    Key? key,
    this.bgColor,
    required this.child,
    required this.top,
    required this.bottom,
    required this.left,
    required this.right
  });

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    top ??= 10;
    bottom ??= 20;
    left ??= 20;
    right ??= 20;

    return GestureDetector(
      onTap: () {
        // call this method here to hide soft keyboard
        SystemChannels.textInput.invokeMethod<dynamic>('TextInput.hide');
      },
      child: Material(
        // This makes sure that text and other content follows the material style
        type: MaterialType.transparency,
        //type: MaterialType.canvas,
        // make sure that the overlay content is not cut off
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
          EdgeInsets.only(bottom: bottom, left: left, right: right, top: top),
      child: SlideTransition(
        child: child,
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation!),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

class PopupContent extends StatefulWidget {
  final Widget content;

  const PopupContent({Key? key, required this.content}) : super(key: key);

  @override
  _PopupContentState createState() => _PopupContentState();
}

class _PopupContentState extends State<PopupContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.content,
    );
  }
}
