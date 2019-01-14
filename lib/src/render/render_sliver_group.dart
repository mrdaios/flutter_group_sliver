part of flutter_group_sliver;

class _RenderSliverGroup extends RenderSliver with RenderSliverHelpers {
  _RenderSliverGroup(
      {EdgeInsetsGeometry margin,
      BorderRadius borderRadius,
      RenderBox decoration,
      RenderSliver child}) {
    this.margin = margin;
    this.borderRadius = borderRadius;
    this.decoration = decoration;
    this.child = child;
  }
  RRect _clipRRect;

  EdgeInsetsGeometry get margin => _margin;
  EdgeInsetsGeometry _margin;
  set margin(EdgeInsetsGeometry value) {
    assert(value != null);
    assert(value.isNonNegative);
    if (_margin == value) return;
    _margin = value;
    markNeedsLayout();
  }

  BorderRadiusGeometry get borderRadius => _borderRadius;
  BorderRadiusGeometry _borderRadius;
  set borderRadius(BorderRadiusGeometry value) {
    if (value == _borderRadius) return;
    _borderRadius = value;
    markNeedsPaint();
  }

  RenderBox get decoration => _decoration;
  RenderBox _decoration;
  set decoration(RenderBox value) {
    if (_decoration != null) dropChild(_decoration);
    _decoration = value;
    if (_decoration != null) adoptChild(_decoration);
  }

  RenderSliver get child => _child;
  RenderSliver _child;
  set child(RenderSliver value) {
    if (_child != null) dropChild(_child);
    _child = value;
    if (_child != null) adoptChild(_child);
  }

  @override
  void setupParentData(RenderObject child) {
    if (child.parentData is! SliverPhysicalParentData)
      child.parentData = new SliverPhysicalParentData();
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    if (_decoration != null) _decoration.attach(owner);
    if (_child != null) _child.attach(owner);
  }

  @override
  void detach() {
    super.detach();
    if (_decoration != null) _decoration.detach();
    if (_child != null) _child.detach();
  }

  @override
  void redepthChildren() {
    if (_decoration != null) redepthChild(_decoration);
    if (_child != null) redepthChild(_child);
  }

  @override
  void visitChildren(RenderObjectVisitor visitor) {
    if (_decoration != null) visitor(_decoration);
    if (_child != null) visitor(_child);
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    List<DiagnosticsNode> result = <DiagnosticsNode>[];
    if (decoration != null) {
      result.add(decoration.toDiagnosticsNode(name: 'decoration'));
    }
    if (child != null) {
      result.add(child.toDiagnosticsNode(name: 'child'));
    }
    return result;
  }

  @override
  bool hitTestChildren(HitTestResult result,
      {double mainAxisPosition, double crossAxisPosition}) {
    assert(geometry.hitTestExtent > 0.0);
    return child.hitTest(result,
        mainAxisPosition: mainAxisPosition,
        crossAxisPosition: crossAxisPosition);
  }

  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry();
      return;
    }
    // child not null
    AxisDirection axisDirection = applyGrowthDirectionToAxisDirection(
        constraints.axisDirection, constraints.growthDirection);
    // layout sliver
    child.layout(constraints, parentUsesSize: true);
    final SliverGeometry childLayoutGeometry = child.geometry;
    geometry = childLayoutGeometry;

    // layout decoration with child size + margin
    EdgeInsets margin = this.margin.resolve(TextDirection.ltr);
    if (decoration != null) {
      decoration.layout(
          constraints.asBoxConstraints(
              maxExtent: childLayoutGeometry.maxPaintExtent + margin.horizontal,
              crossAxisExtent: constraints.crossAxisExtent + margin.vertical),
          parentUsesSize: true);
    }
    // compute decoration offset
    final SliverPhysicalParentData headerParentData = decoration.parentData;
    double headerPosition = -constraints.scrollOffset;
    switch (axisDirection) {
      case AxisDirection.up:
        headerParentData.paintOffset =
            new Offset(0.0, geometry.paintExtent - 0 - 0);
        break;
      case AxisDirection.down:
        headerParentData.paintOffset =
            new Offset(-margin.left, headerPosition - margin.top);
        break;
      case AxisDirection.left:
        headerParentData.paintOffset =
            new Offset(geometry.paintExtent - 0 - 0, 0.0);
        break;
      case AxisDirection.right:
        headerParentData.paintOffset = new Offset(0, 0.0);
        break;
    }
    //compute child clip
    if (this.borderRadius != null) {
      BorderRadius borderRadius = this.borderRadius.resolve(TextDirection.ltr);
      _clipRRect = borderRadius.toRRect(Rect.fromLTRB(
          0, 0, constraints.crossAxisExtent, geometry.maxPaintExtent));
      double offSetY = headerPosition;
      _clipRRect = _clipRRect.shift(Offset(0, offSetY));
    }
  }

  @override
  void applyPaintTransform(RenderObject child, Matrix4 transform) {
    assert(child != null);
    final SliverPhysicalParentData childParentData = child.parentData;
    childParentData.applyPaintTransform(transform);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (geometry.visible) {
      // paint decoration
      if (decoration != null) {
        final SliverPhysicalParentData childParentData = decoration.parentData;
        context.paintChild(decoration, offset + childParentData.paintOffset);
      }
      // paint child
      if (child != null && child.geometry.visible) {
        final SliverPhysicalParentData childParentData = child.parentData;
        final PaintingContextCallback painter =
            (PaintingContext context, Offset offset) {
          context.paintChild(child, offset);
        };
        if (_clipRRect != null && _clipRRect != RRect.zero) {
          context.pushClipRRect(
            needsCompositing,
            offset + childParentData.paintOffset,
            _clipRRect.outerRect,
            _clipRRect,
            painter,
          );
        } else {
          painter(context, offset + childParentData.paintOffset);
        }
      }
    }
  }
}
