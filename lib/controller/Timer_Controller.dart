import 'package:amity2/controller/Audio_Controller.dart';
import 'package:amity2/util/Import_Package.dart';
import 'package:amity2/view/Body_Language_Team.dart';

class TimerController extends GetxController{
  final audioController = Get.put(AudioController());
  RxInt time = 0.obs;
  Timer? timer;

  ///현재 게임 초성게임: 1, 폭탄게임 : 2, 몸으로말해요 개인전:3, 팀전:4,가사보고 노래맞추기 :5
  int currentGame = 0;
  void start() {
    audioController.audioClock();
    timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if(time.value > 0) {
        time.value--;
      } else if(time.value == 0){
        timer.cancel();
        time.value = -100;
        if(currentGame == 1){
          audioController.clockSfx.stop();
          Get.put(DialogController()).gameOver();
        }else if(currentGame == 2){

        }else if(currentGame == 3){

        }else if(currentGame == 4){
          Get.put(BodyLanguageTeamController()).result.add({Get.put(BodyLanguageTeamController()).currentTeam.value : Get.put(BodyLanguageTeamController()).correct.value});
          Get.put(BodyLanguageTeamController()).result.sort((a,b)=> a.values.first.compareTo(b.values.first));
          audioController.clockSfx.stop();
          Get.put(DialogController()).teamResult();
        }else if(currentGame == 5){

      }
    }});
  }


  void pass() {
    time.value = int.parse(Get.put(SettingController()).selectedTimer.value);
  }

  void pause(){
    audioController.clockSfx.stop();
    timer?.cancel();
  }
}