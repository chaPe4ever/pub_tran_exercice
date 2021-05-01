import 'package:get/get.dart';

mixin BaseController on GetxController {
  RxBool _isBusy = false.obs;

  bool get isBusy => _isBusy.value;

  set isBusy(bool value) {
    _isBusy.value = value;
  }
}
