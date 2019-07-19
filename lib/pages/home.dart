import 'package:flutter/material.dart';
import 'package:instagram/models/comment.dart';
import 'package:instagram/models/global.dart';
import 'package:instagram/models/post.dart';
import 'package:instagram/models/user.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  static int page = 1;
  static Post the_post = post1;

  @override
  Widget build(BuildContext context) {
    Map<int, Widget> pageView = {
      1: getMain(),
      2: getLikes(the_post.likes),
      3: getComments(the_post.comments),
    };
    return pageView[page];
  }

  Widget getMain() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: 85,
              child: getStories(),
            ),
            Divider(),
            Column(
              children: getPosts(context),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> getPosts(BuildContext context) {
    List<Widget> posts = [];
    int index = 0;
    for (Post post in userPosts) {
      posts.add(getPost(post, index, context));
      index++;
    }

    return posts;
  }

  Widget getStories() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: getUserStories(),
    );
  }

  List<Widget> getUserStories() {
    List<Widget> stories = [];
    for (var user in user.following) {
      stories.add(getStory(user));
    }

    return stories;
  }

  Widget getStory(User follower) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundColor:
                        follower.hasStory ? Colors.red : Colors.grey,
                  ),
                ),
                Container(
                  height: 47,
                  width: 47,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  child: CircleAvatar(
                    backgroundImage: follower.profilePicture,
                  ),
                ),
                FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getPost(Post post, int index, BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      backgroundImage: post.user.profilePicture,
                    ),
                  ),
                  Text(post.user.username),
                ],
              ),
              IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints.expand(height: 1),
          color: Colors.grey,
        ),
        Container(
          constraints: BoxConstraints(maxHeight: 282),
          decoration: BoxDecoration(
            image: DecorationImage(image: post.image),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Stack(
                  alignment: Alignment(0, 0),
                  children: <Widget>[
                    Icon(Icons.favorite,
                        size: 30,
                        color: post.isLiked ? Colors.red : Colors.black),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      color: post.isLiked ? Colors.red : Colors.white,
                      onPressed: () {
                        setState(() {
                          userPosts[index].isLiked =
                              post.isLiked ? false : true;
                          if (!post.isLiked) {
                            post.likes.remove(user);
                          } else {
                            post.likes.add(user);
                          }
                        });
                      },
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment(0, 0),
                  children: <Widget>[
                    Icon(
                      Icons.mode_comment,
                      size: 30,
                      color: Colors.black,
                    ),
                    IconButton(
                      icon: Icon(Icons.mode_comment),
                      color: Colors.white,
                      onPressed: () {
//TODO: implement comment's onclick handler - https://trello.com/c/Q71NumCW/3-implement-comments-onclick-handler
                      },
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment(0, 0),
                  children: <Widget>[
                    Icon(
                      Icons.send,
                      size: 30,
                      color: Colors.black,
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      color: Colors.black,
                      onPressed: () {
//TODO: implment send's onclick hanlder  - https://trello.com/c/B247545g/4-implment-sends-onclick-hanlder
                      },
                    )
                  ],
                ),
              ],
            ),
            Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Icon(Icons.bookmark, size: 30, color: Colors.black),
                IconButton(
                  icon: Icon(Icons.bookmark),
                  color: post.isSaved ? Colors.black : Colors.white,
                  onPressed: () {
                    setState(() {
                      userPosts[index].isSaved = post.isSaved ? false : true;
                      if (!post.isSaved) {
                        user.savedPosts.remove(post);
                      } else {
                        user.savedPosts.add(post);
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        FlatButton(
          child: Text(
            post.likes.length.toString() + " likes",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            setState(() {
              page = 2;
              the_post = post;
              build(context);
            });
          },
        ),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15, right: 10),
              child: Text(
                post.user.username,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              post.description,
            )
          ],
        ),
        FlatButton(
          child:
              Text("View all " + post.comments.length.toString() + " comments"),
          onPressed: () {
            setState(() {
              page = 3;
              build(context);
            });
          },
        )
      ],
    ));
  }

  Widget getLikes(List<User> likes) {
    List<Widget> likers = [];
    for (var follower in likes) {
      likers.add(new Container(
        height: 45,
        padding: EdgeInsets.all(10),
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(follower.username,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: FlatButton(
                  color: user.following.contains(follower)
                      ? Colors.white
                      : Colors.blue,
                  child: Text(
                      user.following.contains(follower)
                          ? "Following"
                          : "Follow",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: user.following.contains(follower)
                              ? Colors.grey
                              : Colors.white)),
                  onPressed: () {
                    setState(() {
                      if (user.following.contains(follower)) {
                        user.following.remove(follower);
                      } else {
                        user.following.add(follower);
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          onPressed: () {},
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Likes",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              page = 1;
              build(context);
            });
          },
        ),
      ),
      body: ListView(
        children: likers,
      ),
    );
  }

  Widget getComments(List<Comment> comments) {
    List<Widget> commenters = [];
    DateTime now = DateTime.now();
    for (var c in comments) {
      int hoursAgo = (now.hour) - (c.dateOfComment.hour - 1);
      commenters.add(new Container(
        padding: EdgeInsets.all(10),
        child: FlatButton(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 30,
                width: 30,
                margin: EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  backgroundImage: c.user.profilePicture,
                ),
              ),
              Column(
                children: <Widget>[
                  RichText(
                    text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text: c.user.username,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          new TextSpan(text: ''),
                          new TextSpan(text: c.comment),
                        ]),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10, top: 20),
                        child: Text(hoursAgo.toString() + "h"),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10, top: 20),
                        child: Text("like"),
                      ),
                      Container(
                        child: Text("Reply"),
                        margin: EdgeInsets.only(right: 10, top: 20),
                      ),
                    ],
                  ),
                ],
              ),
              Stack(
                alignment: Alignment(0, 0),
                children: <Widget>[
                  Container(
                    child: Icon(Icons.favorite, color: Colors.black, size: 15),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: c.isLiked ? Colors.black : Colors.white,
                        size: 10,
                      ),
                      onPressed: () {
                        setState(() {
                          c.isLiked = c.isLiked ? false : true;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          onPressed: () {},
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        page = 1;
                        build(context);
                      });
                    },
                  ),
                  Text("Comments",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.black,
                ),
                onPressed: () {
                  print("Send");
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: commenters,
        ),
      ),
    );
  }
}
