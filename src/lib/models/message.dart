import 'package:chats_app/models/user.dart';

class Message {
  final User? sender;
  final String? text;
   final String? time;

  Message({
    this.sender,
    this.text,
    this.time,
  });
}

/*
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/greg.jpg',
);
*/

// USERS

final User garbet = User(
  id: 1,
  name: 'Garbet',
  imageUrl: 'assets/images/garbet.jpg',
);
final User scott = User(
  id: 2,
  name: 'Scott Hillen',
  imageUrl: 'assets/images/dog.jpg',
);
final User steven = User(
  id: 3,
  name: 'Steven',
  imageUrl: 'assets/images/steven.jpg',
);
final User sunny = User(
  id: 4,
  name: 'Sunny',
  imageUrl: 'assets/images/sunny.jpg',
);
final User shiba = User(
  id: 5,
  name: 'Shibaa',
  imageUrl: 'assets/images/cheme.jpg',
);
final User cherish = User(
  id: 6,
  name: 'Cherish',
  imageUrl: 'assets/images/mina.jpg',
);
final User oto = User(
  id: 7,
  name: 'Oto Ai',
  imageUrl: 'assets/images/oto.jpg',
);

// FAVORITE CONTACTS
List<User> quicks = [cherish, steven, oto, sunny, garbet, shiba];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: garbet,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today ?',
  ),
  Message(
    sender: scott,
    time: '4:30 PM',
    text: 'Hello, how was the interview ? I\'m so worry',
  ),
  Message(
    sender: sunny,
    time: '3:30 PM',
    text: 'I am going to see u next week',
  ),
  Message(
    sender: cherish,
    time: '4:01 PM',
    text: 'Luv you',
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Meet me at 10 am next Monday',
  ),
  Message(
    sender: shiba,
    time: '12:30 PM',
    text: 'Hahaha',
  ),
  Message(
    sender: oto,
    time: '11:30 AM',
    text: 'Let\'s eat something !',
  ),
];

List<Message> messages = [
  Message(
    sender: cherish,
    time: '4:01 PM',
    text: 'Luv u',
  ),
  Message(
    sender: cherish,
    time: '4:00 PM',
    text: 'Bye :)',
  ),
  Message(
    sender: currentUser,
    time: '3:51 PM',
    text: 'Ok! Have fun. I have to go out to buy some foods for dinner. Bye bye!',
  ),
  Message(
    sender: cherish,
    time: '3:49 PM',
    text: 'Yup!',
  ),
  Message(
    sender: currentUser,
    time: '3:48 PM',
    text: 'In your room ?',
  ),
  Message(
    sender: cherish,
    time: '3:46 PM',
    text: 'Just watching movie with my friends. The film is really amazing!',
  ),
  Message(
    sender: currentUser,
    time: '3:46 PM',
    text: 'What are you doing?',
  ),
  Message(
    sender: currentUser,
    time: '3:45 PM',
    text: 'No you done! Just eat what u like',
  ),
  Message(
    sender: cherish,
    time: '2:35 PM',
    text: 'I think I am fatter',
  ),
  Message(
    sender: cherish,
    time: '2:35 PM',
    text: 'All the food',
  ),
  Message(
    sender: currentUser,
    time: '2:32 PM',
    text: 'Nice!',
  ),
  Message(
    sender: cherish,
    time: '2:00 PM',
    text: 'I ate so much food today.',
  ),
];

final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/cheme.jpg',
);