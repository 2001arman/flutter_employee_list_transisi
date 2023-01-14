import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_employee_list_transisi/constant.dart';
import 'package:flutter_employee_list_transisi/cubit/employee_cubit.dart';
import 'package:flutter_employee_list_transisi/pages/create_employee_page.dart';
import 'package:flutter_employee_list_transisi/widgets/custom_card_employee.dart';
import 'package:flutter_employee_list_transisi/widgets/employee_skeleton_view.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<EmployeeCubit>().getEmployee();
  }

  @override
  Widget build(BuildContext context) {
    Widget skeletonSection() {
      return ListView.builder(
        itemCount: 6,
        // controller: scrollController,
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: const EmployeeSkeletonView(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Transisi"),
        backgroundColor: kBlueColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateEmployeePage(),
            ),
          );
        },
        tooltip: "Create Employee",
        backgroundColor: kBlueColor,
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<EmployeeCubit, EmployeeState>(
        builder: (context, state) {
          if (state is EmployeeLoading) {
            return skeletonSection();
          } else if (state is EmployeeSuccess) {
            return ListView.builder(
              itemCount: state.employee.length,
              padding: EdgeInsets.only(bottom: defaultMargin),
              itemBuilder: ((context, index) => CustomCardEmployee(
                    employee: state.employee[index],
                  )),
            );
          } else if (state is EmployeeFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
