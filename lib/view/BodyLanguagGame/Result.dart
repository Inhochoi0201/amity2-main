import 'package:amity2/util/Import_Package.dart';


class Result extends GetView<BodyLanguageTeamController>{
  const Result({super.key});
  @override
  // TODO: implement controller
  BodyLanguageTeamController get controller => super.controller;

  @override
  Widget build(BuildContext context){
    return Container(
      width: Get.width * 0.8,
      height: Get.height * 0.8,
      color: Colors.white,
      child:   WillPopScope(
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
              child: int.parse(Get.put(SettingController()).selectedMoreTeam.value) ==  controller.result.length ?
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
                            Text('${controller
                                .result[index].name}팀 / ${controller.result[index].score}개', style: TextStyle(
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
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        Get.off(()=>const ScreenProtect());
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
                              .result[index].name}팀 / ${Get.put(BodyLanguageTeamController()).result[index].score}개', style: TextStyle(
                              fontSize: index == 0 ? 13.sp : 12.sp, fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                              color: index == 0 ? const Color(0xffFFD700) : index == 1 ? const Color(0xffC0C0C0) : const Color(0xff3d3d3d)
                          ))
                        ],),
                        separatorBuilder: (ctx, index) => SizedBox(height: 3.h,),
                        itemCount: Get.put(BodyLanguageTeamController()).result.length),
                  ),
                  SizedBox(height: 10.h,),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffaecdff),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child:  Center(child: Text('다음 팀 준비하기', style: TextStyle(fontSize: 13.sp, color: Colors.white),),),
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text('준비가 되면 패스버튼을 눌러 시작하세요!', style: TextStyle(fontSize: 12.sp)),
                  SizedBox(height: 10.h,),
                ],
              )
          ),
        ),
      ),
    );
  }
}

class ResultSolo extends GetView<BodyLanguageSoloController>{
  const ResultSolo({super.key});
  @override
  // TODO: implement controller
  BodyLanguageSoloController get controller => super.controller;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.grey.withOpacity(0.4),
      child: WillPopScope(
        onWillPop: ()=> Future(() => false),
        child: Stack(
          children: [
            Positioned(
                left: 0,right: 0,top: 0,bottom: 0,
                child: Container()),
            Positioned(
              left:0,right:0,top: 0,bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xffaecdff), width: 2.5),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10.r),
                width: Get.width * 0.9,
                height: Get.height * 0.9,
                child: Column(
                  children: [
                    Text('최종결과', style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold, color: Colors.red),),
                    SizedBox(height: 10.h,),
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (ctx,index)=>Row(children: [
                              Text('${index+1}등' , style: TextStyle(
                                  fontSize: index == 0 ? 13.sp : 12.sp, fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                                  color: index == 0 ? const Color(0xffFFD700) : index == 1 ? const Color(0xffC0C0C0) : const Color(0xff3d3d3d)
                              ),),
                              SizedBox(width: 10.w,),
                              Text('${Get
                                  .put(SettingController())
                                  .playerList[index].name} / ${Get.put(SettingController()).playerList[index].score}점', style: TextStyle(
                                  fontSize: index == 0 ? 13.sp : 12.sp, fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                                  color: index == 0 ? const Color(0xffFFD700) : index == 1 ? const Color(0xffC0C0C0) : const Color(0xff3d3d3d)
                              ))
                            ],),
                            separatorBuilder: (ctx,index)=>SizedBox(height: 5.h,),
                            itemCount: Get.put(SettingController()).playerList.length)),
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
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        Get.off(()=>const ScreenProtect());
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}