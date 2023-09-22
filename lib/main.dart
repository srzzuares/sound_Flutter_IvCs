import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CsSuar',
      theme: ThemeData.dark(),
      home: const DefaultPage(title: 'Sonido en Flutter - 200527'),
    );
  }
}

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key, required this.title});

  // final player = AudioPlayer();
  // AudioPlayer audioPlayer = AudioPlayer();
  //Source source = Source("assets/sounds/yamete_kudasai.mp3");

  /* @override
  void initState() {
    super.initState();
    audioPlayer.setSource(AssetSource("assets/sounds/1.mp3"));
  } */
  final String title;

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ejecutando Sonido desde el Boton flotante',
              style: TextStyle(fontFamily: 'Rady', fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // ignore: deprecated_member_use
          Soundpool pool = Soundpool(streamType: StreamType.music);
          int soundId = await rootBundle
              .load("asset/sounds/Dubstep.mp3")
              .then((ByteData soundData) {
            return pool.load(soundData);
          });
          // ignore: unused_local_variable
          int streamId = await pool.play(soundId);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

            /* child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(children: [
              /* ElevatedButton(
                  onPressed: () {
                    _soundbutton();
                    // audioPlayer.play(UrlSource('assets/sounds/1.mp3'));
                  },
                  child: Text('texttt')) */
            ]),
          ),
        ), */


/* Future<void> _soundbutton() async {
    Soundpool pool = Soundpool(streamType: StreamType.notification);

    int soundId =
        await rootBundle.load("`assets/1.mp3").then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  } */