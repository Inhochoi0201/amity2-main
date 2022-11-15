import 'package:amity2/util/Import_Package.dart';

class AudioController extends GetxController{
  final sfxPlayer = AudioPlayer();
  final clockSfx = AudioPlayer();

  Future audioNext() async{
    await sfxPlayer.setVolume(75);
    await sfxPlayer.setSpeed(1);
    await sfxPlayer.setAsset('assets/sfx/next.wav');
    sfxPlayer.play();
  }
  Future audioClick() async{
    await sfxPlayer.setVolume(75);
    await sfxPlayer.setSpeed(1);
    await sfxPlayer.setAsset('assets/sfx/click.mp3');
  }

  Future audioClock() async{
    await clockSfx.setVolume(120);
    await clockSfx.setSpeed(1);
    await clockSfx.setAsset('assets/sfx/clock.wav');
    clockSfx.play();
  }

  Future audioGameover() async{
    await sfxPlayer.setVolume(75);
    await sfxPlayer.setSpeed(1);
    await sfxPlayer.setAsset('assets/sfx/gameover.mp3');
    sfxPlayer.play();
  }

}