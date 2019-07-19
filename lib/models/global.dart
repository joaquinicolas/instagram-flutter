import 'package:flutter/material.dart';
import 'package:instagram/models/comment.dart';
import 'package:instagram/models/post.dart';
import 'package:instagram/models/user.dart';

String title = "Instagram";

final User user = new User('joaquinnicolas', AssetImage('assets/my_profile.jpg'), [
  follower1,
  follower2,
  follower3,
  follower4,
], [
  follower1,
  follower2,
  follower3,
  follower4,
], [], [], false);

User follower1 = new User('the rock', AssetImage('assets/follower3.jpg'), [], [], [], [], true);
User follower2 = new User('miley_cyrus', AssetImage('assets/follower2.jpg'), [], [], [], [], false);
User follower3 = new User('kim_k', AssetImage('assets/follower3.jpg'), [], [], [], [], true);
User follower4 = new User('daredevil', AssetImage('assets/profile3.png'), [], [], [], [], true);
User follower5 = new User('batman', AssetImage('assets/profile6.jpg'), [], [], [], [], true);
User follower6 = new User('peter_griffin', AssetImage('assets/profile4.png'), [], [], [], [], false);


Post post1 = new Post(new AssetImage('assets/photo_1.jpeg'), user, "My first post", DateTime.now(), [follower1, follower2, follower3], [], false, false);
List<Post> userPosts = [
  new Post(new AssetImage('assets/photo_1.jpeg'), user, "My first post", DateTime.now(), [follower1, follower2, follower3, follower4, follower5, follower6], [
    new Comment(follower1, "This was amazing!", DateTime.now(), false),
    new Comment(follower2, "Cool one", DateTime.now(), false),
    new Comment(follower4, "This is no good at all \nbuddy, don't post this stuff", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('assets/post2.jpg'), follower1, "This is such a great post though", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This was super cool!", DateTime.now(), false),
    new Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "I'm batman", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('assets/photo4.jpg'), follower5, "How did I even take this photo??", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This was super cool!", DateTime.now(), false),
    new Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "I'm batman", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('assets/photo5.jpg'), follower3, "Found this in my backyard. \nThought I'd post it jk lol lol lolol", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This was super cool!", DateTime.now(), false),
    new Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "I'm batman", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('assets/photo5.jpg'), follower3, "Found this in my backyard. \nThought I'd post it jk lol lol lolol", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This was super cool!", DateTime.now(), false),
    new Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "I'm batman", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('assets/photo5.jpg'), follower3, "Found this in my backyard. \nThought I'd post it jk lol lol lolol", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This was super cool!", DateTime.now(), false),
    new Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "I'm batman", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('assets/photo5.jpg'), follower3, "Found this in my backyard. \nThought I'd post it jk lol lol lolol", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This was super cool!", DateTime.now(), false),
    new Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "I'm batman", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('assets/photo5.jpg'), follower3, "Found this in my backyard. \nThought I'd post it jk lol lol lolol", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This was super cool!", DateTime.now(), false),
    new Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "I'm batman", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('assets/photo5.jpg'), follower3, "Found this in my backyard. \nThought I'd post it jk lol lol lolol", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This was super cool!", DateTime.now(), false),
    new Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "I'm batman", DateTime.now(), false)
  ], false, false),

];