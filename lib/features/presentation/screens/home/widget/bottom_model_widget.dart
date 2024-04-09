
import 'package:chatbot/features/presentation/blocs/home/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomModelWidget extends StatelessWidget {
  const BottomModelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Chọn người trả lời", style: TextStyle(fontSize: 16),),
          const SizedBox(height: 10,),
          DropdownButtonFormField(
              items: HomeBloc.listModels.toSet().map((e) =>
                  DropdownMenuItem(
                    child: Text(e,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        )
                    ),
                    value: e,)
              ).toList(),
              onChanged: (value) {

              },
          ),
        ],
      ),
    );
  }
}
