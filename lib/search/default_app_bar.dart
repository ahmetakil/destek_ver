import './my_painter.dart';
import './search_bar.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String appBarTitle;

  DefaultAppBar(this.appBarTitle);

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  _DefaultAppBarState createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar>
    with SingleTickerProviderStateMixin {
  double rippleStartX, rippleStartY;
  AnimationController _controller;
  Animation _animation;
  bool isInSearchMode = false;

  @override
  initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.addStatusListener(animationStatusListener);
  }

  animationStatusListener(AnimationStatus animationStatus) {
    if (animationStatus == AnimationStatus.completed) {
      setState(() {
        isInSearchMode = true;
      });
    }
  }

  void onSearchTapUp(TapUpDetails details) {
    setState(() {
      rippleStartX = details.globalPosition.dx;
      rippleStartY = details.globalPosition.dy;
    });

    print("pointer location $rippleStartX, $rippleStartY");
    _controller.forward();
  }

  cancelSearch() {
    setState(() {
      isInSearchMode = false;
    });

    onSearchQueryChange('');
    _controller.reverse();
  }

  onSearchQueryChange(String query) {
    print('search $query');
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(children: [
      AppBar(
        title: Text(widget.appBarTitle),
        actions: <Widget>[
          GestureDetector(
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            onTapUp: onSearchTapUp,
          ),
        ],
      ),
      AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            painter: MyPainter(
              containerHeight: widget.preferredSize.height,
              center: Offset(rippleStartX ?? 0, rippleStartY ?? 0),
              radius: _animation.value * screenWidth,
              context: context,
            ),
          );
        },
      ),
      isInSearchMode
          ? (SearchBar(
              onCancelSearch: cancelSearch,
              onSearchQueryChanged: onSearchQueryChange,
            ))
          : (Container())
    ]);
  }
}
