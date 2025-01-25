import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

List<String> audioUrl1 = [
  'assets/audio/work_it_1.mp3',
  'assets/audio/make_it_1.mp3',
  'assets/audio/do_it_1.mp3',
  'assets/audio/makes_us_1.mp3',
  'assets/audio/harder_1.mp3',
  'assets/audio/better_1.mp3',
  'assets/audio/faster_1.mp3',
  'assets/audio/stronger_1.mp3',
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 29, 194, 43),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    playFromUrl(0);
                  },
                  child: Text("W o r k i t"),
                ),
                ElevatedButton(
                  onPressed: () {
                    playFromUrl(1);
                  },
                  child: Text("M a k e i t"),
                ),
                ElevatedButton(
                  onPressed: () {
                    playFromUrl(2);
                  },
                  child: Text("D o i t"),
                ),
                ElevatedButton(
                  onPressed: () {
                    playFromUrl(3);
                  },
                  child: Text("M a k e s u s"),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    playFromUrl(4);
                  },
                  child: Text("H a r d e r"),
                ),
                ElevatedButton(
                  onPressed: () {
                    playFromUrl(5);
                  },
                  child: Text("B e t t e r"),
                ),
                ElevatedButton(
                  onPressed: () {
                    playFromUrl(6);
                  },
                  child: Text("F a s t e r"),
                ),
                ElevatedButton(
                  onPressed: () {
                    playFromUrl(7);
                  },
                  child: Text("S t r o n g e r"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void playFromUrl(int index) async {
    String url = audioUrl1[index];
    try {
      await player.setAsset(url);
      player.play();
    } catch (e) {
      print("Error loading audio: $e");
    }
  }
}
