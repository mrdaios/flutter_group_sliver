# flutter_group_sliver

Add a grouping background by customizing the RenderSliver.

[![Pub](https://img.shields.io/pub/v/flutter_group_sliver.svg)](https://pub.dartlang.org/packages/flutter_group_sliver)
![Screenshot](https://raw.githubusercontent.com/mrdaios/flutter_group_sliver/master/doc/images/flutter_group_sliver.png)

## Features

- [x] Support custom margin and padding.
- [x] Support custom decoration.
## Getting started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  flutter_group_sliver: "^0.0.2"
```

In your library add the following import:

```dart
import 'package:flutter_group_sliver/flutter_group_sliver.dart';
```

For help getting started with Flutter, view the online [documentation](https://flutter.io/).

## SliverGroupBuilder

You can place one or multiple `SliverGroupBuilder`s inside a `CustomScrollView`.

```dart
SliverGroupBuilder(
  margin: EdgeInsets.all(10),
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(2)),
      border: Border.all(color: Color.fromRGBO(238, 237, 238, 1))),
  child: SliverList(
    delegate: new SliverChildBuilderDelegate(
      (context, i) => new ListTile(
            leading: new CircleAvatar(
              child: new Text('0'),
            ),
            title: new Text('List tile #$i'),
          ),
      childCount: 4,
    ),
  ),
);
```

You can find more examples in the [Example](https://github.com/mrdaios/flutter_group_sliver/tree/master/example) project.

## Changelog

Please see the [Changelog](https://github.com/mrdaios/flutter_group_sliver/blob/master/CHANGELOG.md) page to know what's recently changed.

## Contributions

Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/mrdaios/flutter_group_sliverr/issues).  
If you fixed a bug or implemented a new feature, please send a [pull request](https://github.com/mrdaios/flutter_group_sliver/pulls).

## Thanks

:clap: Thanks to [letsart](https://github.com/letsart) with it's RenderSliver (https://github.com/letsar/flutter_sticky_header/blob/master/lib/src/rendering/sliver_sticky_header.dart) which let me know how custom.