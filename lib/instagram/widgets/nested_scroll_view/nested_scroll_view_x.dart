part of 'nested_scroll_view.dart';

typedef NestedScrollViewPinnedHeaderSliverHeightBuilder = double Function();

class NestedScrollViewX extends NestedScrollView {
  const NestedScrollViewX({
    Key? key,
    ScrollController? controller,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollPhysics? physics,
    required NestedScrollViewHeaderSliversBuilder headerSliverBuilder,
    required Widget body,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    bool floatHeaderSlivers = false,
    Clip clipBehavior = Clip.hardEdge,
    String? restorationId,
    ScrollBehavior? scrollBehavior,
    this.pinnedHeaderSliverHeightBuilder,
    this.onlyOneScrollInBody = true,
  }) : super(
          key: key,
          controller: controller,
          scrollDirection: scrollDirection,
          reverse: reverse,
          physics: physics,
          headerSliverBuilder: headerSliverBuilder,
          body: body,
          dragStartBehavior: dragStartBehavior,
          floatHeaderSlivers: floatHeaderSlivers,
          clipBehavior: clipBehavior,
          restorationId: restorationId,
          scrollBehavior: scrollBehavior,
        );

  /// Get the total height of pinned header in NestedScrollView header.
  final NestedScrollViewPinnedHeaderSliverHeightBuilder? pinnedHeaderSliverHeightBuilder;

  /// When [NestedScrollView]'s body has [TabBarView]/[PageView] and
  /// their children have AutomaticKeepAliveClientMixin or PageStorageKey,
  /// [_innerController.nestedPositions] will have more one,
  /// will scroll all of scroll positions together.
  /// set [onlyOneScrollInBody] true to avoid it.
  final bool onlyOneScrollInBody;

  @override
  List<Widget> _buildSlivers(BuildContext context, ScrollController innerController, bool bodyIsScrolled) {
    return <Widget>[
      ...headerSliverBuilder(context, bodyIsScrolled),
      _SliverFillRemainingWithScrollableX(
        child: PrimaryScrollController(
          controller: innerController,
          child: body,
        ),
      ),
    ];
  }

  @override
  NestedScrollViewState createState() => NestedScrollViewStateX();
}

class NestedScrollViewStateX extends NestedScrollViewState {
  @override
  void initState() {
    super.initState();
    _coordinator = _NestedScrollCoordinatorX(
      this,
      widget.controller,
      _handleHasScrolledBodyChanged,
      widget.floatHeaderSlivers,
      (widget as NestedScrollViewX).pinnedHeaderSliverHeightBuilder,
      (widget as NestedScrollViewX).onlyOneScrollInBody,
      (widget as NestedScrollViewX).scrollDirection,
    );
  }
}

class _NestedScrollControllerX extends _NestedScrollController {
  _NestedScrollControllerX(
    _NestedScrollCoordinatorX coordinator, {
    double initialScrollOffset = 0.0,
    String? debugLabel,
  }) : super(coordinator, initialScrollOffset: initialScrollOffset, debugLabel: debugLabel);

  @override
  ScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition? oldPosition,
  ) {
    return _NestedScrollPositionX(
      coordinator: coordinator as _NestedScrollCoordinatorX,
      physics: physics,
      context: context,
      initialPixels: initialScrollOffset,
      oldPosition: oldPosition,
      debugLabel: debugLabel,
    );
  }

  @override
  Iterable<_NestedScrollPosition> get nestedPositions => kDebugMode ? _debugNestedPositions : _releaseNestedPositions;

  Iterable<_NestedScrollPosition> get _debugNestedPositions {
    return Iterable.castFrom<ScrollPosition, _NestedScrollPosition>(positions);
  }

  Iterable<_NestedScrollPosition> get _releaseNestedPositions sync* {
    yield* Iterable.castFrom<ScrollPosition, _NestedScrollPosition>(positions);
  }
}

class _NestedScrollCoordinatorX extends _NestedScrollCoordinator {
  _NestedScrollCoordinatorX(
    NestedScrollViewStateX state,
    ScrollController? parent,
    VoidCallback onHasScrolledBodyChanged,
    bool floatHeaderSlivers,
    this.pinnedHeaderSliverHeightBuilder,
    this.onlyOneScrollInBody,
    this.scrollDirection,
  ) : super(state, parent, onHasScrolledBodyChanged, floatHeaderSlivers) {
    final double initialScrollOffset = _parent?.initialScrollOffset ?? 0.0;
    _outerController = _NestedScrollControllerX(
      this,
      initialScrollOffset: initialScrollOffset,
      debugLabel: 'outer',
    );
    _innerController = _NestedScrollControllerX(
      this,
      initialScrollOffset: 0.0,
      debugLabel: 'inner',
    );
  }

  /// Get the total height of pinned header in NestedScrollView header.
  final NestedScrollViewPinnedHeaderSliverHeightBuilder? pinnedHeaderSliverHeightBuilder;

  /// When [NestedScrollView]'s body has [TabBarView]/[PageView] and
  /// their children have AutomaticKeepAliveClientMixin or PageStorageKey,
  /// [_innerController.nestedPositions] will have more one,
  /// will scroll all of scroll positions together.
  /// set [onlyOneScrollInBody] true to avoid it.
  final bool onlyOneScrollInBody;

  final Axis scrollDirection;

  /// The [TabBarView]/[PageView] in body should perpendicular with The Axis of
  /// [NestedScrollView].
  Axis get bodyScrollDirection => scrollDirection == Axis.vertical ? Axis.horizontal : Axis.vertical;

  @override
  Iterable<_NestedScrollPosition> get _innerPositions {
    if (_innerController.nestedPositions.length > 1 && onlyOneScrollInBody) {
      final Iterable<_NestedScrollPosition> actived =
          _innerController.nestedPositions.where((element) => (element as _NestedScrollPositionX).isActived);
      if (actived.isEmpty) {
        for (final _NestedScrollPosition scrollPosition in _innerController.nestedPositions) {
          final RenderObject? renderObject = scrollPosition.context.storageContext.findRenderObject();
          if (renderObject == null || !renderObject.attached) {
            continue;
          }
          if (renderObjectIsVisible(renderObject, bodyScrollDirection)) {
            return <_NestedScrollPosition>[scrollPosition];
          }
        }
        return _innerController.nestedPositions;
      }

      return actived;
    } else {
      return _innerController.nestedPositions;
    }
  }

  /// Return whether renderObject is visible in parent
  bool childIsVisible(
    RenderObject parent,
    RenderObject renderObject,
  ) {
    bool visible = false;

    // The implementation has to return the children in paint order skipping all
    // children that are not semantically relevant (e.g. because they are
    // invisible).
    parent.visitChildrenForSemantics((RenderObject child) {
      if (renderObject == child) {
        visible = true;
      } else {
        visible = childIsVisible(child, renderObject);
      }
    });
    return visible;
  }

  bool renderObjectIsVisible(RenderObject renderObject, Axis axis) {
    final RenderViewport? parent = findParentRenderViewport(renderObject);
    if (parent != null && parent.axis == axis) {
      for (final RenderSliver childrenInPaint in parent.childrenInHitTestOrder) {
        return childIsVisible(childrenInPaint, renderObject) && renderObjectIsVisible(parent, axis);
      }
    }
    return true;
  }

  RenderViewport? findParentRenderViewport(RenderObject? object) {
    if (object == null) {
      return null;
    }
    object = object.parent as RenderObject?;
    while (object != null) {
      // only find in body
      if (object is _RenderSliverFillRemainingWithScrollableX) {
        return null;
      }
      if (object is RenderViewport) {
        return object;
      }
      object = object.parent as RenderObject?;
    }
    return null;
  }

  @override
  void updateCanDrag({_NestedScrollPosition? position}) {
    double maxInnerExtent = 0.0;

    if (onlyOneScrollInBody && position != null && position.debugLabel == 'inner') {
      if (position.haveDimensions) {
        maxInnerExtent = math.max(
          maxInnerExtent,
          position.maxScrollExtent - position.minScrollExtent,
        );
        position.updateCanDrag(maxInnerExtent);
      }
    }
    if (!_outerPosition!.haveDimensions) {
      return;
    }

    for (final _NestedScrollPosition position in _innerPositions) {
      if (!position.haveDimensions) {
        return;
      }
      maxInnerExtent = math.max(
        maxInnerExtent,
        position.maxScrollExtent - position.minScrollExtent,
      );
    }
    _outerPosition!.updateCanDrag(maxInnerExtent);
  }

  ///??????????????????
  _NestedScrollPosition? get _innerPosition {
    if (!_innerController.hasClients || _innerController.nestedPositions.isEmpty) return null;
    // ????????????????????????????????????????????????innerPosition?????????????????????????????????
    _NestedScrollPosition? innerPosition;
    if (userScrollDirection != ScrollDirection.idle) {
      for (final _NestedScrollPosition position in _innerPositions) {
        if (innerPosition != null) {
          //??????
          if (userScrollDirection == ScrollDirection.reverse) {
            if (innerPosition.pixels < position.pixels) continue;
          } else {
            if (innerPosition.pixels > position.pixels) continue;
          }
        }
        innerPosition = position;
      }
    }
    return innerPosition;
  }

  @override
  _NestedScrollMetrics _getMetrics(_NestedScrollPosition innerPosition, double velocity) {
    return _NestedScrollMetrics(
      minScrollExtent: _outerPosition!.minScrollExtent,
      //????????????
      maxScrollExtent:
          _outerPosition!.maxScrollExtent + (innerPosition.maxScrollExtent - innerPosition.minScrollExtent),
      //????????????
      pixels: unnestOffset(innerPosition.pixels, innerPosition),
      //????????????
      viewportDimension: _outerPosition!.viewportDimension,
      //??????????????????
      axisDirection: _outerPosition!.axisDirection,
      minRange: 0,
      maxRange: 0,
      correctionOffset: 0,
    );
  }

  ///???in/out???????????????Coordinator
  @override
  double unnestOffset(double value, _NestedScrollPosition source) {
    if (source == _outerPosition) {
      if (_innerPosition!.pixels > _innerPosition!.minScrollExtent) {
        ///inner???????????????inner???????????????
        return source.maxScrollExtent + _innerPosition!.pixels - _innerPosition!.minScrollExtent;
      }
      return value;
    } else {
      if (_outerPosition!.pixels < _outerPosition!.maxScrollExtent) {
        ///outer???????????????outer???????????????
        return _outerPosition!.pixels;
      }
      return _outerPosition!.maxScrollExtent + (value - source.minScrollExtent);
    }
  }

  ///???Coordinator???????????????in/out
  @override
  double nestOffset(double value, _NestedScrollPosition target) {
    if (target == _outerPosition) {
      if (value > _outerPosition!.maxScrollExtent) {
        //?????????outer??????overscroll
        return _outerPosition!.maxScrollExtent;
      }
      return value;
    } else {
      if (value < _outerPosition!.maxScrollExtent) {
        //?????????innner??????overscroll
        return target.minScrollExtent;
      }
      return (target.minScrollExtent + (value - _outerPosition!.maxScrollExtent));
    }
  }

  ///???????????????????????????
  @override
  void applyUserOffset(double delta) {
    updateUserScrollDirection(delta > 0.0 ? ScrollDirection.forward : ScrollDirection.reverse);
    if (_innerPositions.isEmpty) {
      ///??????outscroll?????????
      _outerPosition!.applyFullDragUpdate(delta);
    } else if (delta < 0.0) {
      //???????????????
      double outerDelta = delta;
      for (final _NestedScrollPosition position in _innerPositions) {
        //????????????????????? inner overscroll
        if (position.pixels < position.minScrollExtent) {
          // ??????Clamp????????????????????????????????????
          final double potentialOuterDelta = position.applyClampedDragUpdate(delta);
          // ???????????????????????????
          if (potentialOuterDelta < 0) {
            outerDelta = math.max(outerDelta, potentialOuterDelta);
          }
        }
      }
      if (outerDelta != 0.0) {
        // ??????Clamp????????????????????????????????????
        final double innerDelta = _outerPosition!.applyClampedDragUpdate(
          outerDelta,
        );
        // ????????????????????????????????????
        if (innerDelta != 0.0) {
          for (final _NestedScrollPosition position in _innerPositions) position.applyFullDragUpdate(innerDelta);
        }
      }
    } else {
      //???????????????
      double innerDelta = delta;
      if (_floatHeaderSlivers) {
        //????????????Clamp????????????????????????????????????
        innerDelta = _outerPosition!.applyClampedDragUpdate(delta);
      }
      //??????????????????????????????????????????
      if (innerDelta != 0.0) {
        double outerDelta = 0.0; // ????????????????????????????????????????????????
        for (final _NestedScrollPosition position in _innerPositions) {
          //??????Clamp????????????????????????????????????
          final double overscroll = position.applyClampedDragUpdate(innerDelta);
          if (overscroll > 0) {
            //???????????????????????????
            outerDelta = math.max(outerDelta, overscroll);
          }
        }
        if (outerDelta != 0.0) {
          //????????????????????????????????????
          _outerPosition!.applyFullDragUpdate(outerDelta);
        }
      }
    }
  }
}

class _NestedScrollPositionX extends _NestedScrollPosition {
  _NestedScrollPositionX({
    required ScrollPhysics physics,
    required ScrollContext context,
    double initialPixels = 0.0,
    ScrollPosition? oldPosition,
    String? debugLabel,
    required _NestedScrollCoordinatorX coordinator,
  }) : super(
            physics: physics,
            context: context,
            initialPixels: initialPixels,
            oldPosition: oldPosition,
            debugLabel: debugLabel,
            coordinator: coordinator);

  @override
  ScrollActivity createBallisticScrollActivity(
    Simulation? simulation, {
    required _NestedBallisticScrollActivityMode mode,
    _NestedScrollMetrics? metrics,
  }) {
    if (simulation == null) return IdleScrollActivity(this);
    switch (mode) {
      case _NestedBallisticScrollActivityMode.independent:
        return BallisticScrollActivity(this, simulation, context.vsync);
      default:
        return _NestedBallisticScrollActivityX(
          coordinator,
          this,
          simulation,
          context.vsync,
        );
    }
  }

  @override
  bool applyContentDimensions(double minScrollExtent, double maxScrollExtent) {
    if (debugLabel == 'outer' && (coordinator as _NestedScrollCoordinatorX).pinnedHeaderSliverHeightBuilder != null) {
      maxScrollExtent = maxScrollExtent - (coordinator as _NestedScrollCoordinatorX).pinnedHeaderSliverHeightBuilder!();
      maxScrollExtent = math.max(0.0, maxScrollExtent);
    }
    return super.applyContentDimensions(minScrollExtent, maxScrollExtent);
  }

  bool _isActived = false;

  @override
  Drag drag(DragStartDetails details, VoidCallback dragCancelCallback) {
    _isActived = true;
    return coordinator.drag(details, () {
      dragCancelCallback();
      _isActived = false;
    });
  }

  /// Whether is actived now
  bool get isActived {
    return _isActived;
  }
}

class _NestedBallisticScrollActivityX extends BallisticScrollActivity {
  _NestedBallisticScrollActivityX(
    this.coordinator,
    _NestedScrollPosition position,
    Simulation simulation,
    TickerProvider vsync,
  ) : super(position, simulation, vsync);

  final _NestedScrollCoordinator coordinator;

  @override
  _NestedScrollPosition get delegate => super.delegate as _NestedScrollPosition;

  @override
  void resetActivity() {
    delegate.beginActivity(coordinator.createInnerBallisticScrollActivity(
      delegate,
      velocity,
    ));
  }

  @override
  void applyNewDimensions() {
    delegate.beginActivity(coordinator.createInnerBallisticScrollActivity(
      delegate,
      velocity,
    ));
  }

  @override
  bool applyMoveTo(double value) {
    return super.applyMoveTo(coordinator.nestOffset(value, delegate));
  }
}

class _SliverFillRemainingWithScrollableX extends SingleChildRenderObjectWidget {
  const _SliverFillRemainingWithScrollableX({
    Key? key,
    Widget? child,
  }) : super(key: key, child: child);

  @override
  _RenderSliverFillRemainingWithScrollableX createRenderObject(BuildContext context) =>
      _RenderSliverFillRemainingWithScrollableX();
}

class _RenderSliverFillRemainingWithScrollableX extends RenderSliverFillRemainingWithScrollable {}
