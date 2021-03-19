part of flutter_group_sliver;

@immutable
class _SliverGroup extends RenderObjectWidget {
  _SliverGroup(
      {Key? key,
      this.margin,
      this.borderRadius,
      this.decorationWidget,
      this.sliver})
      : super(key: key);

  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final Widget? decorationWidget;
  final Widget? sliver;

  @override
  _RenderSliverGroup createRenderObject(BuildContext context) {
    return _RenderSliverGroup(
        margin: this.margin!, borderRadius: this.borderRadius);
  }

  @override
  _SliverGroupElement createElement() => _SliverGroupElement(this);

  @override
  void updateRenderObject(
      BuildContext context, _RenderSliverGroup renderObject) {
    renderObject
      ..margin = margin!
      ..borderRadius = borderRadius;
  }
}

class _SliverGroupElement extends RenderObjectElement {
  _SliverGroupElement(_SliverGroup widget) : super(widget);

  Element? _decoration;
  Element? _sliver;

  @override
  _SliverGroup get widget => super.widget as _SliverGroup;

  @override
  void visitChildren(ElementVisitor visitor) {
    if (_decoration != null) visitor(_decoration!);
    if (_sliver != null) visitor(_sliver!);
  }

  @override
  void forgetChild(Element child) {
    if (child == _decoration) _decoration = null;
    if (child == _sliver) _sliver = null;
  }

  @override
  void mount(Element? parent, newSlot) {
    super.mount(parent, newSlot);
    _decoration = updateChild(_decoration, widget.decorationWidget, 0);
    _sliver = updateChild(_sliver, widget.sliver, 1);
  }

  @override
  void update(RenderObjectWidget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    _decoration = updateChild(_decoration, widget.decorationWidget, 0);
    _sliver = updateChild(_sliver, widget.sliver, 1);
  }

  @override
  void insertChildRenderObject(RenderObject child, int? slot) {
    final _RenderSliverGroup renderObject = this.renderObject as _RenderSliverGroup;
    if (slot == 0) renderObject.decoration = child as RenderBox?;
    if (slot == 1) renderObject.child = child as RenderSliver?;
    assert(renderObject == this.renderObject);
  }

  @override
  void moveChildRenderObject(RenderObject child, slot) {
    assert(false);
  }

  @override
  void removeChildRenderObject(RenderObject child) {
    final _RenderSliverGroup renderObject = this.renderObject as _RenderSliverGroup;
    if (renderObject.decoration == child) renderObject.decoration = null;
    if (renderObject.child == child) renderObject.child = null;
    assert(renderObject == this.renderObject);
  }
}
