import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jsonplaceholderflutter/futures/get_post_future.dart';
import 'package:jsonplaceholderflutter/screens/details/post_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  PostFuture _postFuture = new PostFuture();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: Center(
          child: FutureBuilder(
            future: _postFuture.fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${snapshot.data[index].id}"),
                      onTap: () {
                        Get.to(PostDetails(
                          id: snapshot.data[index].id,
                        ));
                      },
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
