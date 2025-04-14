
import 'package:flutter/material.dart';

class ButtonLoadingWidget extends StatelessWidget{
  const ButtonLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(color: Colors.black,),
        ),
        SizedBox(width: 10,),
        Text("Loading...")
      ],
    );
  }

}