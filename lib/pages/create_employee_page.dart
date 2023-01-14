import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_employee_list_transisi/constant.dart';
import 'package:flutter_employee_list_transisi/cubit/create_cubit.dart';
import 'package:flutter_employee_list_transisi/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';

class CreateEmployeePage extends StatefulWidget {
  const CreateEmployeePage({Key? key}) : super(key: key);

  @override
  State<CreateEmployeePage> createState() => _CreateEmployeePageState();
}

class _CreateEmployeePageState extends State<CreateEmployeePage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _jobController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void getImage() async {
      _image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {});
    }

    Widget imageSection() {
      return GestureDetector(
        onTap: () async {
          getImage();
        },
        child: _image == null
            ? Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: defaultMargin),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kBlueColor,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              )
            : Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: defaultMargin),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 2, color: kBlueColor),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.file(
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    File(_image!.path),
                  ),
                ),
              ),
      );
    }

    Widget formSection() {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: defaultMargin / 2),
            TextFormField(
              controller: _nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill your name';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Name",
                focusColor: kBlueColor,
                iconColor: kBlueColor,
                icon: const Icon(Icons.person),
              ),
            ),
            SizedBox(height: defaultMargin / 2),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill your job';
                }
                return null;
              },
              controller: _jobController,
              decoration: InputDecoration(
                labelText: "Job",
                focusColor: kBlueColor,
                icon: const Icon(Icons.work),
              ),
            ),
            SizedBox(height: defaultMargin / 2),
            TextFormField(
              controller: _phoneController,
              maxLength: 16,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Telephone",
                focusColor: kBlueColor,
                icon: const Icon(Icons.phone),
              ),
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                focusColor: kBlueColor,
                icon: const Icon(Icons.email),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        title: const Text("Create New Contact"),
      ),
      body: ListView(
        padding: EdgeInsets.all(defaultMargin / 2),
        children: [
          Column(
            children: [
              imageSection(),
              formSection(),
              SizedBox(height: defaultMargin * 1.5),
              BlocConsumer<CreateCubit, CreateState>(
                listener: ((context, state) {
                  if (state is CreateSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        // backgroundColor: kGreenLightColor,
                        content: Text("Success create user on id: ${state.id}"),
                      ),
                    );
                  }
                }),
                builder: (context, state) {
                  if (state is CreateLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CustomButton(
                    onTap: () {
                      // print(_formKey);
                      if (_formKey.currentState!.validate()) {
                        context.read<CreateCubit>().createEmployee(
                              _nameController.text,
                              _jobController.text,
                              _phoneController.text,
                              _emailController.text,
                            );
                      }
                    },
                    title: "Create",
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
