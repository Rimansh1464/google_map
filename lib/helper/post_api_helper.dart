import 'dart:convert';


import 'package:apicalling/model/post.dart';
import 'package:http/http.dart' as http;
class PostAPIHelper{
  PostAPIHelper._();

 static final PostAPIHelper postAPIHelper = PostAPIHelper._();

  Future<Post?> fetchSinglePost()async{
    http.Response response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/2"));
 print("+++++++++++++++++++++++++++++++++++++++++++++");
 print("+++++++++++++++++++++++++++++++++++++++++++++");
 print(response.body);
 print("+++++++++++++++++++++++++++++++++++++++++++++");
 print("+++++++++++++++++++++++++++++++++++++++++++++");

 if(response.statusCode ==200){
   Map<String,dynamic> decodedData = jsonDecode(response.body);

   Post post = Post.fromMap(data:decodedData);

   return post;
 }
 return null;
  }
}