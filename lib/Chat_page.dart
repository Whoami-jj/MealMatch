// import 'dart:js_interop';
//
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:meal_match/consts.dart';
//
// class ChatPageScreen extends StatefulWidget {
//   const ChatPageScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ChatPageScreen> createState() => _ChatPageScreenState();
// }
//
// class _ChatPageScreenState extends State<ChatPageScreen> {
//   final _openAi = OpenAI.instance.build(
//     token: OPENAI_API_KEY,
//     baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 20)),
//     enableLog: true,
//   );
//   final ChatUser _currentUser = ChatUser(
//     id: '1',
//     firstName: "Junaid",
//     lastName: 'Akram',
//   );
//   final ChatUser _assistant = ChatUser(
//     id: '2',
//     firstName: "Assistant",
//     lastName: 'Response',
//   );
//   List<ChatMessage> _messages = <ChatMessage>[];
//   List<ChatUser> _typingUsers = <ChatUser>[];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(0, 166, 125, 1),
//         title: Center(
//           child: Text(
//             'Meal Match Assistant',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//       body: DashChat(
//           currentUser: _currentUser,
//           typingUsers: _typingUsers,
//           messageOptions: const MessageOptions(
//             currentUserContainerColor: Colors.black,
//             containerColor: Color.fromRGBO(0, 166, 125, 1),
//             textColor: Colors.white,
//           ),
//           onSend: (ChatMessage m) {
//             getChatResponse(m);
//           },
//           messages: _messages),
//     );
//   }
//
//   Future<void> getChatResponse(ChatMessage m) async {
//     setState(() {
//       _messages.insert(0, m);
//       _typingUsers.add(_assistant);
//     });
//
//     List<Messages> _messagesHistory = _messages.reversed.map((m) {
//       if (m.user == _currentUser) {
//         return Messages(role: Role.user, content: m.text);
//       } else {
//         return Messages(role: Role.assistant, content: m.text);
//       }
//     }).toList();
//     final request = ChatCompleteText(
//         model: GptTurbo0301ChatModel(),
//         messages: _messagesHistory,
//         maxToken: 20);
//     final response = await _openAi.onChatCompletion(request: request);
//     for(var element in response!.choices)
//     {
//       if(element.message!=null)
//       {
//         setState(() {
//           _messages.insert(0, ChatMessage(user: _assistant, createdAt: DateTime.now(),text: element.message!.content));
//         });
//       }
//     }
//     setState(() {
//       _typingUsers.remove(_assistant);
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Chat Bot',
      home: ChatPageScreen(),
    );
  }
}

class ChatPageScreen extends StatefulWidget {
  @override
  _ChatPageScreenState createState() => _ChatPageScreenState();
}

class _ChatPageScreenState extends State<ChatPageScreen> {
  TextEditingController _messageController = TextEditingController();
  List<String> _chatHistory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Chat Bot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chatHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_chatHistory[index]),
                  leading: Icon(FontAwesomeIcons.user),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => sendMessage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      // Simple rule-based responses
      String response;
      if (message.toLowerCase().contains('hello')) {
        response = 'Hi there!';
      } else if (message.toLowerCase().contains('how are you')) {
        response = 'I\'m doing well, thank you!';
      } else {
        response = 'I didn\'t understand that.';
      }

      setState(() {
        _chatHistory.add('User: $message');
        _chatHistory.add('Bot: $response');
      });

      _messageController.clear();
    }
  }
}
