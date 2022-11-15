import 'package:amity2/util/Import_Package.dart';

class ResultLylics extends GetView<LylicsGameController>{
  const ResultLylics({super.key});

  @override
  // TODO: implement controller
  LylicsGameController get controller => super.controller;

  @override
  Widget build(BuildContext context) {
    controller.audio.audioGameover();
    // TODO: implement build
    return Material(
      color: Colors.grey.withOpacity(0.2),
      child: Stack(
        children: [
          Positioned(left:0,right:0,bottom:0,top:0,child: Container()),
          Positioned(child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xffaecdff), width: 3),
            ),
            child: Column(
              children: [
                Text('최종결과', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13.sp),),
                SizedBox(height: 7.h,),
                SizedBox(
                  height: 200.h,
                  child: ListView.separated(
                      itemBuilder: (ctx, index)=> Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('${index+1} 등', style: TextStyle(fontSize: index == 0 ? 14.sp : 12.sp,
                              color: index == 0 ? const Color(0xffFFD700) : index == 1 ? const Color(0xffC0C0C0) : const Color(0xff3d3d3d)),),
                          Text(controller.setting.playerList[index].name,style: TextStyle(fontSize: index == 0 ? 14.sp : 12.sp,
                              color: index == 0 ? const Color(0xffFFD700) : index == 1 ? const Color(0xffC0C0C0) : const Color(0xff3d3d3d)) ),
                          Text(controller.setting.playerList[index].score.toString(), style: TextStyle(fontSize: index == 0 ? 14.sp : 12.sp,
                              color: index == 0 ? const Color(0xffFFD700) : index == 1 ? const Color(0xffC0C0C0) : const Color(0xff3d3d3d)))
                        ],
                      ),
                      separatorBuilder: (ctx,index)=>SizedBox(height: 5.h,),
                      itemCount: controller.setting.playerList.length),
                ),
                SizedBox(height: 7.h,),
                controller.setting.penaltyMode.value ?
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
                    Get.back(closeOverlays: true);
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
          ))
        ],
      ),
    );
  }
}