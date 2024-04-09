
import 'package:chatbot/features/presentation/screens/home/widget/bottom_model_widget.dart';
import 'package:chatbot/features/presentation/screens/home/widget/item_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../common/constants/assets_constants.dart';
import '../../blocs/home/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String route = "/home_route";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isTyping = true;
  bool isSpeech = false;
  TextEditingController textChatCtrl = TextEditingController();
  ScrollController chatScrollController = ScrollController();
  FocusNode textChatFocusNode = FocusNode();

  SpeechToText? textToSpeech;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.withOpacity(0.7),
        leading: Padding(
            padding: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: const BorderRadiusDirectional.all(Radius.circular(5)),
                child: Image.asset(MyAssets.logo, fit: BoxFit.cover,))),
        title: const Text("Chat cat", style: TextStyle(color: Colors.white),),
        actions: [
            popUpMenuSettingWidget()
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                controller: chatScrollController,
                itemCount: HomeBloc.listMessage.length,
                itemBuilder: (context, index) =>
                    ItemChat(
                        message: HomeBloc.listMessage[index],
                        typeQuestion: (index % 2 == 0)
                    ),
            )
          ),
          if(isTyping)
            const SpinKitThreeBounce(
              color: Colors.black,
              size: 18,
            ),
          Material(
            color: Colors.pink.withOpacity(0.1),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: TextField(
                      focusNode: textChatFocusNode,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black
                      ),
                      controller: textChatCtrl,
                      decoration: const InputDecoration.collapsed(
                          hintText: "Hãy đặt câu hỏi",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black45
                          ),
                      ),
                      onSubmitted: (value){
                        questionGeminiPro(textChatCtrl.text);
                        textChatCtrl.text = "";
                      },
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () async{
                      textChatFocusNode.unfocus();
                      if(!isSpeech){
                        print("bắt đầu nói");
                        isSpeech = true;
                        textToSpeech ??= SpeechToText();

                        await textToSpeech!.initialize();
                        await textToSpeech!.listen(onResult: (result){
                          textChatCtrl.text = result.recognizedWords;
                        });
                        setState(() {});
                      }else{
                        print("tắt nói");
                        isSpeech = false;
                        textToSpeech?.stop();
                        setState(() {});
                      }

                    },
                    icon: Icon(Icons.mic,
                      color: !isSpeech ? Colors.black45 : Colors.pink,
                    ),
                  visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                ),
                IconButton(
                    onPressed: (){
                      textChatFocusNode.unfocus();
                      questionGeminiPro(textChatCtrl.text);
                      textChatCtrl.text = "";
                    },
                    icon: Icon(Icons.send,
                      color: isTyping ? Colors.black45 : Colors.pink,
                    ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget popUpMenuSettingWidget() {
    return PopupMenuButton(
      icon: const Icon(Icons.settings, color: Colors.white,),
      itemBuilder: (context) => [
        const PopupMenuItem(child: Text("Chọn kiểu trả lời"), value: 0,),
        const PopupMenuItem(child: Text("child 2"), value: 1,),
        const PopupMenuItem(child: Text("child 3"), value: 2,),
      ],
      onSelected: (value){
        switch(value){
          case 0:{
            showModalBottomSheet(
                context: context,
                showDragHandle: true,
                builder: (context){
                  return const BottomModelWidget();
                }
            );
            break;
          }
          case 1:{
            break;
          }
          case 2:{
            break;
          }
          default:{

          }
        }
      },
    );
  }

  void questionGeminiPro(String value) async{
    HomeBloc.listMessage.add(value);
    setState(() {});
    chatScrollController.animateTo(chatScrollController.position.maxScrollExtent, duration: 500.milliseconds, curve: Curves.bounceOut);
    final model = GenerativeModel(model: 'gemini-pro', apiKey: "AIzaSyDv2QNn0qKKuljCF52SZZmF-t7jfZPovZ0");

    final content = [Content.text(value)];
    final response = await model.generateContent(content);

    HomeBloc.listMessage.add(response.text ?? "Không có thông tin");
    setState(() {});
    chatScrollController.animateTo(chatScrollController.position.maxScrollExtent, duration: 500.milliseconds, curve: Curves.bounceOut);
  }
}
