




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_test/view/note_app/note_app_screen.dart';
import 'package:note_app_test/view_model/cubit/note_app_cubit/note_app_cubit.dart';

void main()
{

  // List<int> nums=[0,1,2,3,4,5];
  // nums.removeAt(3);
  // nums.add(10);
  // print(nums);

  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NoteCubit(),),

        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: NoteAppScreen(),
          ),
      ));
}