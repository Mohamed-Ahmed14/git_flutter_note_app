




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_test/view/note_app/note_app_screen.dart';
import 'package:note_app_test/view_model/cubit/note_app_cubit/note_app_cubit.dart';
import 'package:note_app_test/view_model/cubit/observer.dart';

void main()
{
  Bloc.observer = MyBlocObserver();


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