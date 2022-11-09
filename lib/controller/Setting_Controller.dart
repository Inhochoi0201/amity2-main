import 'package:amity2/util/Import_Package.dart';


class SettingController extends GetxController {
  RxString selectedTimer = '0'.obs;
  RxString selectedMinuteTimer = '0'.obs;
  RxBool penaltyMode = false.obs;
  RxString selectedPlayer = '0'.obs;
  RxString selectedMorePlayer = '0'.obs;
  RxString selectedMoreTeam = '0'.obs;
  RxBool isTeam = false.obs;
  final List<String> timer = [
    '3','4','5','6','7','8','9','10'
  ];
  final List<String> minuteTimer = [
    '1','2','3'
  ];
  final List<String> playMember = [
    '2', '3','4','5','6','7','8','9','10'
  ];
  final List<String> morePlayMember = [
    '3','4','5','6','7','8','9','10'
  ];
  final List<String> moreTeamMember = [
    '2','3','4','5'
  ];

  List<Player> playerList = [];

  final List<String> playerIMG = [
    'assets/images/player1.png',
    'assets/images/player2.png',
    'assets/images/player3.png',
    'assets/images/player4.png',
    'assets/images/player5.png',
    'assets/images/player6.png',
    'assets/images/player7.png',
    'assets/images/player8.png',
    'assets/images/player9.png',
    'assets/images/player10.png',
  ];

  void makePlayer(String s) {
    playerList.clear();
    for (var i = 1; i <= int.parse(s); i++) {
      playerList.add(
          Player(name: '플레이어${i}', image: playerIMG[i - 1], key: GlobalKey(), score: 0));
    }
  }

  void makeTeam(String s) {
    playerList.clear();
    for (var i = 1; i <= int.parse(s); i++) {
      playerList.add(
          Player(name: '팀$i', image: playerIMG[i - 1], key: GlobalKey(), score: 0));
    }
  }

/************widget**********************/

  Widget timerSetting(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Icon(Icons.timer_outlined, color: const Color(0xffaecdff), size: 24.r,),
         SizedBox(width: 10.w,),
         Text('타이머', style: TextStyle(fontSize: 16.sp),),
        Obx(() => Padding(
          padding:  EdgeInsets.all(16.r),
          child: CustomDropdownButton2(
            icon:  Icon(Icons.keyboard_arrow_down, color: const Color(0xffaecdff),size: 30.r,),
            buttonWidth: Get.width/3,
            buttonDecoration: BoxDecoration(
              border: Border.all(
                color:  const Color(0xffaecdff),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            valueAlignment: Alignment.center,
            dropdownItems: timer,
            value:  selectedTimer.value == '0' ? null : selectedTimer.value,
            onChanged: (value) {
              changeSelectedT(value);
            },
            hint: '3~10초',
          ),
        ),
        ),
      ],);
  }

  Widget playerSetting(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Icon(Icons.person_add_alt_outlined,size: 24.r, color: const Color(0xffaecdff),),
         SizedBox(width: 10.w,),
         Text('인원수', style: TextStyle(fontSize: 16.sp),),
        Obx(() => Padding(
          padding:  EdgeInsets.all(16.r),
          child: CustomDropdownButton2(
            icon:  Icon(Icons.keyboard_arrow_down, color: const Color(0xffaecdff),size: 30.sp,),
            buttonWidth: Get.width/3,
            buttonDecoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffaecdff),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            valueAlignment: Alignment.center,
            dropdownItems: playMember,
            value: selectedPlayer.value == '0' ? null : selectedPlayer.value,
            onChanged: (value) {
              changeSelectedP(value);
              makePlayer(value!);
            },
            hint: '2~10명',
          ),
        ),
        ),
      ],);
  }

  Widget penaltySetting(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Icon(Icons.auto_awesome, color: const Color(0xffaecdff), size: 24.r,),
           SizedBox(width: 10.w,),
           Text('벌칙 모드', style: TextStyle(fontSize: 16.sp),),
          Obx(()=>
              Row(
                children: [
                  IconButton(
                      onPressed: () => Get.put(PenaltyController()).penaltyInfo(),
                      icon:  Icon(Icons.question_mark_rounded, size: 24.r,color: const Color(0xffaecdff),) ),
                  Padding(
                      padding:  EdgeInsets.all(16.r),
                      child: Switch(
                        activeColor: const Color(0xffaecdff),
                        onChanged: (bool value) {
                          changePenalty(value);
                        },
                        value: penaltyMode.value,
                      )
                  ),
                ],
              ),
          ),
        ]);
  }

  Widget teamSetting(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: ()=> isTeam.value = false,
          child: Obx(
          ()=> Container(
              height: Get.height *0.1,
              width: Get.width * 0.4,
              decoration: BoxDecoration(
                border: Border.all(
                  color: !isTeam.value ? const Color(0xffaecdff) : Colors.grey.withOpacity(0.4),
                  width: !isTeam.value ? 2 : 1
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('개인전',style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: !isTeam.value ? const Color(0xffaecdff) : Colors.grey.withOpacity(0.4)),),
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.person, size: 50.r, color: !isTeam.value ?  const Color(0xffaecdff) : Colors.grey.withOpacity(0.4),),
                          Text('VS', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, fontFamily: 'OnePop', color: !isTeam.value ? const Color(0xffaecdff) : Colors.grey.withOpacity(0.4)),),
                          Icon(Icons.person, size: 50.r,color: !isTeam.value ?  const Color(0xffaecdff) : Colors.grey.withOpacity(0.4))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: ()=> isTeam.value = true,
          child: Obx(
            ()=>Container(
              height: Get.height *0.1,
              width: Get.width * 0.4,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: isTeam.value ? const Color(0xffaecdff) : Colors.grey.withOpacity(0.4),
                      width: isTeam.value ? 2 : 1
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                     Text('팀전',style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: isTeam.value ? const Color(0xffaecdff) : Colors.grey.withOpacity(0.4)),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Icon(Icons.people, size: 50.r, color: isTeam.value ?  const Color(0xffaecdff) : Colors.grey.withOpacity(0.4),),
                          Text('VS', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, fontFamily: 'OnePop', color: isTeam.value ? const Color(0xffaecdff) : Colors.grey.withOpacity(0.4)),),
                          Icon(Icons.people, size: 50.r,color: isTeam.value ?  const Color(0xffaecdff) : Colors.grey.withOpacity(0.4))
                        ],
                      ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  //분단위
  Widget minuteSetting(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Icon(Icons.timer_outlined, color: const Color(0xffaecdff), size: 24.sp,),
         SizedBox(width: 10.w,),
         Text('타이머', style: TextStyle(fontSize: 16.sp),),
        Obx(() => Padding(
          padding:  EdgeInsets.all(16.r),
          child: CustomDropdownButton2(
            icon:  Icon(Icons.keyboard_arrow_down, color: const Color(0xffaecdff),size: 30.sp,),
            buttonWidth: Get.width/3,
            buttonDecoration: BoxDecoration(
              border: Border.all(
                color:  const Color(0xffaecdff),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            valueAlignment: Alignment.center,
            dropdownItems: minuteTimer,
            value:  selectedMinuteTimer.value == '0' ? null : selectedMinuteTimer.value,
            onChanged: (value) {
              changeSelectedMT(value);
            },
            hint: '1~3분',
          ),
        ),
        ),
      ],);
  }
//3명이상게임
  Widget morePlayerSetting(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Icon(Icons.person_add_alt_outlined,size:24.r, color: const Color(0xffaecdff),),
         SizedBox(width: 10.w,),
         Text('인원수', style: TextStyle(fontSize: 16.sp),),
        Obx(() => Padding(
          padding:  EdgeInsets.all(16.r),
          child: CustomDropdownButton2(
            icon:  Icon(Icons.keyboard_arrow_down, color: const Color(0xffaecdff),size: 30.r,),
            buttonWidth: Get.width/3,
            buttonDecoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffaecdff),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            valueAlignment: Alignment.center,
            dropdownItems: morePlayMember,
            value: selectedMorePlayer.value == '0' ? null : selectedMorePlayer.value,
            onChanged: (value) {
              changeSelectedMoreP(value);
              makePlayer(value!);
            },
            hint: '3~10명',
          ),
        ),
        ),
      ],);
  }

//팀인원
  Widget moreTeamSetting(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Icon(Icons.people_alt,size: 24.r, color: const Color(0xffaecdff),),
         SizedBox(width: 10.w,),
         Text('팀(2인)', style: TextStyle(fontSize: 16.sp),),
        Obx(() => Padding(
          padding:  EdgeInsets.all(16.r),
          child: CustomDropdownButton2(
            icon:  Icon(Icons.keyboard_arrow_down, color: const Color(0xffaecdff),size: 30.sp,),
            buttonWidth: Get.width/3,
            buttonDecoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffaecdff),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            valueAlignment: Alignment.center,
            dropdownItems: moreTeamMember,
            value: selectedMoreTeam.value == '0' ? null : selectedMoreTeam.value,
            onChanged: (value) {
              changeSelectedTeam(value);
              makeTeam(selectedMoreTeam.value);
            },
            hint: '2~5팀',
          ),
        ),
        ),
      ],);
  }

  RxBool timeVisibleMode =  false.obs;
  Widget timerVisible(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Icon(Icons.visibility_off, color: const Color(0xffaecdff), size: 24.sp,),
           SizedBox(width: 10.w,),
           Text('타이머 가림막', style: TextStyle(fontSize: 16.sp),),
          Obx(()=>
                  Padding(
                      padding:  EdgeInsets.all(16.r),
                      child: Switch(
                        activeColor: const Color(0xffaecdff),
                        onChanged: (bool value) {
                          timeVisibleMode.value =value;
                        },
                        value: timeVisibleMode.value,
                      )
                  ),
          ),
        ]);
  }

  //theme
  Widget selectTheme(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.grid_4x4_rounded,size: 24.r, color: const Color(0xffaecdff),),
        SizedBox(width: 10.w,),
        Text('테마', style: TextStyle(fontSize: 16.sp),),
        SizedBox(width: 8.w,),
        Obx(() => Padding(
          padding:  EdgeInsets.all(16.r),
          child:  InkWell(
            onTap: ()=> Get.to(()=> ThemeView(), opaque: false, transition: Transition.fadeIn, fullscreenDialog: false),
            child: Container(
              key: Get.put(ThemeController()).themeKey,
              padding: EdgeInsets.symmetric(vertical: 5.h),
              width: Get.width/3,
              height: 38.h,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                  border: Border.all( color: const Color(0xffaecdff),)
                  ),
              child: Center(
                child: Text(selectedTheme.value, style: TextStyle(fontSize: selectedTheme.value == '테마를 선택해주세요.' ? 13.sp : 16.sp,
                    color: selectedTheme.value == '테마를 선택해주세요.' ? Colors.grey.withOpacity(0.4) : const Color(0xff3d3d3d), fontWeight: FontWeight.bold),),
              ),
            ),
          )
        ),
        ),
      ],
    );
  }

  var selectedTheme = '테마를 선택해주세요.'.obs;

  RxInt selectedRandomTime = (Random().nextInt(30)+30).obs;
  Widget randomTimer(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.timer_outlined, color: const Color(0xffaecdff), size: 24.sp,),
          SizedBox(width: 10.w,),
          Text('타이머(랜덤)', style: TextStyle(fontSize: 16.sp),),
              Padding(
                  padding:  EdgeInsets.all(16.r),
                  child: ToggleSwitch(
                    initialLabelIndex: 0,
                    totalSwitches: 3,
                    labels: const ['Fast','Basic','Slow'],
                    activeBgColor:const [Color(0xffAECDFF)],
                    activeFgColor: Colors.white,
                    inactiveBgColor: const Color(0xffdddddd),
                    inactiveFgColor: const Color(0xff3d3d3d),
                    onToggle: (index){
                      if(index == 0){
                        selectedRandomTime.value = (Random().nextInt(30)+30);
                      }else if(index == 1){
                        selectedRandomTime.value = (Random().nextInt(30)+60);
                      }else{
                        selectedRandomTime.value =(Random().nextInt(30)+90);
                      }
                      print(selectedRandomTime.value);
                    },
                  )
              ),
        ]);
  }

  void changePenalty(var val){
    penaltyMode.value = val;
  }
  void changeSelectedP(var val){
    selectedPlayer.value = val;
  }
  void changeSelectedMoreP(var val){
    selectedMorePlayer.value = val;
  }
  void changeSelectedTeam(var val){
    selectedMoreTeam.value = val;
  }
  void changeSelectedMT(var val){
    selectedMinuteTimer.value = val;
  }
  void changeSelectedT(var val){
    selectedTimer.value = val;
  }

}
