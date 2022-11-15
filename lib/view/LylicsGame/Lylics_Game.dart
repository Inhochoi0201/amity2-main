import 'package:amity2/util/Import_Package.dart';


class LylicsGame extends StatelessWidget {
  LylicsGame({Key? key}) : super(key: key);
  final controller = Get.put(LylicsGameController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return WillPopScope(
      onWillPop: (){
        Get.put(DialogController()).back();
        return Future(() => false);
        },
      child: Scaffold(
        body: Column(
          children: [
            Obx(
                  ()=>IconRoundedProgressBar(
                percent: controller.timer.time.value > 0 ? (controller.timer.time/(int.parse(controller.setting.selectedMinuteTimer.value) * 60)) * 100 : 0.01,
                childCenter: Text(controller.setting.timeVisibleMode.value ? '가림막 모드' :
                controller.timer.time.value > 0 ? controller.timer.time.value.toString() : '0', style: TextStyle(color: const Color(0xff4169e1), fontSize: 15.sp, fontWeight: FontWeight.bold,fontFamily: 'OneTitle'),),
                height: 40.h,
                widthIconSection: 50,
                icon: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Center(child: SpinKitFoldingCube(color: const Color(0xffaecdff) ,size:  24.r,)),
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
            Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Center(child: Obx(()=> Text(controller.lylic.value,style: TextStyle(fontSize: 27.sp),textAlign: TextAlign.center,)),)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: (){
                      controller.isSpeak.value= true ;
                      controller.ttsStart();
                    },
                    child: Container(
                      width: 100.r,
                      height: 100.r,
                      decoration: const BoxDecoration(
                        color: Color(0xffaecdff),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(Icons.play_arrow, color: Colors.white, size: 100.r,),
                      ),
                    ),
                  ),
                SizedBox(width: 10.h,),
                InkWell(
                  onTap: (){
                    controller.isSpeak.value = false;
                    controller.ttsPause();
                  },
                  child: Container(
                    width: 100.r,
                    height: 100.r,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xffaecdff))
                    ),
                    child: Center(
                      child: Icon(Icons.pause, color: const Color(0xffaecdff), size: 100.r,),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      scoreInsert();
                    },
                    child: Container(
                      height: 62.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blueAccent
                      ),
                      child: Center(child: Text('정답', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white),),),
                    ),
                  ),
                  SizedBox(width: 7.w,),
                  InkWell(
                    onTap: () {
                      controller.next();
                    },
                    child: Container(
                      height: 62.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.redAccent
                      ),
                      child: Center(child: Text('패스', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white),),),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void scoreInsert(){
    controller.timer.pause();
    controller.ttsPause();
    Get.bottomSheet(
        isScrollControlled: true,
        WillPopScope(
          onWillPop: ()=>Future(() => false),
          child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.r,vertical: 15.h),
          height: Get.height * 0.7,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('정답을 맞출 플레이어를 선택해주세요.', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),
              SizedBox(height: 8.h,),
              Text('정답을 맞추는동안은 타이머가 흘러가지 않아요!',style: TextStyle(fontSize: 15.sp, color: Colors.red,),),
              SizedBox(height: 20.h,),
              SizedBox(
                height: 350.h,
                child: GridView.builder(
                    itemCount: controller.setting.playerList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      childAspectRatio: 190.w/62.h
                    ),
                    itemBuilder: (ctx,index)=> Obx(
                        ()=> InkWell(
                        onTap: ()=> controller.correctPlayer.value = index,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: controller.correctPlayer.value == index ? const Color(0xffaecdff) : Colors.white,
                            border: Border.all(color: const Color(0xffaecdff), width: 3),
                          ),
                          child: Center(child: Text(controller.setting.playerList[index].name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp, 
                              color: controller.correctPlayer.value == index ? Colors.white : const Color(0xffaecdff)),),),
                        ),
                      ),
                    )),
              ),
              InkWell(
                onTap: () {
                  controller.audio.audioClick();
                  Get.back();
                  Get.to(const Answer(), opaque: false,
                      duration: const Duration(milliseconds: 600),
                      transition: Transition.fadeIn);
                },
                child: Container(
                  height: 60.h,
                  width: Get.width - 20.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xffaecdff),
                  ),
                  child: Center(child: Text('정답확인', style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold, color: Colors.white),),),
                ),
              )
            ],
          ),
      ),
        )
    );
  }
}

class LylicsGameController extends GetxController{
  FlutterTts tts = FlutterTts();
  TextEditingController ttsController = TextEditingController();
  final timer = Get.put(TimerController());
  final setting = Get.put(SettingController());
  final music = Get.put(MusicController()).music;
  final audio = Get.put(AudioController());
  RxString lylic =''.obs;
  RxString title =''.obs;
  RxInt i = 0.obs;
  RxBool isSpeak = false.obs;
  RxInt correctPlayer = 100.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(music.isNotEmpty){
      music.shuffle();
    }
    tts.setLanguage('ko-KR');
    tts.setSpeechRate(0.4);
    title.value = music[i.value].substring(0,music[i.value].indexOf(':'));
    lylic.value = music[i.value].substring(music[i.value].indexOf(':')+1,music[i.value].length);
    ttsController.text = lylic.value;
  }

  @override
  void onReady(){
    super.onReady();
    ttsStart();
  }

  next(){
    ttsPause();
    correctPlayer.value = 100;
    i.value++;
    title.value = music[i.value].substring(0,music[i.value].indexOf(':'));
    lylic.value = music[i.value].substring(music[i.value].indexOf(':')+1,music[i.value].length);
    ttsController.text = lylic.value;
    update();
    ttsStart();
  }

  ttsStart() async{
    isSpeak.value = true;
    tts.speak(ttsController.text);
    update();
  }


  ttsPause(){
    isSpeak.value = false;
    tts.pause();
    update();
  }


}

class Answer extends GetView<LylicsGameController>{
  const Answer({super.key});

  @override
  // TODO: implement controller
  LylicsGameController get controller => super.controller;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.grey.withOpacity(0.2),
      child: WillPopScope(
        onWillPop: ()=> Future(() => false),
        child: Stack(
          children: [
            Positioned(
                left: 0,right: 0,bottom: 0, top: 0,
                child: Container()),
            Positioned(
              left: Get.width * 0.1,right: Get.width * 0.1,bottom: Get.height*0.25, top: Get.height*0.25,
              child: Container(
                padding: EdgeInsets.all(15.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xffaecdff))
                ),
                height: Get.height*0.5,
                width: Get.width * 0.8,
                child: Column(
                  children: [
                    Expanded(child: Center(child: Text(controller.title.value , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.sp,),textAlign: TextAlign.center,))),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          controller.setting.playerList[controller.correctPlayer.value].score++;
                          controller.setting.update();
                          Get.back();
                          controller.next();
                          controller.timer.start();
                        },
                        child: Container(
                          height: 62.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blueAccent,
                          ),
                          child: Center(
                            child: Text('정답', style: TextStyle(fontSize: 16.sp, color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w,),
                      InkWell(
                        onTap: () {
                          Get.back();
                          controller.next();
                          controller.timer.start();
                        },
                        child: Container(
                          height: 62.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.redAccent,
                          ),
                          child: Center(
                            child: Text('오답', style: TextStyle(fontSize: 16.sp, color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    ],
                  )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
  
}