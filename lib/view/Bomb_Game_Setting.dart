import 'package:amity2/util/Import_Package.dart';
import 'dart:math' as math;

import 'package:amity2/view/Bomb_Game_HowtoPlay.dart';

class BombGameSetting extends StatelessWidget {
   BombGameSetting({Key? key}) : super(key: key);
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
                const SpinKitPouringHourGlassRefined(color: Color(0xffaecdff),),
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
        return Container(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          Icon(Icons.settings_outlined, color: const Color(0xffaecdff) ,size: 36.sp,),
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
                                padding:  EdgeInsets.symmetric(horizontal: 50.h),
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
                                        child: Text('폭탄게임', style: TextStyle(fontSize: 40.sp, fontFamily: 'OnePop'),),
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
                                                    color:const Color(0xff3d3d3d)
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
                                                        color:const Color(0xff3d3d3d),
                                                        fontWeight: FontWeight.normal,
                                                      )
                                                  )
                                                ]
                                            ),
                                          ) ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 30.h,),
                              controller.playerSetting(),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 20.h,
                          right: 20.w,
                          child: InkWell(
                            onTap: () => Get.to(() => const BombGameHTP(), opaque: false, transition: Transition.fadeIn,),
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
                    controller.randomTimer(),
                    controller.penaltySetting(),
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
                          child:  Center(child: Text('플레이어 설정', style: TextStyle(fontSize: 16.sp ,color: const Color(0xffaecdff),fontWeight: FontWeight.bold),),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if(controller.selectedPlayer.value == '0'){
                    Get.put(DialogController()).playError();
                  }else{
                    Get.put(TimerController()).currentGame = 2;
                    Get.put(DialogController()).startGame(1);
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
              ),

            ],
          ),
        );
      }}
    );
  }
}
