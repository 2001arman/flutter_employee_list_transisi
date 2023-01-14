import 'package:flutter/material.dart';
import 'package:flutter_employee_list_transisi/constant.dart';

class EmployeeSkeletonView extends StatelessWidget {
  const EmployeeSkeletonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        right: defaultMargin / 2,
        left: defaultMargin / 2,
        top: defaultMargin - 5,
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: defaultMargin / 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: defaultMargin),
                  width: double.infinity,
                  height: 8,
                  color: Colors.white,
                ),
                const SizedBox(height: 5),
                Container(
                  width: 100,
                  height: 8,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
