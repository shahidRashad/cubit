import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_cubit/project_cubit/cubit/details_cubit.dart';
import 'package:project_cubit/project_cubit/model/model.dart';
import 'package:project_cubit/widget/custom_button.dart';
import 'package:project_cubit/widget/text_filed_custom.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  late List<Model> userList;
  final formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController mobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          actions: [
            IconButton(
                onPressed: (() {
                  Navigator.pushNamed(context, "/add_page");
                }),
                icon: Icon(Icons.add))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: BlocBuilder<DetailsCubit, DetailsState>(
            builder: (context, state) {
              if(state.user != null){
              context.read<DetailsCubit>().setData(nameController,
                  jobController, placeController, mobController);}
              userList = state.user;
              return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userList[index].name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      userList[index].job,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      userList[index].place,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      userList[index].mobile.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    CustomdButton(
                                        text: "Edit",
                                        onpress: () {
                                          context
                                              .read<DetailsCubit>()
                                              .showEdit(index);
                                        }),
                                    CustomdButton(
                                        text: "Delete",
                                        color: Colors.red[400],
                                        onpress: () {
                                          showAlert(context, index);
                                        })
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        if (index == state.index && state.set == true)
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Form(
                              key: formkey,
                              child: Column(
                                children: [
                                  CustomTextField(
                                    label: "Name",
                                    controller: nameController,
                                    hint: "enter name here",
                                    validator: Validator.empty,
                                    keyboardType: TextInputType.name,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    label: "Job",
                                    controller: jobController,
                                    validator: Validator.empty,
                                    keyboardType: TextInputType.text,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    label: "Place",
                                    controller: placeController,
                                    validator: Validator.empty,
                                    keyboardType: TextInputType.text,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    label: "Mobile No",
                                    controller: mobController,
                                    validator: Validator.empty,
                                    keyboardType: TextInputType.phone,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CustomdButton(
                                      text: "Update",
                                      onpress: () {
                                        if (formkey.currentState!.validate()) {
                                          String name = nameController.text;
                                          String job = jobController.text;
                                          String place = placeController.text;
                                          double mobile =
                                              double.parse(mobController.text);
                                          Model model = new Model(
                                              name: name,
                                              mobile: mobile,
                                              job: job,
                                              place: place);
                                          //state.user.add(model);
                                          context.read<DetailsCubit>().updateData(model);
                                        }
                                      })
                                ],
                              ),
                            ),
                          ),
                        Container()
                      ],
                    );
                  });
            },
          ),
        ));
  }

  Future<dynamic> showAlert(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Delete?"),
            content: const Text("Are you want to delete data?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("No")),
              TextButton(
                  onPressed: () {
                    context.read<DetailsCubit>().delete(index);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(color: Colors.red[700]),
                  )),
            ],
          );
        });
  }
}
