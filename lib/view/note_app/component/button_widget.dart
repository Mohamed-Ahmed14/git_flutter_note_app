import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String subject;
  final bool isSelected;
  final void Function()? onTap;
  const ButtonWidget({required this.subject,this.isSelected=false,this.onTap,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.transparent,
          border: isSelected ? BorderDirectional(
              bottom: BorderSide(
                  color: AppColor.blue)
          ):null,
        ),
        child: Center(
          child: Text(subject,style: TextStyle(
            color: AppColor.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),),
        ),
      ),
    );
  }
}
