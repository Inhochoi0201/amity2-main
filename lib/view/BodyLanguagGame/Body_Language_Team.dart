import 'package:amity2/model/Team.dart';
import 'package:amity2/util/Import_Package.dart';

class BodyLanguageTeam extends StatelessWidget {
  BodyLanguageTeam({Key? key}) : super(key: key);
  final controller = Get.put(BodyLanguageTeamController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    return WillPopScope(
      onWillPop: () {
        Get.put(DialogController()).back();
       return Future(() => false);
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          height: Get.width,
          width: Get.width,
          child: Column(
            children: [
              Obx(
                ()=>IconRoundedProgressBar(
                  percent: controller.timer.time.value > 0 ? (controller.timer.time/(int.parse(controller.setting.selectedMinuteTimer.value) * 60)) * 100 : 0.01,
                  childCenter: Text(controller.setting.timeVisibleMode.value ? '가림막 모드' :
                  controller.timer.time.value > 0 ? controller.timer.time.value.toString() : '0', style: TextStyle(color: const Color(0xff4169e1), fontSize: 9.sp, fontWeight: FontWeight.bold,fontFamily: 'OneTitle'),),
                  childRight: Text('현재 팀: ${controller.currentTeam + 1}팀', style: TextStyle(fontSize: 13.sp, color:  const Color(0xff4169e1)),),
                  height: 60.h,
                  widthIconSection: 50,
                  icon: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Icon(Icons.timer, size: 50.r, color:const Color(0xffaecdff),),
                  ),
                 style: RoundedProgressBarStyle(
                   colorBackgroundIcon: Colors.white,
                   colorProgress: const Color(0xffaecdff),
                   colorBorder: Colors.white,
                   colorProgressDark: Colors.white,
                 ),
                  margin: EdgeInsets.symmetric(vertical: 16.h),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              ///'영화','애니','웹툰','인물','물건','음악'
              Expanded(
                child: GetBuilder<BodyLanguageTeamController>(
                  init: controller,
                  builder: (value) {
                    return Row(
                      children: [
                         InkWell(
                              onTap: () {
                               if(!controller.timer.isReady){
                                 Get.put(AudioController()).audioClick();
                                 controller.timer.correctNum++;
                                 controller.i.value++;
                                 controller.update();
                               }else{
                                 Get.snackbar('준비상태입니다.', '패스를 누르면 바로 시작합니다.',
                                   snackPosition: SnackPosition.TOP,
                                   forwardAnimationCurve: Curves.elasticInOut,
                                   reverseAnimationCurve: Curves.easeOut,);
                               }
                              },
                              child: Container(
                                width: Get.width * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xff6495ED),
                                ),
                                child: Center(
                                  child: Text(
                                    '정답\n${controller.timer.correctNum}',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  textAlign: TextAlign.center,),
                                ),
                              ),
                            ),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Center(
                                child: Text( controller.wordList[controller.i.value],
                                  style: TextStyle(fontSize: controller.wordList[controller.i.value].length > 8 ? 48.sp : 60.sp,fontFamily: 'OneTitle'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ),
                        InkWell(
                          onTap: () {
                            if(controller.timer.isReady){
                              Get.put(AudioController()).audioNext();
                              controller.nextTeam();
                              controller.timer.isReady = false;
                            }else{
                              controller.i.value++;
                              controller.update();
                            }

                          },
                          child: Container(
                            width: Get.width * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffFA8072),
                            ),
                            child: Center(
                              child: Text(
                                '패스',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                ),
              ),
            ]),
          ),
        ));
  }
}

class BodyLanguageTeamController extends GetxController{
  final timer = Get.put(TimerController());
  final audio = Get.put(AudioController());
  final setting = Get.put(SettingController());
  final theme = Get.put(ThemeController());
  List<String> wordList = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    timer.isReady = false;
    timer.correctNum = 0;
    if(Get.put(SettingController()).selectedTheme.value == '영화'){
      theme.movie.shuffle();
      wordList.assignAll(theme.movie);
    }else if(Get.put(SettingController()).selectedTheme.value == '애니'){
      theme.animation.shuffle();
      wordList.assignAll(theme.animation);
    }else if(Get.put(SettingController()).selectedTheme.value == '웹툰'){
      theme.webtoon.shuffle();
      wordList.assignAll(theme.webtoon);
    }else if(Get.put(SettingController()).selectedTheme.value == '인물'){
      theme.celeb.shuffle();
      wordList.assignAll(theme.celeb);
    }else if(Get.put(SettingController()).selectedTheme.value == '물건'){
      theme.product.shuffle();
      wordList.assignAll(theme.product);
    }else if(Get.put(SettingController()).selectedTheme.value == '음악'){
      theme.music.shuffle();
      wordList.assignAll(theme.music);
    }
    timer.time.value = int.parse(Get.put(SettingController()).selectedMinuteTimer.value) * 60; //타이머 설정
    timer.start();
  }

  RxInt i =0.obs;
  int currentTeam = 0;

  List<Team> result = [];

  saveData(){
    result.add(Team( name: '${currentTeam + 1}', score: timer.correctNum));
    result.sort((b,a) => a.score.compareTo(b.score));
  }

  nextTeam(){
    i.value++;
    currentTeam++;
    timer.time.value = int.parse(Get.put(SettingController()).selectedMinuteTimer.value) * 60;
    timer.start();
    update();
  }
}