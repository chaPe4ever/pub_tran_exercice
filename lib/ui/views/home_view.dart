import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pub_tran_exercise/core/controllers/home_controller.dart';
import 'package:pub_tran_exercise/ui/views/widgets/custom_floating_search_bar/custom_floating_search_bar.dart';

class HomeView extends GetView<HomeController> {
  static const String route = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Search App'),
      ),
      // This is handled by the search bar itself.
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomFloatingSearchBar(),
        ],
      ),
    );
  }
}
