import 'package:amity2/util/Import_Package.dart';

class LylicsGameHTP extends StatelessWidget {
  const LylicsGameHTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
              top: 0, right: 0, bottom: 0, left: 0,
              child: Container(
                color: Colors.transparent,
              )),
          Positioned(
              top: Get.height * 0.3, right: Get.width * 0.1, bottom: Get.height * 0.3, left: Get.width * 0.1,
              child: Container(
                  padding: EdgeInsets.all(15.r),
                  height: Get.height * 0.6,
                  width: Get.width * 0.8,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffAecdff)),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white
                  ),
                  child:  Stack(
                    children: [
                      PageView(
                        children: [
                          /****************1페이지******************/
                          Column(
                            children: [
                              SizedBox(
                                height: Get.height * 0.3,
                                child: Column(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.person, size: 50.r,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.person, size: 50.r,),
                                            Icon(Icons.smartphone, size: 24.r,),
                                            Icon(Icons.person, size: 50.r,),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 50.h,),
                                    Container(
                                      padding:  EdgeInsets.all(10.r),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: const Color(0xffaecdff)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child:  Text('기기를 중간에 두고 나오는 가사를 보고 듣습니다.', style: TextStyle(fontSize: 13.sp),),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          /****************2페이지******************/
                          Column(
                            children: [
                              SizedBox(
                                height: Get.height * 0.3,
                                child: Column(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.emoji_people, size: 50.r,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.person, size: 50.r,),
                                            Icon(Icons.smartphone, size: 24.r,),
                                            Icon(Icons.person, size: 50.r,),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 50.h,),
                                    Container(
                                      padding:  EdgeInsets.all(10.r),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: const Color(0xffaecdff)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child:  Text('정답을 외친 플레이어는 기기를 들고 정답버튼을 누른 후, 정답을 말합니다', style: TextStyle(fontSize: 13.sp),),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          /****************3페이지******************/
                          Column(
                            children: [
                              SizedBox(
                                height: Get.height * 0.3,
                                child: Column(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.emoji_people, size: 50.r,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.person, size: 50.r,),
                                            Stack(
                                              children: [
                                                Icon(Icons.smartphone, size: 24.r,),
                                                Positioned(
                                                    left: 0,right: 0,top: 2.h,bottom: 0,
                                                    child: Column(
                                                  children: [
                                                    Text('O', style: TextStyle(fontSize: 8.sp,color: Colors.blueAccent),),
                                                    Text('X',style: TextStyle(fontSize: 8.sp,color: Colors.redAccent),)
                                                  ],
                                                ))
                                              ],
                                            ),
                                            Icon(Icons.person, size: 50.r,),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 50.h,),
                                    Container(
                                      padding:  EdgeInsets.all(10.r),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: const Color(0xffaecdff)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child:  Text('정답 확인 후, 맞으면 정답버튼을 틀리면 오답 버튼을 누른 후 기기를 중간에 내려 놓습니다', style: TextStyle(fontSize: 13.sp),),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          /****************4페이지******************/
                          Column(
                            children: [
                              SizedBox(
                                height: Get.height * 0.3,
                                child: Column(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.emoji_people, size: 50.r,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.person, size: 50.r,),
                                            Icon(Icons.smartphone, size: 24.r,),
                                            Icon(Icons.person, size: 50.r,),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 50.h,),
                                    Container(
                                      padding:  EdgeInsets.all(10.r),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: const Color(0xffaecdff)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child:  Text('이를 반복하다, 타이머가 종료되면 맞춘 수 순서로 결과를 확인합니다.', style: TextStyle(fontSize: 13.sp),),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text('주의할 점', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),),
                              SizedBox(height: 10.h),
                              Text('정답을 맞추는 동안에는 타이머가 일시정지됩니다.\n\n정답확인 후에는 바로 다음문제로 넘어 갑니다.\n넘아간 후에는 타이머가 자동 시작됩니다.\n\n가사가 음성으로 자동 재생됩니다.\n상황에 맞게 볼륨을 잘 조절해주세요.', style: TextStyle(fontSize: 14.sp),)
                            ],
                          )
                        ],
                      ),
                      Positioned(
                        left: 0, right: 0, bottom: 10.h,
                        child: InkWell(
                          onTap: ()=> Get.back(),
                          child: Container(
                            height: 30.r,
                            width: 30.r,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: const Color(0xffaecdff))
                            ),
                            child: Icon(Icons.close,size: 20.r, color: const Color(0xffaecdff),),
                          ),
                        ),
                      )
                    ],
                  )
              ))
        ],
      ),
    );
  }
}
