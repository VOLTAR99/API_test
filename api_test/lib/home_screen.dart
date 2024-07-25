import 'package:api_test/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:api_test/models/post.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  List<Welcome>? post;
  var isLoaded = false;

  @override
  void initState() {
    getData();
  }

  getData() async {
    post = await RemoteService().getPosts();
    if (post != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('API TEST'),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
            itemCount: post?.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post![index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      maxLines: 3,
                    ),
                    Text(
                      post![index].body ?? '',
                      style: TextStyle(),
                      maxLines: 3,
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
