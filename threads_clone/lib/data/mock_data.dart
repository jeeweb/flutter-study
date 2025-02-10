import 'package:faker/faker.dart';

enum ActivityType {
  followed,
  replies,
  mentions,
  liked,
}

class PostSchema {
  final String username;
  final String userAvatar;
  final String time;
  final String contentText;
  final List<String> images;
  final int replies;
  final int likes;

  PostSchema({
    required this.username,
    required this.userAvatar,
    required this.time,
    required this.contentText,
    required this.replies,
    required this.likes,
    required this.images,
  });
}

class UserSchema {
  final String username;
  final String userAvatar;
  final String stateMessage;
  final String followers;

  UserSchema({
    required this.username,
    required this.userAvatar,
    required this.stateMessage,
    required this.followers,
  });
}

class ActivitySchema {
  final String username;
  final String userAvatar;
  final String message;
  final String stateMessage;
  final ActivityType activityType;
  final int timePast;

  ActivitySchema({
    required this.username,
    required this.userAvatar,
    required this.message,
    required this.stateMessage,
    required this.activityType,
    required this.timePast,
  });
}

final faker = Faker();

final List<PostSchema> mockData = [
  PostSchema(
    username: faker.person.name(),
    userAvatar: "https://avatars.githubusercontent.com/u/52396673?v=4",
    time: "2m",
    contentText: faker.lorem.sentence(),
    images: [
      "https://images.unsplash.com/photo-1738008896551-9ab767d9e6ac?q=80&w=2398&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    ],
    replies: faker.randomGenerator.integer(100),
    likes: faker.randomGenerator.integer(100),
  ),
  PostSchema(
    username: faker.person.name(),
    userAvatar:
        "https://images.unsplash.com/photo-1737412358025-160a0c22e6c5?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    time: "5m",
    contentText: faker.lorem.sentence(),
    images: [
      "https://images.unsplash.com/photo-1735596365888-ad6d151533f2?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://plus.unsplash.com/premium_photo-1732736768092-43a010784507?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ],
    replies: faker.randomGenerator.integer(100),
    likes: faker.randomGenerator.integer(100),
  ),
  PostSchema(
    username: faker.person.name(),
    userAvatar:
        "https://images.unsplash.com/photo-1738363436272-f191888a398b?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    time: "10m",
    contentText: faker.lorem.sentence(),
    images: [],
    replies: faker.randomGenerator.integer(100),
    likes: faker.randomGenerator.integer(100),
  ),
  PostSchema(
    username: faker.person.name(),
    userAvatar:
        "https://plus.unsplash.com/premium_photo-1728568724868-5d24ac1238ec?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    time: "10m",
    contentText: faker.lorem.sentence(),
    images: [],
    replies: faker.randomGenerator.integer(100),
    likes: faker.randomGenerator.integer(100),
  ),
  PostSchema(
    username: faker.person.name(),
    userAvatar:
        "https://images.unsplash.com/photo-1738316849619-747a83d4e979?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    time: "1h",
    contentText: faker.lorem.sentence(),
    images: [
      "https://images.unsplash.com/photo-1684262483735-1101bcb10f0d?q=80&w=2235&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    ],
    replies: faker.randomGenerator.integer(100),
    likes: faker.randomGenerator.integer(100),
  ),
  PostSchema(
    username: faker.person.name(),
    userAvatar:
        "https://images.unsplash.com/photo-1738509559266-bdd2a813c8ad?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    time: "2h",
    contentText: faker.lorem.sentence(),
    images: [
      "https://images.unsplash.com/photo-1733343397198-c28b11617d45?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1738430275589-2cd3d0d0d57a?q=80&w=2322&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1738273473785-99c1fc498c14?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    ],
    replies: faker.randomGenerator.integer(100),
    likes: faker.randomGenerator.integer(100),
  ),
];

final List<UserSchema> mockDataUsers = [
  UserSchema(
    username: faker.person.name(),
    userAvatar:
        "https://images.unsplash.com/photo-1738008896551-9ab767d9e6ac?q=80&w=2398&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    stateMessage: faker.lorem.word(),
    followers: "${faker.randomGenerator.integer(300)}K",
  ),
  UserSchema(
    username: faker.person.name(),
    userAvatar:
        "https://images.unsplash.com/photo-1738509559266-bdd2a813c8ad?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    stateMessage: faker.lorem.word(),
    followers: "${faker.randomGenerator.integer(300)}K",
  ),
  UserSchema(
    username: faker.person.name(),
    userAvatar:
        "https://images.unsplash.com/photo-1738447429433-69e3ecd0bdd0?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    stateMessage: faker.lorem.word(),
    followers: "${faker.randomGenerator.integer(300)}K",
  ),
  UserSchema(
    username: faker.person.name(),
    userAvatar:
        "https://images.unsplash.com/photo-1738914401186-618afe776956?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    stateMessage: faker.lorem.word(),
    followers: "${faker.randomGenerator.integer(300)}K",
  ),
  UserSchema(
    username: faker.person.name(),
    userAvatar:
        "https://images.unsplash.com/photo-1738956952892-7553e0327906?q=80&w=1169&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    stateMessage: faker.lorem.word(),
    followers: "${faker.randomGenerator.integer(300)}K",
  ),
  UserSchema(
    username: faker.person.name(),
    userAvatar:
        "https://images.unsplash.com/photo-1738830986753-7f4e8f3d18e1?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    stateMessage: faker.lorem.word(),
    followers: "${faker.randomGenerator.integer(300)}K",
  ),
  UserSchema(
    username: faker.person.name(),
    userAvatar:
        "https://plus.unsplash.com/premium_photo-1738614647383-0435fcb26a55?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    stateMessage: faker.lorem.word(),
    followers: "${faker.randomGenerator.integer(300)}K",
  ),
];

final List<ActivitySchema> mockDataActivities = [
  ActivitySchema(
    username: "john_mobbin",
    userAvatar:
        "https://images.unsplash.com/photo-1738008896551-9ab767d9e6ac?q=80&w=2398&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    stateMessage: faker.lorem.word(),
    activityType: ActivityType.mentions,
    message:
        "Here's a thread you should follow if you love botany @jane_mobbin",
    timePast: 4,
  ),
  ActivitySchema(
    username: "john_mobbin",
    userAvatar:
        "https://images.unsplash.com/photo-1738008896551-9ab767d9e6ac?q=80&w=2398&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    stateMessage: faker.lorem.word(),
    activityType: ActivityType.replies,
    message: "Count me in!",
    timePast: 4,
  ),
  ActivitySchema(
    username: "the.plantdads",
    userAvatar:
        "https://images.unsplash.com/photo-1738509559266-bdd2a813c8ad?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    stateMessage: faker.lorem.word(),
    activityType: ActivityType.followed,
    message: "",
    timePast: 5,
  ),
  ActivitySchema(
    username: "the.plantdads",
    userAvatar:
        "https://images.unsplash.com/photo-1738509559266-bdd2a813c8ad?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    stateMessage: "Definitely broken!",
    activityType: ActivityType.liked,
    message: "",
    timePast: 5,
  ),
  ActivitySchema(
    username: "theberryjungle",
    userAvatar:
        "https://plus.unsplash.com/premium_photo-1738614647383-0435fcb26a55?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    stateMessage: "🌱👀🧵",
    activityType: ActivityType.liked,
    message: "",
    timePast: 5,
  ),
];
