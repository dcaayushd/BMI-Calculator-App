import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BMIController extends GetxController {
  RxString Gender = "MALE".obs;
  RxInt weight = 12.obs;
  RxInt age = 12.obs;
  RxDouble height = 100.0.obs;
  RxString bMI = "".obs;
  RxDouble tempBMI = 0.0.obs;
  RxString bMIstatus = "".obs;
  Rx<Color> colorStatus = const Color(0xff246AFE).obs;

  void genderHandle(String gender) {
    Gender.value = gender;
  }

  void calculateBMI() {
    var hMeter = height / 100;
    tempBMI.value = weight / (hMeter * hMeter);
    bMI.value = tempBMI.toStringAsFixed(1);
    tempBMI.value = double.parse(bMI.value);
    findStatus();
    print(bMI);
  }

  void findStatus() {
    if (tempBMI.value < 18.5) {
      bMIstatus.value = "UnderWeight";
      colorStatus.value = const Color(0xffFFB800);
    }
    if (tempBMI.value > 18.5 && tempBMI.value < 24.9) {
      bMIstatus.value = "Normal";
      colorStatus.value = const Color(0xff00CA39);
    }
    if (tempBMI.value > 25.0 && tempBMI.value < 29.9) {
      bMIstatus.value = "OverWeight";
      colorStatus.value = const Color(0xffFF5858);
    }
    if (tempBMI.value > 30.0 && tempBMI.value < 34.9) {
      bMIstatus.value = "OBESE";
      colorStatus.value = const Color(0xffFF0000);
    }
    if (tempBMI.value > 35.0) {
      bMIstatus.value = "Extremely OBESE";

      colorStatus.value = const Color(0xff000000);
    }
  }
}
