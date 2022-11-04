import 'package:amity2/util/Import_Package.dart';
import 'package:amity2/util/Theme.dart';


class BodyLanguageTeam extends StatelessWidget {
  BodyLanguageTeam({Key? key}) : super(key: key);
  final timer = Get.put(TimerController());
  final audioController = Get.put(AudioController());
  final controller = Get.put(SettingController());
  final gameController = Get.put(BodyLanguageTeamController());
  final themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    return WillPopScope(
      onWillPop: ()=> Future(() => false),
      child: Scaffold(
        body: Container(
          color: Colors.white,
          height: Get.width,
          width: Get.width,
          child: Column(
            children: [
              Obx(
                ()=>IconRoundedProgressBar(
                  percent: (timer.time/(int.parse(controller.selectedMinuteTimer.value) * 60)) * 100,
                  childCenter: Text(controller.timeVisibleMode.value ? '가림막 모드' : timer.time.value.toString(), style: TextStyle(color: const Color(0xff4169e1), fontSize: 9.sp, fontWeight: FontWeight.bold,fontFamily: 'OneTitle'),),
                  childRight: Text('현재 팀: ${gameController.currentTeam.value}팀', style: TextStyle(fontSize: 13.sp, color:  const Color(0xff4169e1)),),
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
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Obx(
                        ()=> Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Center(child: Text(
                          controller.selectedTheme.value == '영화' ?
                              themeController.movie[gameController.i.value] :
                          controller.selectedTheme.value == '애니' ?
                          themeController.animation[gameController.i.value] :
                          controller.selectedTheme.value == '웹툰' ?
                          themeController.webtoon[gameController.i.value] :
                          controller.selectedTheme.value == '인물' ?
                          themeController.celeb[gameController.i.value] :
                          controller.selectedTheme.value == '물건' ?
                          themeController.product[gameController.i.value] :
                          controller.selectedTheme.value == '음악' ?
                          themeController.music[gameController.i.value] :
                              '테마를 불러오던 중\n오류가 발생하였습니다.'
                    ,style: const TextStyle(fontFamily: 'OneTitle'),textAlign: TextAlign.center,),),
                        ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 5.h),
                height: 100.h,
                child: Obx(
                    ()=> Row(
                    children: [
                      InkWell(
                        onTap:(){
                          gameController.correct.value++;
                          gameController.i.value++;
                        },
                        child: Container(
                          width: Get.width/2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xff6495ED),
                          ),
                          child: Center(child: Text('정답 ${gameController.correct.value}개', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white),),),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      InkWell(
                        onTap: (){
                          gameController.i.value++;
                        },
                        child: Container(
                          width: (Get.width/2) -58.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xffFA8072),
                          ),
                          child: Center(child: Text('PASS', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp, color: Colors.white),),),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BodyLanguageTeamController extends GetxController{
  final themeController = Get.put(ThemeController());
  final timer = Get.put(TimerController());
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(Get.put(SettingController()).selectedTheme.value == '영화'){
      themeController.movie.shuffle();
    }else if(Get.put(SettingController()).selectedTheme.value == '애니'){
      themeController.animation.shuffle();
    }else if(Get.put(SettingController()).selectedTheme.value == '웹툰'){
      themeController.webtoon.shuffle();
    }else if(Get.put(SettingController()).selectedTheme.value == '인물'){
      themeController.celeb.shuffle();
    }else if(Get.put(SettingController()).selectedTheme.value == '물건'){
      themeController.product.shuffle();
    }else if(Get.put(SettingController()).selectedTheme.value == '음악'){
      themeController.music.shuffle();
    }
    timer.time.value = int.parse(Get.put(SettingController()).selectedMinuteTimer.value) * 60; //타이머 설정
    timer.start();
  }
  RxInt i =0.obs;
  RxInt currentTeam = 1.obs;
  RxInt correct = 0.obs;
  List<Map<int,int>> result = [];


  nextTeam(){
    if(int.parse(Get.put(SettingController()).selectedMoreTeam.value) > currentTeam.value){
        currentTeam.value++;
        correct.value = 0;
        timer.time.value = int.parse(Get.put(SettingController()).selectedMinuteTimer.value) * 60; //타이머 설정
        i.value++;
        timer.start();
    }else if(int.parse(Get.put(SettingController()).selectedMoreTeam.value) == currentTeam.value){
      currentTeam.value = 1;
    }
  }
}