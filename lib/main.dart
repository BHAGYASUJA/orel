
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Get/controller/student.dart';
import 'Get/views/imagePicker.dart';



void main(){
  runApp(MaterialApp(home: HttpHome(),));
}

class HttpHome extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(child:
                Text("Student Registration",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),))
              ],
            ),
          ),
          Expanded(
              child: Obx(() {
                if(controller.isLoading.value){
                  return Center(child: CircularProgressIndicator(),);
                }else{
    return
    // GridView.builder(
    //   itemCount: controller.productList.length,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount:2,
    //     crossAxisSpacing:10,
    //     mainAxisSpacing:10,
    //   ),
    //   itemBuilder: (context, index) {
    //     return ProductCutom(controller.productList[index]);
    //   });
      ListView.builder(
        itemCount: controller.productList.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCutom(controller.productList[index]);
       //      ListTile(
       //        // ProductCutom(controller.productList[index]);
       //       leading: Text(photos[index]['academicYearId'].toString()),
       //      title: Text(photos[index]['title']),
       //     subtitle: Text('photo id:${photos[index]['id']}'),
       // );
        },);
                }
              }))
        ],
      ),
    );
  }
}