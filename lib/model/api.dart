import 'package:apicalling/model/post.dart';
import 'package:flutter/material.dart';

import '../helper/post_api_helper.dart';

class apicalling extends StatefulWidget {
  const apicalling({Key? key}) : super(key: key);

  @override
  State<apicalling> createState() => _apicallingState();
}

class _apicallingState extends State<apicalling> {
  gesinglepost()async {
    Post? post = await PostAPIHelper.postAPIHelper.fetchSinglePost();
    print("""""""""""""""""""""""""""""""""""object""""""""""""""""""""""""""""""""""");
    print("""""""""""""""""""""""""""""""""""object""""""""""""""""""""""""""""""""""");
    print(post?.id);
    print("""""""""""""""""""""""""""""""""""object""""""""""""""""""""""""""""""""""");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("API calling"),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {gesinglepost();},
                    child: Text("Post"),
                    style: ButtonStyle()),
                TextButton(
                    onPressed: () {},
                    child: Text("comment"),
                    style: ButtonStyle()),
                TextButton(
                    onPressed: () {},
                    child: Text("albums"),
                    style: ButtonStyle()),
                TextButton(
                    onPressed: () {},
                    child: Text("photos"),
                    style: ButtonStyle()),TextButton(
                    onPressed: () {},
                    child: Text("todos"),
                    style: ButtonStyle()), TextButton(
                    onPressed: () {},
                    child: Text("users"),
                    style: ButtonStyle()),
                Text("")
              ],
            ),
          ),
        ));
  }
}
