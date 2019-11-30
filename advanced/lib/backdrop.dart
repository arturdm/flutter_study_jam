import 'package:flutter/material.dart';
import 'model/product.dart';

const double _flingVelocity = 2.0;

class Backdrop extends StatefulWidget {
  final Category currentCategory;
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;

  const Backdrop({
    @required this.currentCategory,
    @required this.frontLayer,
    @required this.backLayer,
    @required this.frontTitle,
    @required this.backTitle,
  });

  @override
  BackdropState createState() {
    return BackdropState();
  }
}

class BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(microseconds: 300), value: 1.0, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _frontLayerVisible {
    final AnimationStatus status = _controller.status;
    return [AnimationStatus.completed, AnimationStatus.forward]
        .contains(status);
  }

  void _toggleBackdropPlayerVisibility() {
    _controller.fling(
        velocity: _frontLayerVisible ? -_flingVelocity : _flingVelocity);
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      brightness: Brightness.light,
      elevation: 0,
      titleSpacing: 0,
      leading: Icon(Icons.menu),
      title: Text('Shrine'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search, semanticLabel: "Search"),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.tune, semanticLabel: "Filter"),
          onPressed: () {},
        )
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: _buildStack(),
    );
  }

  Widget _buildStack() {
    return Stack(key: _backdropKey, children: <Widget>[
      ExcludeSemantics(
        child: widget.backLayer,
        excluding: _frontLayerVisible,
      ),
      _FrontLayer(child: widget.frontLayer)
    ]);
  }
}

class _FrontLayer extends StatelessWidget {
  final Widget child;
  const _FrontLayer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(46))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Expanded(child: child)],
      ),
    );
  }
}
