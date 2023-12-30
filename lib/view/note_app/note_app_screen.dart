import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_test/core/utils/colors.dart';
import 'package:note_app_test/view/note_app/component/note_widget.dart';
import 'package:note_app_test/view_model/cubit/note_app_cubit/note_app_cubit.dart';
import 'package:note_app_test/view_model/cubit/note_app_cubit/note_app_state.dart';

import 'component/button_widget.dart';

class NoteAppScreen extends StatelessWidget {
  const NoteAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const int btTasksNo = 0;
    const int btDoneNo = 1;
    const int btArchiveNo = 2;

    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        title: Text(
          "To Do App",
          style: TextStyle(
            color: AppColor.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: BlocConsumer<NoteCubit, NoteState>(
        builder: (context, state) {
          var cubit = NoteCubit.get(context);
          return Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: ButtonWidget(
                  subject: "Tasks",
                  onTap: () {
                    cubit.changeButton(btTasksNo);
                  },
                  isSelected: cubit.selectedButton[btTasksNo],
                )),
                Expanded(
                    child: ButtonWidget(
                  subject: "Done",
                  onTap: () {
                    cubit.changeButton(btDoneNo);
                  },
                  isSelected: cubit.selectedButton[btDoneNo],
                )),
                Expanded(
                    child: ButtonWidget(
                  subject: "Archive",
                  onTap: () {
                    cubit.changeButton(btArchiveNo);
                  },
                  isSelected: cubit.selectedButton[btArchiveNo],
                )),
              ],
            ),
            SizedBox(height: 8,),

            if(cubit.pressedButton == btTasksNo && cubit.tasks.isEmpty)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No Data Avaliable",style: TextStyle(
                      color: AppColor.yellow,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
            if(cubit.pressedButton == btTasksNo && cubit.tasks.isNotEmpty)
              ListView.separated(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return NoteWidget(title:cubit.tasks[index].title,
                      date: cubit.tasks[index].date,
                      time: cubit.tasks[index].time,
                      selectedButton: btTasksNo,
                    onTap: (){
                    cubit.addDoneNote(index);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 5,);
                }, itemCount: cubit.tasks.length),
             if(cubit.pressedButton == btDoneNo && cubit.done.isEmpty)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No Data Avaliable",style: TextStyle(
                      color: AppColor.yellow,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
             if(cubit.pressedButton == btDoneNo && cubit.done.isNotEmpty)
               ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return NoteWidget(title:cubit.done[index].title,
                      date: cubit.done[index].date,
                      time: cubit.done[index].time,
                      selectedButton: btDoneNo,
                  onTap: (){
                    cubit.addArchiveNote(index);
                  },);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 5,);
                }, itemCount: cubit.done.length),
            if(cubit.pressedButton == btArchiveNo && cubit.archive.isEmpty)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No Data Avaliable",style: TextStyle(
                      color: AppColor.yellow,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
            if(cubit.pressedButton == btArchiveNo && cubit.archive.isNotEmpty)
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NoteWidget(title:cubit.archive[index].title,
                        date: cubit.archive[index].date,
                        time: cubit.archive[index].time,
                        selectedButton: btArchiveNo);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 5,);
                  }, itemCount: cubit.archive.length),


          ]);
        },
        listener: (context, state) {},
      ),




      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => BlocConsumer<NoteCubit, NoteState>(
                    builder: (context, state) {
                      var cubit = NoteCubit.get(context);
                      return AlertDialog(
                        backgroundColor: AppColor.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: AppColor.yellow, width: 1),
                        ),
                        title: Text(
                          "Add Task",
                          style: TextStyle(
                            color: AppColor.yellow,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: cubit.titleController,
                              decoration: InputDecoration(
                                hintText: "Title",
                                hintStyle: TextStyle(
                                  color: AppColor.yellow,
                                  fontSize: 16,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: AppColor.yellow, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: AppColor.yellow, width: 1),
                                ),
                              ),
                              cursorColor: AppColor.blue,
                              style: TextStyle(
                                color: AppColor.yellow,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: cubit.dateController,
                              keyboardType: TextInputType.none,
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2016),
                                  lastDate: DateTime(2031),
                                  initialDate: DateTime.now(),
                                ).then(
                                  (value) {
                                    cubit.dateController.text =
                                        "${value!.day}-${value.month}-${value.year}";
                                  },
                                );
                              },
                              decoration: InputDecoration(
                                hintText: "Date",
                                hintStyle: TextStyle(
                                  color: AppColor.yellow,
                                  fontSize: 16,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: AppColor.yellow, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: AppColor.yellow, width: 1),
                                ),
                              ),
                              cursorColor: AppColor.blue,
                              style: TextStyle(
                                color: AppColor.yellow,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: cubit.timeController,
                              keyboardType: TextInputType.none,
                              onTap: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then(
                                  (value) {
                                    cubit.timeController.text =
                                        "${value!.hour}:${value.minute}";
                                  },
                                );
                              },
                              decoration: InputDecoration(
                                hintText: "Time",
                                hintStyle: TextStyle(
                                  color: AppColor.yellow,
                                  fontSize: 16,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: AppColor.yellow, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: AppColor.yellow, width: 1),
                                ),
                              ),
                              cursorColor: AppColor.blue,
                              style: TextStyle(
                                color: AppColor.yellow,
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                          ],
                        ),
                        actions: [
                          Center(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.yellow,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                onPressed: () {
                                  cubit.addTask();

                                },
                                child: Text(
                                  "Add Task",
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        ],
                      );
                    },
                    listener: (context, state) {
                      if(state is AddTaskState)
                        {
                          Navigator.pop(context);
                          NoteCubit.get(context).titleController.clear();
                          NoteCubit.get(context).dateController.clear();
                          NoteCubit.get(context).timeController.clear();

                        }
                    },
                  ));
        },
        child: Icon(
          Icons.add,
          color: AppColor.white,
        ),
        backgroundColor: AppColor.yellow,
        shape: CircleBorder(),
      ),
    );
  }
}
