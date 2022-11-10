import 'package:amity2/util/Import_Package.dart';


class WordGame extends StatelessWidget {
  WordGame({Key? key}) : super(key: key);
  final controller = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    return  WillPopScope(
      onWillPop: () {
        Get.put(DialogController()).back();
        return Future(() => false);
      },
      child: Scaffold(
          body: Container(
            width: Get.width,
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => Container(
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
                        child: Text(Get.put(WordGameController()).title.value, style:  TextStyle(fontSize: 60.sp, fontFamily: 'OnePop', color: Colors.black),),
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
                                        color: const Color(0xffaecdff)
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
                    ],
                  ),
                ),
                ),
                 SizedBox(height: 20.h,),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: const Color(0xffaecdff))
                      ),
                      height: 200.h,
                      width: Get.width*0.8,
                      child: Center(
                            child: Obx(
                                ()=> AnimatedFlipCounter(
                                value: Get.put(TimerController()).time.value,
                                textStyle: TextStyle(
                                  fontFamily: 'OneTitle',
                                  fontSize: 80.sp,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0,
                                  color: Get.put(TimerController()).time.value > Get.put(TimerController()).time.value/2 ? const Color(0xffaecdff) : Colors.red,
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      offset:  Offset(5.w, 5.h),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      )
                    ),
                    Positioned(
                        top: 130.h,
                        left: Get.width/2 + 20.w,
                        child:  Icon(Icons.timer_outlined, size: 50.sp,color: const Color(0xffaecdff),)
                    ),
                  ],
                ),
                 SizedBox(height: 50.h,),
                SizedBox(
                  width: 150.w,
                    height: 200.h,
                    child:
                      ListView.separated(
                        controller: Get.put(WordGameController()).listController,
                        scrollDirection: Axis.horizontal,
                          physics:  const ScrollPhysics(),
                          itemBuilder: (BuildContext ctx, int index){
                            return Container(
                              key: controller.playerList[index].key,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(controller.playerIMG[index],height: 150.r, width: 150.r,),
                                     SizedBox(height: 20.h,),
                                    Text(controller.playerList[index].name, style:  TextStyle(fontSize: 20.sp),),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext ctx, int index){
                            return Container();
                          },
                          itemCount: controller.playerList.length
                      ),
                    ),
                 SizedBox(height: 20.h,),
                GestureDetector(
                  onTap: (){
                    Get.put(AudioController()).audioNext();
                    Get.put(TimerController()).pass();
                    print(Get.put(WordGameController()).currentIndex.value );
                    if(Get.put(WordGameController()).currentIndex.value >= controller.playerList.length - 1){
                      if(controller.playerList.length >= 4){
                        Get.put(WordGameController()).listController.jumpTo(0);
                        Get.put(WordGameController()).currentIndex.value = 0;
                      }
                      else{
                        Get.put(WordGameController()).currentIndex.value = 0;
                        Scrollable.ensureVisible(controller.playerList[0].key.currentContext!,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      }
                    }else if(Get.put(WordGameController()).currentIndex.value < controller.playerList.length - 1){
                      print('여기로들어옴');
                      Scrollable.ensureVisible(controller.playerList[Get.put(WordGameController()).currentIndex.value + 1].key.currentContext!,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                      Get.put(WordGameController()).currentIndex.value++;
                    }else{
                      print('?');
                    }

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffaecdff),
                    ),
                    height: 60.h,
                    width: 300.w,
                    child: Center(child: Obx(()=> Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Get.put(WordGameController()).currentIndex.value ==  controller.playerList.length -1 ?
                        controller.playerList[0].name  : controller.playerList[Get.put(WordGameController()).currentIndex.value + 1].name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16.sp)),
                         Text( '에게 넘기기',style: TextStyle(color: Colors.white,fontSize: 15.sp),),
                      ],
                    )),),
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }
}

class WordGameController extends GetxController{
  final timer = Get.put(TimerController());
  ScrollController listController = ScrollController();
  final List<String> wordList = ['ㄱ','ㄴ','ㄷ','ㄹ','ㅁ','ㅂ','ㅅ','ㅇ','ㅈ','ㅊ','ㅋ','ㅌ','ㅍ','ㅎ'];
  RxInt currentIndex = 0.obs; //현재플레이어
  RxString title = ''.obs; //현제 타이틀
  RxInt i = 0.obs;

  makeTitle(){
    title.value = wordList[Random().nextInt(wordList.length-1)] + wordList[Random().nextInt(wordList.length-1)];
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    makeTitle();
  }
}
