import 'package:flutter/material.dart';
import 'package:ndisparticipant/Helpers/theme/ft_theme_colors.dart';
import 'package:ndisparticipant/components/a_widget_extensions.dart';

class ExpandCardOutside extends StatefulWidget {
  ExpandCardOutside({Key? key,
    required this.child,
    required this.title,
    this.titleWidget,
    this.title_color,
    this.box_color,
    this.radius,
    this.leftPadding,
    this.isopen = false,
    this.onTap})
      : super(key: key);
  String title;
  Widget? titleWidget;
  Widget child;
  double? radius;
  double? leftPadding;
  Color? title_color;
  Color? box_color;
  bool isopen;
  VoidCallback? onTap;

  @override
  _ExpandCardOutsideState createState() => _ExpandCardOutsideState();
}

class _ExpandCardOutsideState extends State<ExpandCardOutside> {


  Divider defaultDivider() {
    return Divider(
      height: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              !widget.isopen ? widget.onTap?.call() : null;
              widget.isopen = !widget.isopen;
              setState(() {});
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(widget.leftPadding ?? 5, 10, 10, 5),
              child: Container(
                color: widget.box_color ?? kColorThemeDarkGreenColor,
                child: Row(
                  children: [
                    Expanded(
                      child: widget.titleWidget ??
                          Text( widget.title,
                              style: TextStyle(
                                fontSize: 15,
                                color: widget.title_color ?? Colors.white,
                                fontWeight: FontWeight.w500,
                              )).leftPadding(widget.leftPadding ?? 5),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      widget.isopen
                          ? Icons.keyboard_arrow_up
                          :Icons.keyboard_arrow_down ,
                      color: widget.title_color ?? Colors.white,
                      size: 30.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // defaultDivider(),
          AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState:
              widget.isopen ? CrossFadeState.showFirst : CrossFadeState
                  .showSecond,
              firstChild: widget.child,
              secondChild: const SizedBox(width: double.infinity))
        ]);
  }
}
