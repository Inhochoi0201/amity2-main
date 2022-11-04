import 'package:amity2/controller/Audio_Controller.dart';
import 'package:amity2/controller/Timer_Controller.dart';
import 'package:amity2/util/Import_Package.dart';
import 'package:amity2/view/Body_Language_Team.dart';
import 'package:amity2/util/Screen_Protect.dart';

class DialogController extends GetxController{
  void customReset(){
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          height: Get.height * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Icon(Icons.warning, color: const Color(0xffaecdff),size: 30.sp,),
               SizedBox(height: 10.h,),
               Text('경고', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.sp),),
               Divider(indent: 100.w, endIndent: 100.w, color: const Color(0xffaecdff),),
               Padding(
                padding: EdgeInsets.all(16.r),
                child: Text('초기화를 진행하면 직접만든 벌칙들이 사라집니다.\n\n초기화를 진행하겠습니까?',
                style: TextStyle(fontSize: 15.sp),textAlign: TextAlign.center,),
              ),
               SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.put(PenaltyController()).resetList();
                      print(Get.put(PenaltyController()).showList);
                      print(Get.put(PenaltyController()).basicList);
                      Get.back();
                    },
                    child: Container(
                      padding:  EdgeInsets.fromLTRB(40.w, 15.h, 40.w, 15.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xffaecdff),
                      ),
                      child:  Center(child: Text('확인', style: TextStyle(fontSize: 15.sp, color: Colors.white),),),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding:  EdgeInsets.fromLTRB(40.w, 15.h, 40.w, 15.h),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffaecdff),
                          width: 1.5
                        ),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child:  Center(child: Text('취소', style: TextStyle(fontSize: 15.sp, color: Colors.white),),),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
  void saveCustom(){
    Get.dialog(AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        height: Get.height * 0.3,
        width: Get.width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Icon(Icons.info, size: 50.r,color: const Color(0xffaecdff),),
             SizedBox(height: 20.h,),
             Text('저장되었습니다.', style: TextStyle(fontSize: 18.sp),),
             SizedBox(height: 30.h,),
            GestureDetector(
              onTap: ()=> Get.back(),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffaecdff),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding:  EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
                  child:  Center(child: Text('확인', style: TextStyle(fontSize: 15.sp,color:Colors.white),),),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  void savePlayer(){
    Get.dialog(AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        height: Get.height * 0.3,
        width: Get.width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Icon(Icons.info, size: 50.r,color: const Color(0xffaecdff),),
             SizedBox(height: 20.h,),
             Text('저장되었습니다.', style: TextStyle(fontSize: 18.sp),),
             SizedBox(height: 30.h,),
            GestureDetector(
              onTap: ()=> Get.back(),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffaecdff),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding:  EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
                  child:  Center(child: Text('확인', style: TextStyle(fontSize:15.sp, color: Colors.white),),),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  void customAlert(String alert){
    Get.dialog(AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        height: Get.height * 0.3,
        width: Get.width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.info, size: 50.r,color: const Color(0xffaecdff),),
            SizedBox(height: 20.h,),
            Text(alert, style: TextStyle(fontSize: 18.sp),),
            SizedBox(height: 30.h,),
            GestureDetector(
              onTap: ()=> Get.back(),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffaecdff),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding:  EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
                  child:  Center(child: Text('확인', style: TextStyle(fontSize:15.sp, color: Colors.white),),),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
  //타이머
  RxInt time = 3.obs;
  Timer? timer;

   void start(int n) async{
     time.value = 3;
    timer = Timer.periodic(const Duration(milliseconds: 1300), (timer) {
      if(time.value > 0) {
        time.value--;
      } else if(time.value == 0){
        Get.back();
        if(n==0){
          Get.to(()=> WordGame());
        }else if(n==1){

        }else if(n==2){
          //Get.to(()=>BodyLanguagePersonal)
        }else if(n==3){
          Get.to(()=>BodyLanguageTeam());
        }
        timer.cancel();
      }
    });
  }


  void startGame(int n) {
     start(n);
    Get.dialog(
        WillPopScope(
          onWillPop: ()=> Future(() => false),
          child: AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
          height: Get.height * 0.3,
          width: Get.width * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Icon(Icons.games_outlined, size: 50.r,color: const Color(0xffaecdff),),
               SizedBox(height: 20.h,),
              n != 2?
              Text('${Get.put(SettingController()).playerList[0].name}님 부터\n시작합니다.', style:  TextStyle(fontSize: 18.sp), textAlign: TextAlign.center,) :
              Text('${Get.put(SettingController()).playerList[0].name} 부터\n시작합니다.', style:  TextStyle(fontSize: 18.sp), textAlign: TextAlign.center,),
               SizedBox(height: 30.h,),
              GestureDetector(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffaecdff),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding:  EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
                    child: Obx(() => Center(child: Text('$time 초 후에 시작됩니다!', style:  TextStyle(fontSize: 15.sp, color: Colors.white),),)),
                  ),
                ),
              )
            ],
          ),
      ),
    ),
        ));
  }

  void gameOver(){
    audioGameover();
    Get.dialog(
        WillPopScope(
          onWillPop: ()=>Future(() => false),
          child: AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
          height: 370.h,
          width: Get.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Icon(Icons.warning, color: Colors.red,size: 35.r,),
               Text('GameOver', style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold, color: Colors.red),),
               SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Get.put(SettingController()).playerList[Get.put(WordGameController()).currentIndex.value].name, style:  TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),
                   Text(' 탈락!', style: TextStyle(fontSize: 18.sp),),
                ],
              ),
               SizedBox(height: 10.h,),
              Get.put(SettingController()).penaltyMode.value ?
                  Column(
                    children: [
                       Text('▼ 벌칙 ▼',style: TextStyle(fontSize: 15.sp , color: Colors.indigoAccent),textAlign: TextAlign.right,),
                       SizedBox(height: 5.h,),
                      Text(Get.put(PenaltyController()).showList[Random().nextInt(Get.put(PenaltyController()).showList.length-1)],style:  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold , color: Colors.red),textAlign: TextAlign.center,),
                    ],
                  ) :
               Text('다음에 더 잘해봐요!', style: TextStyle(fontSize: 18.sp),),
               SizedBox(height: 30.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: ()=> Get.back(closeOverlays: true),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16.w),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffaecdff),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding:  EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
                        child:  Center(child: Text('나가기', style: TextStyle(fontSize: 15.sp, color: Colors.white),),),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.put(WordGameController()).makeTitle();
                      Get.put(TimerController()).start();
                      Get.back();
                      },
                    child: Padding(
                      padding:  EdgeInsets.only(right: 16.w),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffaecdff),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding:  EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
                        child:  Center(child: Text('다시하기', style: TextStyle(fontSize: 15.sp,color: Colors.white),),),
                      ),
                    ),
                  )
                ],
              ),
               SizedBox(height: 20.h,),
               Text('다시하기를 누르면 게임이', style: TextStyle(fontSize: 13.sp),),
              Text('[ ${(Get.put(SettingController()).playerList[Get.put(WordGameController()).currentIndex.value].name)} ]님부터 시작됩니다.', style:  TextStyle(fontSize: 13.sp),),
            ],
          ),
      ),
    ),
        ));
  }

  ///몸말 팀전 타이머 종료
  void teamResult(){
    audioGameover();
    Get.dialog(
        WillPopScope(
          onWillPop: ()=>Future(() => false),
          child: AlertDialog(
            insetPadding: const EdgeInsets.all(0),
            scrollable: true,
            backgroundColor: Colors.transparent,
            content: Container(
              padding: EdgeInsets.all(50.r),
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: int.parse(Get.put(SettingController()).selectedMoreTeam.value) ==  Get.put(BodyLanguageTeamController()).currentTeam.value ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('최종결과', style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold, color: Colors.red),),
                  SizedBox(height: 10.h,),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (ctx,index)=> Row(children: [
                          Text('${index+1}등' , style: TextStyle(
                            fontSize: index == 0 ? 13.sp : 12.sp, fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                              color: index == 0 ? const Color(0xffFFD700) : index == 1 ? const Color(0xffC0C0C0) : const Color(0xff3d3d3d)
                          ),),
                          SizedBox(width: 10.w,),
                          Text('${Get
                              .put(BodyLanguageTeamController())
                              .result[index].keys}팀 / ${Get.put(BodyLanguageTeamController()).result[index].values}개', style: TextStyle(
                          fontSize: index == 0 ? 13.sp : 12.sp, fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                          color: index == 0 ? const Color(0xffFFD700) : index == 1 ? const Color(0xffC0C0C0) : const Color(0xff3d3d3d)
                          ))
                        ],),
                        separatorBuilder: (ctx, index) => SizedBox(height: 3.h,),
                        itemCount:  int.parse(Get.put(SettingController()).selectedMoreTeam.value)),
                  ),
                  SizedBox(height: 10.h,),
                  Get.put(SettingController()).penaltyMode.value ?
                  Column(
                    children: [
                      Text('▼ 벌칙 ▼',style: TextStyle(fontSize: 12.sp , color: Colors.indigoAccent),textAlign: TextAlign.right,),
                      SizedBox(height: 5.h,),
                      Text(Get.put(PenaltyController()).showList[Random().nextInt(Get.put(PenaltyController()).showList.length-1)],style:  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold , color: Colors.red),textAlign: TextAlign.center,),
                    ],
                  ) :
                  Text('다음에 더 잘해봐요!', style: TextStyle(fontSize: 12.sp),),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                              Get.back(closeOverlays: true);
                              Get.to(()=>const ScreenProtect());
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 16.w),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffaecdff),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding:  EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 10.h),
                            child:  Center(child: Text('나가기', style: TextStyle(fontSize: 13.sp, color: Colors.white),),),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.put(WordGameController()).makeTitle();
                          Get.put(TimerController()).start();
                          Get.back();
                        },
                        child: Padding(
                          padding:  EdgeInsets.only(right: 16.w),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffaecdff),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding:  EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 10.h),
                            child:  Center(child: Text('다시하기', style: TextStyle(fontSize: 13.sp,color: Colors.white),),),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.h,),
                ]
              ) :
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('중간결과', style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold, color: Colors.red),),
                      SizedBox(height: 10.h,),
                      Expanded(
                        child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx,index)=> Row(children: [
                              Text('${index+1}등' , style: TextStyle(
                                  fontSize: index == 0 ? 13.sp : 12.sp, fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                                  color: index == 0 ? const Color(0xffFFD700) : index == 1 ? const Color(0xffC0C0C0) : const Color(0xff3d3d3d)
                              ),),
                              SizedBox(width: 10.w,),
                              Text('${Get
                                  .put(BodyLanguageTeamController())
                                  .result[index].keys}팀 / ${Get.put(BodyLanguageTeamController()).result[index].values}개', style: TextStyle(
                                  fontSize: index == 0 ? 13.sp : 12.sp, fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                                  color: index == 0 ? const Color(0xffFFD700) : index == 1 ? const Color(0xffC0C0C0) : const Color(0xff3d3d3d)
                              ))
                            ],),
                            separatorBuilder: (ctx, index) => SizedBox(height: 3.h,),
                            itemCount: Get.put(BodyLanguageTeamController()).currentTeam.value),
                      ),
                      SizedBox(height: 10.h,),
                      GestureDetector(
                        onTap: () {
                            Get.put(BodyLanguageTeamController()).nextTeam();
                            Get.back();
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 16.w),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffaecdff),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding:  EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 10.h),
                            child:  Center(child: Text('다음 팀 시작하기', style: TextStyle(fontSize: 13.sp, color: Colors.white),),),
                          ),
                        ),
                      ),
                      Text('버튼을 누르면 게임이 바로 시작됩니다.', style: TextStyle(fontSize: 10.sp),),
                      SizedBox(height: 10.h,),
                    ],
                  )
            ),
          ),
        ));
  }
  final sfxPlayer = AudioPlayer();

  Future audioGameover() async{
    await sfxPlayer.setVolume(75);
    await sfxPlayer.setSpeed(1);
    await sfxPlayer.setAsset('assets/sfx/gameover.mp3');
    sfxPlayer.play();
  }

    void back(){
    Get.put(TimerController()).pause();
    Get.dialog(AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        height: Get.height * 0.3,
        width: Get.width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Icon(Icons.info, size: 50.r,color: const Color(0xffaecdff),),
             SizedBox(height: 20.h,),
             Text('게임을 나가시겠습니까?', style: TextStyle(fontSize: 18.sp),),
             SizedBox(height: 30.h,),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.put(AudioController()).clockSfx.stop();
                    Get.put(TimerController()).timer!.cancel();
                    Get.put(TimerController()).time.value = -100;
                    Get.back(closeOverlays: true);
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffaecdff),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding:  EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
                      child:  Center(child: Text('확인', style: TextStyle(fontSize: 15.sp, color: Colors.white),),),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.back();
                    Get.put(TimerController()).start();
                  },
                  child: Padding(
                    padding:  EdgeInsets.only(right: 16.w),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffaecdff),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding:  EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
                      child:  Center(child: Text('취소', style: TextStyle(fontSize:15.sp,color: Colors.white),),),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }

  void playError(){
    Get.dialog(AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        height: Get.height * 0.3,
        width: Get.width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Icon(Icons.info_outline, size: 50.r,color: const Color(0xffaecdff),),
             SizedBox(height: 20.h,),
             Text('기본 설정이\n완료되지 않았습니다!', style: TextStyle(fontSize: 18.sp),textAlign: TextAlign.center,),
             SizedBox(height: 30.h,),
            GestureDetector(
              onTap: ()=> Get.back(),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffaecdff),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding:  EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
                  child:  Center(child: Text('확인', style: TextStyle(fontSize: 15.sp, color: Colors.white),),),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}