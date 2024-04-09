import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomDialog({required String title,required String content,required Function() onPressConfirm}){
  Get.defaultDialog(
    title: title,
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divider(height: 1,color: Colors.grey.shade500,),
        const SizedBox(height: 12,),
        Text(content,style: const TextStyle(fontWeight: FontWeight.w400),),
        Container(
          margin: const EdgeInsets.only(top: 12,left: 12,right: 12),
          height: 54,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: EdgeInsets.zero
                  ),
                  onPressed: (){
                    Get.back();
                  },
                  child: const Text('Hủy')
                ),
              ),
              const SizedBox(width: 16,),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero
                  ),
                  onPressed: onPressConfirm,
                  child: const Text('Đồng ý')
                ),
              ),
            ],
          ),
        )
      ],
    )
  );
}
