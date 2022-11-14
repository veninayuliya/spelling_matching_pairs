import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final player = AudioPlayer();

  static Future playAudio(String audio) async {
    await AudioCache().play('audios/$audio.mp3');
  }
}
