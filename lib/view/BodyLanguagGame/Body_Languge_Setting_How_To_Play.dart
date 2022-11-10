import 'package:amity2/util/Import_Package.dart';

class HowToPlay extends StatelessWidget {
  HowToPlay({Key? key}) : super(key: key);
  final controller = Get.put(HTPController());
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.withOpacity(0.5),
      child: Center(
        child: Stack(
          children: [
            Container(
              height: Get.height * 0.6,
              width: Get.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Obx(
                ()=> Column(
                  children: [
                     SizedBox(height: 40.h,),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => controller.tapTeamPage(false),
                          child: Container(
                            height: 40.h,
                            width: (Get.width *0.4),
                            decoration: BoxDecoration(
                              border: Border.all(color: controller.isTeam.value ? Colors.grey.withOpacity(0.4) : const Color(0xffaecdff)),
                            ),
                            child: Center(child: Text('개인전', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp, color: controller.isTeam.value ? Colors.grey.withOpacity(0.4) : const Color(0xffaecdff)),),),
                          ),
                        ),
                         InkWell(
                          onTap: ()=> controller.tapTeamPage(true),
                          child: Container(
                            height: 40.h,
                            width: (Get.width *0.4),
                            decoration: BoxDecoration(
                              border: Border.all(color: !controller.isTeam.value ? Colors.grey.withOpacity(0.4) : const Color(0xffaecdff)),
                            ),
                            child: Center(child: Text('팀전', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp, color: !controller.isTeam.value ? Colors.grey.withOpacity(0.4) : const Color(0xffaecdff)),),),
                          ),
                        )
                      ],
                    ),
                        Expanded(
                            child: !controller.isTeam.value ?
                            controller.notTeam() : controller.team()
                        )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
                right: 5.w,
                child: InkWell(
                  onTap: ()=> Get.back(),
                  child: Container(
                    height: 30.h,
                   decoration: BoxDecoration(
                     border: Border.all(color: const Color(0xffaecdff)),
                     shape: BoxShape.circle,
                     color: Colors.white
                   ),
                    child:  Icon(Icons.close, size: 24.r,),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}

class HTPController extends GetxController{

  RxBool isTeam = false.obs;
  PageController notTeamPage = PageController();
  PageController teamPage = PageController();

  tapTeamPage(bool value){
    isTeam.value = value;
    if(value){
      if(teamPage.hasClients){
        teamPage.jumpTo(0);
      }
    }else{
      if(notTeamPage.hasClients){
        notTeamPage.jumpTo(0);
      }
    }
    update();
  }
/***********사용법***********/
  Widget notTeam(){
    return PageView(
      controller: notTeamPage,
      scrollDirection: Axis.horizontal,
      reverse: false,
      children: [
        Container(
          padding:  EdgeInsets.all(30.r),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person, size: 50.r,),
                            Icon(Icons.smartphone, size: 30.r,),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.person, size: 40.r,),
                            Icon(Icons.person, size: 40.r,),
                            Icon(Icons.person, size: 40.r,),
                          ],
                        )
                      ],
                    ),
                     SizedBox(height: 50.h,),
                    Container(
                      padding:  EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffaecdff)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Text('시작하는 플레이어는 기기를 들고 기기에 떠 있는 주제를 다른 플레이어들에게 몸으로 설명합니다.', style: TextStyle(fontSize: 13.sp),),
                    ),
                  ],
                ),
              ),
               Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Text('1', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),))
            ],
          ),
        ),
        Container(
          padding:  EdgeInsets.all(30.r),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person, size: 50.r,),
                            Icon(Icons.smartphone, size: 30.r,),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.emoji_people, size: 40.r,),
                            Icon(Icons.person, size: 40.r,),
                            Icon(Icons.person, size: 40.r,),
                          ],
                        )
                      ],
                    ),
                     SizedBox(height: 50.h,),
                    Container(
                      padding:  EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffaecdff)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Text('다른 플레이어들은 문제를 보고 정답을 맞춥니다.', style: TextStyle(fontSize: 13.sp),),
                    )
                  ],
                ),
              ),
               Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Text('2', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),))
            ],
          ),
        ),
        Container(
          padding:  EdgeInsets.all(30.r),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person, size: 50.r,),
                                Icon(Icons.smartphone, size: 30.r,),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.emoji_people, size: 40.r,),
                                Icon(Icons.person, size: 40.r,),
                                Icon(Icons.person, size: 40.r,),
                              ],
                            )
                          ],
                        ),
                        Positioned(
                            top: 0, left: 0, bottom: 0, right: 0,
                            child: Container(
                              height: 100.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(color: Colors.blue, width: 10),
                              ),
                            )
                        ),
                         Positioned(
                            left: 15.w, bottom: 20.h,
                            child:  Text('+1' , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp, color: Colors.blue),)
                        ),
                         Positioned(
                            right: 30.w, top: 0,
                            child:  Text('+1' , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp, color: Colors.blue),)
                        )
                      ],
                    ),
                     SizedBox(height: 50.h,),
                    Container(
                      padding:  EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffaecdff)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Text('정답을 맞춘 경우, 맞춘 플레이어와 문제를 낸 플레이어에게 각 +1 점 씩 더한 후 다음 플레이어에게 기기를 넘깁니다.', style: TextStyle(fontSize: 13.sp),),
                    )
                  ],
                ),
              ),
               Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Text('3', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),))
            ],
          ),
        ),
        Container(
          padding:  EdgeInsets.all(30.r),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person, size: 50.r,),
                                Icon(Icons.smartphone, size: 30.r,),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.emoji_people, size: 40.r,),
                                Icon(Icons.person, size: 40.r,),
                                Icon(Icons.person, size: 40.r,),
                              ],
                            )
                          ],
                        ),
                         Positioned(
                            top: 0, left: 0, bottom: 0, right: 0,
                            child: Icon(Icons.close, size: 140.r, color: Colors.red,)
                        ),
                         Positioned(
                            right: 30.w, top: 40.h,
                            child:  Text('pass' , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp, color: Colors.red),)
                        ),
                         Positioned(
                            right: 30.w, top: 0,
                            child:  Text('pass' , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp, color: Colors.red),)
                        ),
                         Positioned(
                            right: 30.w, top: 80.h,
                            child:  Text('pass' , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp, color: Colors.red),)
                        )
                      ],
                    ),
                     SizedBox(height: 50.h,),
                    Container(
                      padding:  EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffaecdff)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Text('정답을 못 맞춘 경우, 맞추는 플레이어 전원이 패스하면 다음 플레이어에게 기기를 넘깁니다.', style: TextStyle(fontSize: 13.sp),),
                    )
                  ],
                ),
              ),
               Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Text('4', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),))
            ],
          ),
        ),
        Container(
          padding:  EdgeInsets.all(30.r),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person, size: 50.r,),
                                Icon(Icons.smartphone, size: 30.r,),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.person, size: 40.r,),
                                Icon(Icons.person, size: 40.r,),
                                Icon(Icons.person, size: 40.r,),
                              ],
                            )
                          ],
                        ),
                         Positioned(
                            top: 0, right: 0, left: 0, bottom: 0,
                            child: Icon(Icons.timer_outlined, size: 100.r, color: const Color(0xffaecdff),))
                      ],
                    ),
                     SizedBox(height: 50.h,),
                    Container(
                      padding:  EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffaecdff)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Text('이를 타이머 시간동안 진행하여, 가장 점수가 높은 사람이 승리합니다.', style: TextStyle(fontSize: 13.sp),),
                    )
                  ],
                ),
              ),
               Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Text('5', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      ],
    );
  }

  Widget team(){
    return PageView(
      controller: teamPage,
      scrollDirection: Axis.horizontal,
      reverse: false,
      children: [
        Container(
          padding:  EdgeInsets.all(30.r),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.people, size: 50.r,),
                            Icon(Icons.people, size: 50.r,),
                          ],
                        ),
                         Icon(Icons.arrow_forward, size: 30.r,),
                        Row(
                          children: [
                            Icon(Icons.person, size: 40.r,),
                            Icon(Icons.person, size: 40.r,),
                          ],
                        )
                      ],
                    ),
                     SizedBox(height: 50.h,),
                    Container(
                      padding:  EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffaecdff)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Text('한명은 설명하는 사람 한명은 맞추는 사람으로 2명이서 한팀을 꾸립니다.', style: TextStyle(fontSize: 13.sp),),
                    ),
                  ],
                ),
              ),
               Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Text('1', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),))
            ],
          ),
        ),
        Container(
          padding:  EdgeInsets.all(30.r),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person, size: 50.r,),
                            Icon(Icons.smartphone, size: 30.r,),
                          ],
                        ),
                         Icon(Icons.emoji_people, size: 40.r,),
                      ],
                    ),
                     SizedBox(height: 50.h,),
                    Container(
                      padding:  EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffaecdff)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Text('같은주제, 같은 타이머로 더 많이 맞추는 팀이 승리', style: TextStyle(fontSize: 13.sp),),
                    )
                  ],
                ),
              ),
               Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Text('2', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      ],
    );
  }
}