import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class NoteWidget extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final int selectedButton;
  final void Function()? onTap;
  const NoteWidget({required this.title,required this.date,required this.time,required this.selectedButton,this.onTap,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10,left: 10,bottom: 5),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.black,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColor.yellow),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),

                    Text(date,style: TextStyle(
                      color: AppColor.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),),

                    Text(time,style: TextStyle(
                      color: AppColor.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),),

                  ],
                ),
                if(selectedButton == 0 || selectedButton == 1)
                  Icon(Icons.check,color: AppColor.yellow,),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
