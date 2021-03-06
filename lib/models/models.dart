import 'package:flutter/material.dart';

////introductionGoasl/////
List<int> select = List<int>();
List<String> selectGoals = List<String>();

////
// DateTime startTime;
// DateTime endTime;
// dynamic fastLength;
// String formattedTimeStart = "08:00";
// String formattedTimeEnd = "08:00";
///////

UserDetails userDetails;

///User
class UserDetails {
  final String userEmail;
  final String userUid;
  final String fastType;
  final String fastingHour;
  final List goals;
  final String fastStartTime;
  final String fastEndTime;
  final String userpic;
  final String userWeight;
  final String username;
  bool active;
  final String fastingHoursLeft;
  final String fastStartedAt;

  final String docid;

  UserDetails({
    @required this.userEmail,
    @required this.userUid,
    @required this.fastingHoursLeft,
    @required this.userWeight,
    @required this.active,
    @required this.fastType,
    @required this.fastEndTime,
    @required this.fastingHour,
    @required this.fastStartedAt,
    @required this.fastStartTime,
    @required this.goals,
    @required this.username,
    @required this.userpic,
    @required this.docid,
  });
}

//Post

class PostDetails {
  final String postUsername;
  final String time;
  final String postUserPic;
  final String postUserid;
  final String postPic;
  final String postCaption;
  final String likesNumber;
  final String commentsNumber;

  PostDetails({
    @required this.postUsername,
    @required this.time,
    @required this.postUserPic,
    @required this.postUserid,
    @required this.postPic,
    @required this.postCaption,
    @required this.likesNumber,
    @required this.commentsNumber,
  });
}

//fetchedpost
class FetchedPostDetails {
  final String postUsername;
  final String time;
  final String postUserPic;
  final String postUserid;
  final String postPic;
  final String postCaption;
  String likesNumber;
  String commentsNumber;
  final String postid;

  FetchedPostDetails({
    @required this.postUsername,
    @required this.time,
    @required this.postUserPic,
    @required this.postUserid,
    @required this.postPic,
    @required this.postCaption,
    @required this.likesNumber,
    @required this.commentsNumber,
    @required this.postid,
  });
}

///////Searchd User///////////

List<FetchedAllUser> allusers = [];

List<FetchedAllUser> searchedUsers = [];

class FetchedAllUser with ChangeNotifier {
  final String userEmail;
  final String userUid;
  final String userpic;
  final String username;
  final String userage;
  final String following;
  bool blocked;
  String followers;
  final String posts;
  final String docid;
  FetchedAllUser({
    @required this.userEmail,
    @required this.followers,
    @required this.following,
    @required this.blocked,
    @required this.posts,
    @required this.userUid,
    @required this.userage,
    @required this.username,
    @required this.userpic,
    @required this.docid,
  });
}
////////Following followers Model////////

List<FollowingFollowers> followfollowing = [];

class FollowingFollowers with ChangeNotifier {
  final String userUid;
  final String userpic;
  final String username;

  FollowingFollowers({
    @required this.userUid,
    @required this.username,
    @required this.userpic,
  });
}
