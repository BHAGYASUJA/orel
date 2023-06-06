
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Modals/academicYear.dart';

class ProductCutom extends StatelessWidget {

  final Welcome productList;
  ProductCutom(this.productList);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 10),
                Text(
                  productList.academicStart,
                  maxLines: 2,
                  style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),

      SizedBox(
        height: 10),
        Text(
        productList.academicEnd,
        maxLines: 2,
        style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                // SizedBox(
                //     height: 10),
                // Text(
                //   productList.modifiedDate as String,
                //   maxLines: 2,
                //   style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),

                // SizedBox(
                //     height: 10),
                // Text(
                //   productList.academicYear,
                //   maxLines: 2,
                //   style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),

                SizedBox(
                    height: 10),
                Text(
                  productList.academicYear,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                 // maxLines: 2,
                 // style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
    // Text(
    // productList.modifiedDate as String ,
    // maxLines: 2,
    // style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),

              ],
            ),
            // Text(
            //   productList.academicStart,
            //   maxLines: 2,
            //   style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
            // Text(
            //   productList.academicEnd,
            //   maxLines: 2,
            //   style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
            // Text(
            //   productList.academicYear,
            //   maxLines: 2,
            //   style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
            //
            // Text(
            //   productList.institutionId,
            //   maxLines: 2,
            //   style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
            // Text(
            //   productList.institutionName,
            //   maxLines: 2,
            //   style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
            // Text(
            //   productList.modifiedBy,
            //   maxLines: 2,
            //   style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
            // SizedBox(
            //   height: 10,
            // ),
            // if(productList.rating != null)
            //   Container(
            //     decoration: BoxDecoration(
            //         color: Colors.blue,
            //         borderRadius: BorderRadius.circular(10)
            //     ),
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Text(productList.rating!.rate.toString(),
            //           style: TextStyle(),)
            //       ],
            //     ),
            //   )
          ],
        ),
      ),
    );
  }
}
