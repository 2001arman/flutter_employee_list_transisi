import 'package:flutter/material.dart';
import 'package:flutter_employee_list_transisi/constant.dart';
import 'package:flutter_employee_list_transisi/models/employee_model.dart';
import 'package:flutter_employee_list_transisi/pages/detail_page.dart';

class CustomCardEmployee extends StatelessWidget {
  const CustomCardEmployee({
    Key? key,
    required this.employee,
  }) : super(key: key);

  final DataEmployee employee;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(employee: employee);
            },
          ),
        );
      },
      child: Container(
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
                image: DecorationImage(
                  image: NetworkImage(employee.avatar),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employee.firstName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(employee.email),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.star_border,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
