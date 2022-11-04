import 'package:amity2/util/Import_Package.dart';


class PenaltyController extends GetxController{
  SharedPreferences? prefs;
  RxInt plusCustom = 1.obs;
  List<String> customList = [];
  final listController = TextEditingController();
  List<String> basicList  = ['무반주 댄스 30초 동안 추기', '노래 3소절 부르기',
    '옆 테이블(모르는 사람)한테 인사하기', '이번만 봐줄게', '숨겨왔던 썰 하나만',
    '오른쪽에 앉은 사람 부탁 하나 들어주기', '왼쪽 사람한테 딱밤 맞기', '인디언 밥!',
    '귀여운척 한번 해줘','자신있는 성대모사 하기', '왼쪽 사람이 골라주는 노래 맞춰 춤추기',
    '첫사랑 이야기 해줘',
  ];
  RxList<String> showList = <String>[].obs;
  RxBool customizing = false.obs;
  final customTextController = TextEditingController();
  //Key custom = const Key('custom');
  List<String> tempList = [];


  void changeCustomizing(){
    if(customizing.value){
      customizing.value = false;
    }else{
      customizing.value = true;
    }
  }

  void resetList(){
    showList.clear();
    basicList = ['무반주 댄스 30초 동안 추기', '노래 3소절 부르기',
      '옆 테이블(모르는 사람)한테 인사하기', '이번만 봐줄게', '숨겨왔던 썰 하나만',
      '오른쪽에 앉은 사람 부탁 하나 들어주기', '왼쪽 사람한테 딱밤 맞기', '인디언 밥!',
      '귀여운척 한번 해줘','자신있는 성대모사 하기', '왼쪽 사람이 골라주는 노래 맞춰 춤추기',
      '첫사랑 이야기 해줘',
    ];
    showList.addAll(basicList);
    savePenalty(basicList);
  }

  @override
 void onInit(){
    super.onInit();
    loadPenalty();
    basicList = ['무반주 댄스 30초 동안 추기', '노래 3소절 부르기',
      '옆 테이블(모르는 사람)한테 인사하기', '이번만 봐줄게', '숨겨왔던 썰 하나만',
      '오른쪽에 앉은 사람 부탁 하나 들어주기', '왼쪽 사람한테 딱밤 맞기', '인디언 밥!',
      '귀여운척 한번 해줘','자신있는 성대모사 하기', '왼쪽 사람이 골라주는 노래 맞춰 춤추기',
      '첫사랑 이야기 해줘',
    ];
    if(customList.isEmpty){
      showList.value = basicList;
    }else{
      showList.value = customList;
    }
  }

  loadPenalty() async{
    prefs = await SharedPreferences.getInstance();
    customList = (prefs?.getStringList('custom') ?? []);
  }

  savePenalty(List<String> list) async{
    prefs = await SharedPreferences.getInstance();
    prefs?.setStringList('custom', list);
  }


  //바텀시트
  void penaltyInfo() {
    Get.bottomSheet(
      isScrollControlled: true,
            SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Container(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
                height: Get.height * 0.8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                        color: const Color(0xffaecdff), width: 5
                    ),
                    left: BorderSide(
                        color: const Color(0xffaecdff), width: 5
                    ),
                    right: BorderSide(
                        color: const Color(0xffaecdff), width: 5
                    ),
                  ),
                ),
                child: Obx( ()=> Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text('벌칙모드란 ?', style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold, fontFamily: 'OneTitle'),),
                            IconButton(
                              icon:  Icon(Icons.cancel, size: 40.r, color: const Color(0xffaecdff),),
                              onPressed: () => Get.back(),
                            )
                          ],
                        ),
                        Padding(padding:  EdgeInsets.only(bottom: 15.h),
                          child: Divider(
                            endIndent: Get.width/2,
                            thickness: 1,
                            color: const Color(0xff6c6c6c),
                          ),),
                         Text('게임 오버 시 아래 리스트 중\n벌칙이 랜덤하게 생성되요.',style: TextStyle(fontSize: 18.sp),),
                        Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(height: 50.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('${Get.put(PenaltyController()).showList.length} 개',style:  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.blueAccent,),),
                                     SizedBox(width: 10.w,),
                                    Visibility(
                                      visible: Get.put(PenaltyController()).customizing.value,
                                      child: TextButton(onPressed: (){Get.put(DialogController()).customReset();},
                                          child:  Text('초기화',style: TextStyle(color: Colors.redAccent,fontSize: 18.sp),)),
                                    ),
                                  ],
                                ),
                                TextButton(onPressed: (){
                                  if(Get.put(PenaltyController()).customizing.value){
                                    Get.put(PenaltyController()).savePenalty(Get.put(PenaltyController()).showList);
                                    Get.put(DialogController()).saveCustom();
                                  }
                                  Get.put(PenaltyController()).changeCustomizing();
                                },
                                  child:
                                  Text( Get.put(PenaltyController()).customizing.value ?
                                  '저장' : '편집하기', style:  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.blueAccent,),
                                  ),
                                )
                              ],
                            ),),
                        ),
                      ],
                    ),
                    AnimatedContainer(
                      height: Get.put(PenaltyController()).customizing.value ? 50.h : 0,
                      duration: const Duration(milliseconds: 600),
                      child: Visibility(
                        visible: Get.put(PenaltyController()).customizing.value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40.h,
                              width: Get.width - 100.h,
                              padding:  EdgeInsets.all(5.0.r),
                              child: TextField(
                                  textAlignVertical: TextAlignVertical.center,
                                  controller: Get.put(PenaltyController()).customTextController,
                                  decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xffdddddd),
                                          )
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xffaecdff),
                                          )
                                      )
                                  )
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Get.put(PenaltyController()).showList.add(Get.put(PenaltyController()).customTextController.text);
                                  //FocusScope.of(context).unfocus();
                                  Get.put(PenaltyController()).customTextController.clear();
                                },
                                child: Container(
                                  padding:  EdgeInsets.all(5.r),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffaecdff)
                                  ),
                                  child: Text('입력', style: TextStyle(fontSize:10.sp, color: Colors.white),textAlign: TextAlign.center,),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index){
                            return Container(
                              height: 25.h,
                              alignment: Alignment.bottomLeft,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: const Color(0xffaecdff),
                                          width: 0.5
                                      )
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(Get.put(PenaltyController()).basicList[index], style: const TextStyle(fontSize: 18)),
                                  Visibility(
                                    visible: Get.put(PenaltyController()).customizing.value,
                                    child: IconButton(
                                      icon: const Icon(Icons.delete_forever_outlined, color: Colors.redAccent,),
                                      onPressed: (){
                                        Get.put(PenaltyController()).showList.removeAt(index);
                                      },
                                    ),)
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index){
                            return  SizedBox(height: 7.h,);
                          },
                          itemCount: Get.put(PenaltyController()).showList.length
                      ),
                    ),
                     SizedBox(height: 10.h,),
                  ],
                ),
                ),
              ),
            )
    );
  }
}