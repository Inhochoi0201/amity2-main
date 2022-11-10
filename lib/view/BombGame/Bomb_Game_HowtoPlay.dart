import 'package:amity2/util/Import_Package.dart';

class BombGameHTP extends StatelessWidget{
  const BombGameHTP({super.key});
  
  @override
  Widget build(BuildContext context){
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
                                      Icon(Icons.people, size: 50.r,),
                                      Icon(Icons.smartphone, size: 24.r,),
                                    ],
                                  ),
                                  SizedBox(height: 50.h,),
                                  Container(
                                    padding:  EdgeInsets.all(10.r),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: const Color(0xffaecdff)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child:  Text('시작하고 플레이어는 기기 화면에 표시된 주제에 맞게 이름을 말하고 다음 플레이어에게 기기를 넘깁니다.', style: TextStyle(fontSize: 13.sp),),
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
                                      Icon(Icons.people, size: 50.r,),
                                      Stack(
                                        children: [
                                          Icon(Icons.smartphone, size: 24.r,),
                                          Icon(Icons.close, size: 24.r,color: Colors.red,),
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
                                    child:  Text('플레이어가 말한 내용이 주제에 맞지 않을 경우, 다음 순번 사람이 인정 할 때까지 기기를 넘길수 없습니다.', style: TextStyle(fontSize: 13.sp),),
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
                                      Icon(Icons.people, size: 50.r,),
                                      Stack(
                                        children: [
                                          Text('(( ))', style: TextStyle(fontSize: 24.sp,),),
                                          Positioned(
                                              right: 0, left: 0,
                                              child: Icon(Icons.smartphone_outlined, size: 24.r,)),
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
                                    child:  Text('이를 반복하다 타이머가 종료되고 기기가 울릴 때, 가지고 있는 플레이어가 탈락입니다.', style: TextStyle(fontSize: 13.sp),),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
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
