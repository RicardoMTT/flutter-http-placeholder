import 'package:flutter/material.dart';
import 'package:jsonplaceholderflutter/futures/get_post_future.dart';

class PostDetails extends StatelessWidget {
  final int id;
  const PostDetails({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostFuture _postFuture = new PostFuture();

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Container(
          child: FutureBuilder(
        future: _postFuture.fetchPostItem(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(child: Text(snapshot.data.title.toString()));
          } else if (snapshot.hasError) {
            return Text(snapshot.data);
          }
          return CircularProgressIndicator();
        },
      )),
    );
  }
}
