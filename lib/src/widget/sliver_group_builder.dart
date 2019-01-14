part of flutter_group_sliver;

class SliverGroupBuilder extends StatelessWidget {
  const SliverGroupBuilder(
      {this.margin = EdgeInsets.zero,
      this.padding = EdgeInsets.zero,
      this.decoration,
      this.child});

  /// Empty space to surround the [decoration] and [child].
  final EdgeInsetsGeometry margin;

  /// Empty space to inscribe inside the [decoration]. The [child], if any, is
  /// placed inside this padding.
  ///
  /// This padding is in addition to any padding inherent in the [decoration];
  /// see [Decoration.padding].
  /// TODO: 有bug
  final EdgeInsetsGeometry padding;

  /// The decoration to paint behind the [child].
  ///
  /// A shorthand for specifying just a solid color is available in the
  /// constructor: set the `color` argument instead of the `decoration`
  /// argument.
  final Decoration decoration;

  /// The  sliver widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // get borderRadius
    BorderRadiusGeometry borderRadius;
    if (this.decoration != null && this.decoration is BoxDecoration) {
      borderRadius = (this.decoration as BoxDecoration).borderRadius;
    }

    _SliverGroup child = _SliverGroup(
        margin: this.padding,
        borderRadius: borderRadius,
        sliver: this.child,
        decorationWidget: Container(decoration: this.decoration));

    EdgeInsetsGeometry sliverPadding = EdgeInsets.zero;
    if (this.padding != null) {
      sliverPadding = sliverPadding.add(this.padding);
    }
    if (this.margin != null) {
      sliverPadding = sliverPadding.add(this.margin);
    }
    if (sliverPadding != EdgeInsets.zero) {
      return SliverPadding(padding: sliverPadding, sliver: child);
    } else {
      return child;
    }
  }
}
