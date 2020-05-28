library circle_bottom_navigation;

import 'package:circle_bottom_navigation/utils/half_clipper.dart';
import 'package:circle_bottom_navigation/utils/half_painter.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:circle_bottom_navigation/widgets/tab_item.dart';
import 'package:flutter/material.dart';

class CustomCircleBottomNavigation extends StatefulWidget {
  final List<TabData> tabs;
  final Function(int position) onTabChangedListener;
  final int initialSelection;
  final Color circleColor;
  final Color activeIconColor;
  final Color inactiveIconColor;
  final Color textColor;
  final Color barBackgroundColor;
  final double circleSize;
  final double barHeight;
  final double arcHeight;
  final double arcWidth;
  final double circleOutline;
  final double shadowAllowance;
  final bool hasElevationShadows;
  final double blurShadowRadius;

  final int indexWithNoAnimation;

  final Key key;

  CustomCircleBottomNavigation({
    @required this.tabs,
    @required this.onTabChangedListener,
    @required this.initialSelection,
    this.key,
    this.circleColor,
    this.activeIconColor,
    this.inactiveIconColor,
    this.textColor,
    this.barBackgroundColor,
    this.circleSize = 60.0,
    this.barHeight = 60.0,
    this.arcHeight = 70.0,
    this.arcWidth = 90.0,
    this.circleOutline = 10.0,
    this.shadowAllowance = 20.0,
    this.hasElevationShadows = true,
    this.indexWithNoAnimation = null,
    this.blurShadowRadius = 8.0,
  })  : assert(onTabChangedListener != null),
        assert(initialSelection != null),
        assert(tabs != null);

  @override
  _CustomCircleBottomNavigationState createState() =>
      _CustomCircleBottomNavigationState();
}

class _CustomCircleBottomNavigationState
    extends State<CustomCircleBottomNavigation>
    with TickerProviderStateMixin, RouteAware {
  IconData nextIcon = Icons.search;
  IconData activeIcon = Icons.search;

  int currentSelected = 0;
  double _circleAlignX = 0;
  double _circleIconAlpha = 1;

  Color circleColor;
  Color activeIconColor;
  Color inactiveIconColor;
  Color barBackgroundColor;
  Color textColor;
  double activeIconSize;
  double nextIconSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    activeIcon = widget.tabs[currentSelected].icon;
    activeIconSize = widget.tabs[currentSelected].iconSize ?? 30;

    circleColor = (widget.circleColor == null)
        ? (Theme.of(context).brightness == Brightness.dark)
            ? Colors.white
            : Theme.of(context).primaryColor
        : widget.circleColor;

    activeIconColor = (widget.activeIconColor == null)
        ? (Theme.of(context).brightness == Brightness.dark)
            ? Colors.black54
            : Colors.white
        : widget.activeIconColor;

    barBackgroundColor = (widget.barBackgroundColor == null)
        ? (Theme.of(context).brightness == Brightness.dark)
            ? Colors.black54
            : Colors.white
        : widget.barBackgroundColor;

    textColor = (widget.textColor == null)
        ? (Theme.of(context).brightness == Brightness.dark)
            ? Colors.white
            : Colors.black54
        : widget.textColor;

    inactiveIconColor = (widget.inactiveIconColor == null)
        ? (Theme.of(context).brightness == Brightness.dark)
            ? Colors.white
            : Theme.of(context).primaryColor
        : widget.inactiveIconColor;
  }

  @override
  void initState() {
    super.initState();
    _setSelected(widget.tabs[widget.initialSelection].key);
  }

  void setPage(int page) {
    widget.onTabChangedListener(page);
    _setSelected(widget.tabs[page].key);
    _initAnimationAndStart(_circleAlignX, 1);

    setState(() {
      currentSelected = page;
    });
  }

  void _setSelected(UniqueKey key) {
    int selected =
        widget.tabs.indexWhere((TabData tabData) => tabData.key == key);

    if (mounted && widget.indexWithNoAnimation != selected) {
      setState(() {
        currentSelected = selected;
        _circleAlignX = -1 + (2 / (widget.tabs.length - 1) * selected);
        nextIcon = widget.tabs[selected].icon;
        nextIconSize = widget.tabs[selected].iconSize ?? 30;
      });
    }
  }

  void _initAnimationAndStart(double from, double to) {
    _circleIconAlpha = 0;
    Future.delayed(
      Duration(
        milliseconds: ANIM_DURATION ~/ 5,
      ),
      () {
        setState(() {
          activeIcon = nextIcon;
          activeIconSize = nextIconSize;
        });
      },
    ).then((_) {
      Future.delayed(
          Duration(
            milliseconds: ANIM_DURATION ~/ 5 * 3,
          ), () {
        setState(() {
          _circleIconAlpha = 1;
        });
      });
    });
  }

  void _callbackFunction(UniqueKey key) {
    int selected =
        this.widget.tabs.indexWhere((TabData tabData) => tabData.key == key);

    this.widget.onTabChangedListener(selected);

    if (selected != widget.indexWithNoAnimation) {
      _setSelected(key);

      _initAnimationAndStart(_circleAlignX, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: this.widget.barHeight,
          decoration: BoxDecoration(
            color: barBackgroundColor,
            boxShadow: <BoxShadow>[
              this.widget.hasElevationShadows
                  ? BoxShadow(
                      color: Colors.black12,
                      offset: Offset(
                        0,
                        -1,
                      ),
                      blurRadius: this.widget.blurShadowRadius,
                    )
                  : BoxShadow(),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: this
                .widget
                .tabs
                .map(
                  (TabData tab) => TabItem(
                    uniqueKey: tab.key,
                    selected: tab.key == this.widget.tabs[currentSelected].key,
                    icon: tab.icon,
                    title: tab.title,
                    iconColor: inactiveIconColor,
                    textColor: textColor,
                    iconSize: tab.iconSize,
                    fontSize: tab.fontSize,
                    fontWeight: tab.fontWeight,
                    callbackFunction: (UniqueKey key) => _callbackFunction(key),
                  ),
                )
                .toList(),
          ),
        ),
        Positioned.fill(
          top: -(this.widget.circleSize +
                  this.widget.circleOutline +
                  this.widget.shadowAllowance) /
              2,
          child: Container(
            child: AnimatedAlign(
              duration: Duration(
                milliseconds: ANIM_DURATION,
              ),
              curve: Curves.easeOut,
              alignment: Alignment(
                _circleAlignX *
                    (Directionality.of(context) == TextDirection.rtl ? -1 : 1),
                1,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 15,
                ),
                child: FractionallySizedBox(
                  widthFactor: 1 / this.widget.tabs.length,
                  child: GestureDetector(
                    onTap: this.widget.tabs[currentSelected].onClick,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: this.widget.circleSize +
                              this.widget.circleOutline +
                              this.widget.shadowAllowance,
                          width: this.widget.circleSize +
                              this.widget.circleOutline +
                              this.widget.shadowAllowance,
                          child: ClipRect(
                            clipper: HalfClipper(),
                            child: Container(
                              child: Center(
                                child: Container(
                                  width: this.widget.circleSize +
                                      this.widget.circleOutline,
                                  height: this.widget.circleSize +
                                      this.widget.circleOutline,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 8,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: this.widget.arcHeight,
                          width: this.widget.arcWidth,
                          child: CustomPaint(
                            painter: HalfPainter(
                              paintColor: barBackgroundColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: this.widget.circleSize,
                          width: this.widget.circleSize,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                0.0,
                              ),
                              child: AnimatedOpacity(
                                duration: Duration(
                                  milliseconds: ANIM_DURATION ~/ 5,
                                ),
                                opacity: _circleIconAlpha,
                                child: Icon(
                                  activeIcon,
                                  color: activeIconColor,
                                  size: activeIconSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
