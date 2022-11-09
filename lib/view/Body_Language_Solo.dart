import 'package:amity2/util/Import_Package.dart';
class BodyLanguageSolo extends StatelessWidget {
  BodyLanguageSolo({Key? key}) : super(key: key);
  final controller = Get.put(BodyLanguageSoloController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    return Material(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Obx(()=> Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const SpinKitPouringHourGlass(color: Color(0xffaecdff)),
                    Text('타이머가 가려집니다.', style: TextStyle(fontSize: 10.sp, color: Colors.blueAccent),),
                  ],
                ), ///나중에 가리기
                Text('현재 플레이어 [ ${controller.setting.playerList[controller.currentPlayer.value].name} ]',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: const Color(0xffaecdff)),),
              ],
            )),
            Expanded(
              child: Row(
                children: [
                  InkWell(
                    onTap:(){
                      if(controller.timer.isReady){
                        Get.snackbar('준비상태입니다.', '패스를 누르면 바로 시작합니다.',
                          snackPosition: SnackPosition.TOP,
                          forwardAnimationCurve: Curves.elasticInOut,
                          reverseAnimationCurve: Curves.easeOut,);
                      }else{
                        controller.timer.isReady = true;
                        controller.timer.pause();
                        scoreInsert();
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
                          '정답',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Center(child: Obx(()=> Text(controller.setting.selectedTheme.value == '영화'
                          ? controller.theme
                          .movie[controller.i.value]
                          : controller.setting.selectedTheme.value == '애니'
                          ? controller.theme
                          .animation[controller.i.value]
                          : controller.setting.selectedTheme.value == '웹툰'
                          ? controller.theme
                          .webtoon[controller.i.value]
                          : controller.setting.selectedTheme.value ==
                          '인물'
                          ? controller.theme.celeb[
                      controller.i.value]
                          : controller.setting.selectedTheme
                          .value ==
                          '물건'
                          ? controller.theme.product[
                      controller.i.value]
                          : controller.setting.selectedTheme
                          .value ==
                          '음악'
                          ? controller.theme.music[
                      controller
                          .i.value]
                          : '테마를 불러오던 중\n오류가 발생하였습니다.',
                        style: TextStyle(fontSize: 50.sp,fontFamily: 'OneTitle'),
                        textAlign: TextAlign.center,)),)
                  ),
                  InkWell(
                    onTap: (){
                      if(controller.timer.isReady){
                        controller.timer.isReady = false;
                        controller.i.value++;
                        controller.timer.start();
                      }else{
                        controller.i.value++;
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
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
  
  void scoreInsert(){
    Get.bottomSheet(
        isScrollControlled: true,
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10.r,vertical: 5.h),
        height: Get.height * 0.9,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('정답을 맞춘 플레이어를 선택해주세요.', style: TextStyle(fontFamily:'OneTitle',fontSize: 10.sp, fontWeight: FontWeight.bold),),
                      IconButton(onPressed: (){
                        Get.back();
                        controller.timer.isReady = false;
                        controller.timer.start();
                      }, icon: Icon(Icons.close_outlined, size: 50.r, color: const Color(0xffaecdff),))
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  SizedBox(
                    height: Get.height * 0.5,
                    width: Get.width - 20.r,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.setting.playerList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: ((Get.width-20.r)/5)/(Get.height*0.25),
                          crossAxisSpacing: 1.5,
                          mainAxisSpacing: 1.5,
                        ),
                        itemBuilder: (ctx,index)=> InkWell(
                          onTap: (){
                            if(controller.currentPlayer.value != index){
                              controller.setting.playerList[index].score++;
                              controller.setting.playerList[controller.currentPlayer.value].score++;
                              if(controller.currentPlayer.value == controller.setting.playerList.length -1){
                                controller.currentPlayer.value = 0;
                              }else{
                                controller.currentPlayer.value++;
                              }
                              controller.setting.update();
                              Get.back();
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: controller.currentPlayer.value == index ? const Color(0xffdddddd) : const Color(0xffaecdff)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(child: Text(controller.setting.playerList[index].name,
                              style: TextStyle(fontFamily:'One', fontSize: 13.sp, color:controller.currentPlayer.value == index ? const Color(0xffdddddd) : const Color(0xffaecdff)), ),),),
                        ),
                        )
                  ),
                ],
              ),
            ),
            Text('점수부여하는동안은 타이머는 흘러가지 않습니다.', style: TextStyle(fontFamily:'OnePop',fontSize: 10.sp, color: const Color(0xffe3362c))),
            Text('선택후 창이 내려가면 다음 플레이어는 패스를 눌러 타이머를 시작해주세요.', style: TextStyle(fontFamily:'OnePop',fontSize: 10.sp, color: const Color(0xffe3362c)))
          ],
        ),
      )
    );
  }
}

class BodyLanguageSoloController extends GetxController{
  final timer = Get.put(TimerController());
  final audio = Get.put(AudioController());
  final setting = Get.put(SettingController());
  final theme = Get.put(ThemeController());
  RxInt currentPlayer = 0.obs;
  RxInt i =0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(Get.put(SettingController()).selectedTheme.value == '영화'){
      theme.movie.shuffle();
    }else if(Get.put(SettingController()).selectedTheme.value == '애니'){
      theme.animation.shuffle();
    }else if(Get.put(SettingController()).selectedTheme.value == '웹툰'){
      theme.webtoon.shuffle();
    }else if(Get.put(SettingController()).selectedTheme.value == '인물'){
      theme.celeb.shuffle();
    }else if(Get.put(SettingController()).selectedTheme.value == '물건'){
      theme.product.shuffle();
    }else if(Get.put(SettingController()).selectedTheme.value == '음악'){
      theme.music.shuffle();
    }
    timer.time.value = int.parse(Get.put(SettingController()).selectedMinuteTimer.value) * 60; //타이머 설정
    timer.start();
  }
}