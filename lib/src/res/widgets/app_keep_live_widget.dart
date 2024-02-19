import 'package:flutter/material.dart';

class AppKeepAliveWidget extends StatefulWidget {
  const AppKeepAliveWidget({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  State<AppKeepAliveWidget> createState() => _AppKeepAliveWidgetState();
}

class _AppKeepAliveWidgetState extends State<AppKeepAliveWidget> with AutomaticKeepAliveClientMixin<AppKeepAliveWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => true;
}
