import 'package:get/get.dart';

class ShortCheckboxController extends GetxController {
  RxBool isRatingHL = false.obs;
  RxBool isRating = false.obs;
  RxBool isDeliveryTimeLowToHigh = false.obs;
  RxBool isDeliveryTimeHighToLow = false.obs;
  RxBool costLH = false.obs;
  RxBool costHL = false.obs;

  void clearToggle(){
    isRatingHL.value = !isRatingHL.value;
    isRating.value = !isRating.value;
    isDeliveryTimeLowToHigh.value = !isDeliveryTimeLowToHigh.value;
    isDeliveryTimeHighToLow.value = !isDeliveryTimeHighToLow.value;
    costLH.value = !costLH.value;
    costHL.value = !costHL.value;
  }

  void toggleCheckbox(String checkboxName) {
    switch (checkboxName) {
      case 'isRatingHL':
        if(isRating.value){
          isRatingHL.value = isRatingHL.value;
        }else{
          isRatingHL.value = !isRatingHL.value;
        }
        break;
      case 'isRating':
        if(isRatingHL.value){
          isRating.value = isRating.value;
        }else{
          isRating.value = !isRating.value;
        }
        break;
      case 'isDeliveryTimeLowToHigh':
        if(isDeliveryTimeHighToLow.value){
          isDeliveryTimeLowToHigh.value = isDeliveryTimeLowToHigh.value;
        }else{
          isDeliveryTimeLowToHigh.value = !isDeliveryTimeLowToHigh.value;
        }

        break;
      case 'isDeliveryTimeHighToLow':
        if(isDeliveryTimeLowToHigh.value){
          isDeliveryTimeHighToLow.value = isDeliveryTimeHighToLow.value;
        }else{
          isDeliveryTimeHighToLow.value = !isDeliveryTimeHighToLow.value;
        }
        break;
      case 'costLH':
        if(costHL.value){
          costLH.value = costLH.value;
        }else{
          costLH.value = !costLH.value;
        }
        break;
      case 'costHL':
        if(costLH.value){
          costHL.value = costHL.value;
        }else {
          costHL.value = !costHL.value;
        }
        break;
      default:
        break;
    }
  }
}
