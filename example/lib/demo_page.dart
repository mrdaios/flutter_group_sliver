import 'package:flutter/material.dart';

import 'package:flutter_group_sliver/flutter_group_sliver.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group UI"),
      ),
      body: Container(
        color: Color.fromRGBO(250, 250, 250, 1),
        child: CustomScrollView(
          slivers: <Widget>[
            buildCustom1(),
            buildCustom2(),
            buildCustom3(),
            buildCustom4(),
          ],
        ),
      ),
    );
  }

  Widget buildCustom1() {
    return SliverGroupBuilder(
        child: SliverList(
            delegate: SliverChildListDelegate([
      Container(
        color: Color.fromRGBO(42, 152, 240, 1),
        padding: EdgeInsets.all(10),
        child: Text(
          "default",
          style: TextStyle(color: Colors.white),
        ),
      ),
      Divider(height: 1),
      Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Text(
          "Item_1",
          style: TextStyle(color: Colors.black),
        ),
      ),
      Divider(height: 1),
      Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Text(
          "Item_2",
          style: TextStyle(color: Colors.black),
        ),
      ),
    ])));
  }

  Widget buildCustom2() {
    return SliverGroupBuilder(
        margin: EdgeInsets.all(10),
//        padding: EdgeInsets.all(1),
        child: SliverList(
            delegate: SliverChildListDelegate([
          Container(
            color: Color.fromRGBO(42, 152, 240, 1),
            padding: EdgeInsets.all(10),
            child: Text(
              "padding margin",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Divider(height: 1),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Text(
              "Item_1",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Divider(height: 1),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Text(
              "Item_2",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ])));
  }

  Widget buildCustom3() {
    return SliverGroupBuilder(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: SliverList(
            delegate: SliverChildListDelegate([
          Container(
            color: Color.fromRGBO(42, 152, 240, 1),
            padding: EdgeInsets.all(10),
            child: Text(
              "BoxDecoration",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Divider(height: 1),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Text(
              "Item_1",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Divider(height: 1),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Text(
              "Item_2",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ])));
  }

  Widget buildCustom4() {
    return SliverGroupBuilder(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(1),
        decoration: ShapeDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://www.thedroidsonroids.com/wp-content/uploads/2018/04/flutter_blog-2-750x400.png'),
              fit: BoxFit.fill),
          shape: Border.all(
            color: Colors.grey,
            style: BorderStyle.none,
            width: 1,
          ),
        ),
        child: SliverList(
            delegate: SliverChildListDelegate([
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "ShapDecoration",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Divider(height: 1),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Item_1",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Divider(height: 1),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Item_2",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ])));
  }
}
