import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_cubit/project_cubit/cubit/details_cubit.dart';
import 'package:project_cubit/project_cubit/model/model.dart';
import 'package:project_cubit/widget/custom_button.dart';
import 'package:project_cubit/widget/text_filed_custom.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);

  final formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController mobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "Register Details",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        hint: "enter job here",
                        validator: Validator.empty,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        label: "Place",
                        controller: placeController,
                        hint: "enter place here",
                        validator: Validator.empty,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        label: "Mobile No",
                        controller: mobController,
                        hint: "enter mob here",
                        validator: Validator.empty,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<DetailsCubit, DetailsState>(
                        builder: (context, state) {
                          return CustomdButton(
                              text: "Submit",
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
                                  state.user.add(model);
                                  context.read<DetailsCubit>().add();
                                  Navigator.pop(context, model);
                                }
                              });
                        },
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
