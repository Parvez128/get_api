import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_api/home_controller.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeController homeController = Get.put(HomeController());

 // @override
  //void initState() {
    //homeController.getData();
    // TODO: implement initState
    //super.initState();
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update News'),
      ),
      body: GetBuilder<HomeController>(builder: (_){
          return homeController.isLoading?Center(child: CircularProgressIndicator()): ListView.builder(
              shrinkWrap: true,
              itemCount: homeController.postList.length,
              itemBuilder: (context,index){
                return ExpansionTile(title: Text(homeController.postList[index].title! ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Text(homeController.postList[index].id!.toString() ),
                        title: Text(homeController.postList[index].body!.toString() ),

                      ),
                    )
                  ],
                );
              });
        }),


    );
  }
}
