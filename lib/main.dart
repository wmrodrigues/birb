import 'package:birb/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'posts_list.dart';
import 'models/post.dart';
import 'models/post_mock.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Birb',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white
      ),
      home: MyHomePage(title: 'Birb'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
        elevation: 0.0,
      ),
      body: PostsList(_loadPosts(context)),
    );
  }

  Stream<List<Post>> _loadPosts(BuildContext context) {
    final List<List<dynamic>> mockSanpshot = <List<dynamic>>[
      List<dynamic>.generate(10, (int index) => mockPostData(index: index))
    ];

    return Stream<List<dynamic>>.fromIterable(mockSanpshot).map(_convertToPosts);
  }

  List<Post> _convertToPosts(List<dynamic> data) {
    return data.map((dynamic item) => Post.fromMap(item)).toList();
  }
}
