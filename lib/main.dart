import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TTSPage(),
    );
  }
}

class TTSPage extends StatefulWidget {
  @override
  _TTSPageState createState() => _TTSPageState();
}

class _TTSPageState extends State<TTSPage> {
  FlutterTts flutterTts = FlutterTts();
  TextEditingController textController = TextEditingController();

  Future<void> _speak() async {
    await flutterTts.setLanguage("zh-CN"); // 设置为中文
    await flutterTts.setPitch(1.0); // 语调
    await flutterTts.speak(textController.text); // 朗读文本
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AI 语音合成")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(labelText: "输入要朗读的文本"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _speak,
              child: Text("🔊 播放语音"),
            ),
          ],
        ),
      ),
    );
  }
}
