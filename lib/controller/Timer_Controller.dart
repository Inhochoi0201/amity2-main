import 'package:amity2/util/Import_Package.dart';
import 'package:amity2/view/BodyLanguagGame/Result.dart';

class TimerController extends GetxController{
  final audioController = Get.put(AudioController());
  RxInt time = 0.obs;
  Timer? timer;
  late int correctNum;
  bool isReady = false;
  ///현재 게임 초성게임: 1, 폭탄게임 : 2, 몸으로말해요 개인전:3, 팀전:4,가사보고 노래맞추기 :5
  int currentGame = 0;
  void start() {
    audioController.audioClock();
    timer = Timer.periodic(const Duration(milliseconds: 1300), (timer) {
      if(time.value > 0) {
        time.value--;
      } else if(time.value == 0){
        timer.cancel();
        time.value = -100;
        if(currentGame == 1){
          audioController.clockSfx.stop();
          Get.put(DialogController()).gameOver(currentGame);
        }else if(currentGame == 2){
          audioController.clockSfx.stop();
          Get.put(DialogController()).gameOver(currentGame);
        }else if(currentGame == 3){
          audioController.clockSfx.stop();
          Get.put(SettingController()).playerList.sort((b,a)=> a.score.compareTo(b.score));
          Get.put(SettingController()).update();
          Get.to(()=> const ResultSolo(), opaque: false, fullscreenDialog: true);
        }else if(currentGame == 4){
          Get.put(BodyLanguageTeamController()).saveData();
          audioController.clockSfx.stop();
          isReady = true;
          Get.to(()=> const Result());
          correctNum = 0;
          update();
        }else if(currentGame == 5){
          audioController.clockSfx.stop();
          Get.put(DialogController()).gameOver(currentGame);
      }
    }});
  }


  void pass() {
    time.value = int.parse(Get.put(SettingController()).selectedTimer.value);
  }

  void pause(){
    audioController.clockSfx.stop();
    timer?.cancel();
    update();
  }
}