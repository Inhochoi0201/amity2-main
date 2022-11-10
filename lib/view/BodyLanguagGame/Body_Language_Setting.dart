import 'package:amity2/util/Import_Package.dart';
import 'package:amity2/view/BodyLanguagGame/Body_Languge_Setting_How_To_Play.dart';
import 'dart:math' as math;



class BodyLanguageSetting extends StatelessWidget {
  BodyLanguageSetting({Key? key}) : super(key: key);
  final controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('categoty').get(),
      builder: (context, snapshot) {
        if(snapshot.hasData == false){
          return  Container(
              width: Get.width,
              height: Get.height,
              color: Colors.white,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SpinKitChasingDots(color: Color(0xffaecdff),),
                  SizedBox(height: 20.h,),
                  Text('데이터를 불러오고 있습니다...',style: TextStyle(fontSize: 12.sp),)
                ],
              ));
        } else if (snapshot.hasError) {
          return Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
            child: Center(
              child: Text(
                '데이터를 불러오던 중 오류가 발생하였습니다.\n잠시후 다시 시도해주세요.', // 에러명을 텍스트에 뿌려줌
                style: TextStyle(fontSize: 15.sp, color: Colors.red),
              ),
            ),
          );
        }else{
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 24.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:  [
                                    Icon(Icons.settings_outlined, color: const Color(0xffaecdff) ,size: 36.r,),
                                    SizedBox(width: 10.w,),
                                    Text('기본 설정', style: TextStyle(fontSize: 30.sp, fontFamily: 'OneTitle'),),
                                  ],
                                ),
                              ),
                              Divider(
                                color:  const Color(0xffaecdff).withOpacity(0.4),
                                indent: 24.w,
                                endIndent: 24.w,
                                thickness: 1.5,
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(top: 50.h),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 50.w),
                                          child: Container(
                                            height: 120.h,
                                            width: 320.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: const Color(0xffaecdff),
                                                  width: 3
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: Text('몸으로 말해요', style: TextStyle(fontSize: 40.sp, fontFamily: 'OnePop'),),
                                                ),
                                                Positioned(
                                                    top: 5.h,
                                                    left: 8.w,
                                                    child: RichText(
                                                      text:  TextSpan(
                                                          text: 'Play With  ',
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight: FontWeight.normal,
                                                              color: const Color(0xff3d3d3d)
                                                          ),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: 'A',
                                                              style: TextStyle(
                                                                fontSize: 20.sp,
                                                                fontWeight: FontWeight.bold,
                                                                color: const Color(0xffaecdff),
                                                              ),),
                                                            TextSpan(
                                                                text: 'MITY',
                                                                style: TextStyle(
                                                                  fontSize: 18.sp,
                                                                  color: const Color(0xff3d3d3d),
                                                                  fontWeight: FontWeight.normal,
                                                                )
                                                            )
                                                          ]
                                                      ),
                                                    ) ),
                                                Positioned(
                                                    left:10 ,bottom: 10,
                                                    child: Text('본 게임은 3인 이상 플레이를 추천합니다.', style: TextStyle(fontSize: 12.sp, color: const Color(0xffe3362c)),)
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 20.h,
                                    right: 20.w,
                                    child: InkWell(
                                      onTap: () => Get.to(() => HowToPlay(), opaque: false, transition: Transition.fadeIn,),
                                      child: Transform.rotate(
                                        angle: 30.0 * math.pi / 180,
                                        child: Container(
                                          padding:  EdgeInsets.all(15.r),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: const Color(0xffaecdff), width: 2),
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child:  Center(
                                            child: Text('How\nTo\nPlay?', style: TextStyle(fontSize: 14.sp, color: const Color(0xffaecdff),fontWeight: FontWeight.bold),textAlign: TextAlign.center,),),
                                        ),
                                      ),
                                    ),)
                                ],
                              ),
                              SizedBox(height: 20.h,),
                              controller.teamSetting(),
                              SizedBox(height: 20.h,),
                              controller.selectTheme(),
                              Obx(() =>
                              controller.isTeam.value ?
                              controller.moreTeamSetting() : controller.playerSetting(),
                              ),
                              controller.minuteSetting(),
                              controller.penaltySetting(),
                              Obx(
                                    ()=> controller.isTeam.value ?
                                controller.timerVisible() :
                                Padding(
                                  padding:  EdgeInsets.fromLTRB(40.w, 10.h, 40.w, 10.h),
                                  child: InkWell(
                                    onTap: () => Get.to(() => const PlayerSetting(), opaque: false, transition: Transition.fadeIn,),
                                    child: Container(
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: const Color(0xffaecdff)),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child:  Center(child:Text( '플레이어 설정', style: TextStyle(fontSize: 16.sp, color: const Color(0xffaecdff),fontWeight: FontWeight.bold),)),),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if(!controller.isTeam.value){
                                    if(controller.selectedTheme.value == '테마를 선택해주세요.'|| controller.selectedMinuteTimer.value == '0' || controller.selectedPlayer.value == '0' ){
                                      Get.put(DialogController()).customAlert('설정이 완료되지 않았습니다.');
                                    }else{
                                      Get.put(TimerController()).currentGame = 3;
                                      Get.put(DialogController()).startGame(2);
                                    }
                                  }else{
                                    if(controller.selectedTheme.value == '테마를 선택해주세요.' || controller.selectedMoreTeam.value == '0' || controller.selectedMinuteTimer.value == '0'){
                                      Get.put(DialogController()).customAlert('설정이 완료되지 않았습니다.');
                                    }else{
                                      Get.put(TimerController()).currentGame = 4;
                                      Get.put(DialogController()).startGame(3);
                                    }
                                  }
                                },
                                child: Padding(padding: EdgeInsets.fromLTRB(40.w, 20.h, 40.w, 20.h),
                                  child: Container(
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xffaecdff),
                                    ),
                                    child:  Center(
                                      child: Text('게임시작', style: TextStyle(fontSize: 24.sp, color: Colors.white, fontWeight: FontWeight.bold),),
                                    ),
                                  ),),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),]
            ),
          );
        }
      }
    );
  }

}
