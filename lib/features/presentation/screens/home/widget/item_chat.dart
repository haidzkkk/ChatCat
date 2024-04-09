import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatbot/features/common/constants/assets_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ItemChat extends StatefulWidget {
  const ItemChat({super.key, required this.message, required this.typeQuestion});

  final String message;
  final bool typeQuestion;

  @override
  State<ItemChat> createState() => _ItemChatState();
}

class _ItemChatState extends State<ItemChat> {
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    flutterTts.setPitch(1);
    flutterTts.setLanguage('en-US');
    return Material(
      color: widget.typeQuestion ? Colors.white : Colors.black.withOpacity(0.002),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(10),
        child: contentWidget(),
      ),
    );
  }

  Widget contentWidget(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
            child: Image.asset(widget.typeQuestion ? MyAssets.bigLogo : MyAssets.logo, width: 30, height: 30, fit: BoxFit.cover,)
        ),
        const SizedBox(width: 10,),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.typeQuestion ? "You" : "Chat", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            widget.typeQuestion
                ? Text(widget.message)
                : AnimatedTextKit(
                    isRepeatingAnimation: false,
                    repeatForever: false,
                    totalRepeatCount: 1,
                    displayFullTextOnTap: true,
                    animatedTexts: [
                      TyperAnimatedText(widget.message)
                    ]
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () async{
                    await flutterTts.speak(widget.message);
                  },
                  icon: const Icon(Icons.volume_down),
                  iconSize: 20,
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                ),
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.copy),
                  iconSize: 15,
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                ),
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.share),
                  iconSize: 15,
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                ),
              ],
            )
          ],
        ))
      ],
    );
  }
}
