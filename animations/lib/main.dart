// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'src/basics/animation_controller_demo.dart';
import 'src/misc/card_swipe.dart';
import 'src/misc/carousel.dart';
import 'src/misc/expand_card.dart';
import 'src/misc/focus_image.dart';
import 'src/misc/repeating_animation.dart';

void main() => runApp(AnimationSamples());

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo(this.name, this.route, this.builder);
}

final basicDemos = [
  Demo('Animation Controller', AnimationControllerDemo.routeName,
      (context) => AnimationControllerDemo()),
];

final miscDemos = [
  Demo('Expandable Card', ExpandCardDemo.routeName,
      (context) => ExpandCardDemo()),
  Demo('Carousel', CarouselDemo.routeName, (context) => CarouselDemo()),
  Demo('Focus Image', FocusImageDemo.routeName, (context) => FocusImageDemo()),
  Demo('Card Swipe', CardSwipeDemo.routeName, (context) => CardSwipeDemo()),
  Demo('Repeating Animation', RepeatingAnimationDemo.routeName,
      (context) => RepeatingAnimationDemo()),
];

final basicDemoRoutes =
    Map.fromEntries(basicDemos.map((d) => MapEntry(d.route, d.builder)));

final miscDemoRoutes =
    Map.fromEntries(miscDemos.map((d) => MapEntry(d.route, d.builder)));

final allRoutes = <String, WidgetBuilder>{
  ...basicDemoRoutes,
  ...miscDemoRoutes,
};

class AnimationSamples extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Samples',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: allRoutes,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Samples'),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Basics', style: headerStyle)),
          ...basicDemos.map((d) => DemoTile(d)),
          ListTile(title: Text('Misc', style: headerStyle)),
          ...miscDemos.map((d) => DemoTile(d)),
        ],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final Demo demo;

  DemoTile(this.demo);

  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        Navigator.pushNamed(context, demo.route);
      },
    );
  }
}