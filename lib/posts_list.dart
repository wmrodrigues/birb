import 'package:birb/models/post.dart';
import 'package:birb/post_item.dart';
import 'package:flutter/material.dart';

import 'no_content.dart';
import 'post_item.dart';
import 'models/post.dart';

class PostsList extends StatelessWidget {
  const PostsList(this.posts);
  final Stream<List<Post>> posts;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
      stream: posts,
      builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        switch(snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Text('Loading...');
          default:
            if (snapshot.data.isEmpty) {
              return const NoContent();
            }

            return _itemList(snapshot.data);
        }
      },
    );
  }

  ListView _itemList(List<Post> items) {
    return ListView(
      children: items.map((Post post) {
        return PostItem(post);
      }).toList(),
    );
  }
}