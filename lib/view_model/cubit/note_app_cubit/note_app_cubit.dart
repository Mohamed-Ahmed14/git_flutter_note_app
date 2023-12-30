
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/note_model.dart';
import 'note_app_state.dart';

class NoteCubit extends Cubit<NoteState>{
  NoteCubit():super(NoteInitialState());

  static NoteCubit get(context) => BlocProvider.of<NoteCubit>(context);

  List<bool> selectedButton=[true,false,false];
  int pressedButton=0;

  void changeButton(int index)
  {
    selectedButton.fillRange(0, 3,false);
    selectedButton[index]=true;
    pressedButton=index;
    emit(ButtonChangeState());

  }

  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  
  List<NoteModel> tasks=[];
  void addTask()
  {
    tasks.add(NoteModel(
        title: titleController.text,
        date: dateController.text,
        time: timeController.text,
        ));
    emit(AddTaskState());
  }

  List<NoteModel> done=[];
  void addDoneNote(int index)
  {
    done.add(NoteModel(
        title: tasks[index].title,
        date: tasks[index].date,
        time: tasks[index].time));
    tasks.removeAt(index);
    emit(AddDoneTaskState());
  }

  List<NoteModel> archive=[];
  void addArchiveNote(int index)
  {
    archive.add(NoteModel(
        title: done[index].title,
        date: done[index].date,
        time: done[index].time));

    done.removeAt(index);
    emit(AddArchiveTaskState());
  }
}