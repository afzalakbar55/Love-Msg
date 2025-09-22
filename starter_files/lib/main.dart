
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final data = await rootBundle.loadString('assets/messages.json');
  final Map<String, dynamic> messages = json.decode(data);
  runApp(LoveMessageApp(messages: messages));
}

class LoveMessageApp extends StatelessWidget {
  final Map<String, dynamic> messages;
  LoveMessageApp({required this.messages});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Love Message Generator',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MessageHome(messages: messages),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MessageHome extends StatefulWidget {
  final Map<String, dynamic> messages;
  MessageHome({required this.messages});

  @override
  _MessageHomeState createState() => _MessageHomeState();
}

class _MessageHomeState extends State<MessageHome> {
  String message = "Choose a category to get a message ❤️";
  final Random _rnd = Random();

  List<String> getMessages(String category) {
    final list = widget.messages[category] as List<dynamic>?;
    if (list == null) return [];
    return list.map((e) => e.toString()).toList();
  }

  void showRandom(String category) {
    final msgs = getMessages(category);
    if (msgs.isEmpty) return;
    setState(() {
      message = msgs[_rnd.nextInt(msgs.length)];
    });
  }

  void copyMessage() {
    Clipboard.setData(ClipboardData(text: message));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Message copied to clipboard")));
  }

  @override
  Widget build(BuildContext context) {
    final categories = widget.messages.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Love Message Generator ❤️"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: categories.map((cat) {
                return ElevatedButton(
                  onPressed: () => showRandom(cat),
                  child: Text(cat),
                );
              }).toList(),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: copyMessage,
                    icon: Icon(Icons.copy),
                    label: Text("Copy Message"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
