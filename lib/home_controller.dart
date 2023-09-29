import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_api/home_services.dart';
import 'package:get_api/post_model.dart';
import 'package:http/http.dart'as http;

class HomeController extends GetxController{

  HomeServices homeServices= HomeServices();
  List<PostModel> postList=[];
  bool isLoading=false;
  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  void getData()async{

    try{

      isLoading=true;
      update();
      http.Response response=await homeServices.getData();
      if(response.statusCode==200){
      List< dynamic> results= jsonDecode(response.body);
         results.forEach(( value) {
         postList.add(PostModel.fromJson(value));
       });
         isLoading=false;
      }
      update();

    }catch(exception){
      isLoading=false;
      update();
      print(exception);
    }
  }

}