import 'package:flutter/material.dart';
import 'package:flutter_employee_list_transisi/constant.dart';

class CustomCardDetail extends StatelessWidget {
  const CustomCardDetail(
      {Key? key,
      required this.icon,
      required this.title,
      required this.type,
      this.isMessage = false,
      required this.onTap})
      : super(key: key);

  final IconData icon;
  final String title, type;
  final bool isMessage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(
          right: defaultMargin - 5,
          left: defaultMargin - 5,
          top: defaultMargin / 2,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: defaultMargin - 5,
            horizontal: defaultMargin,
          ),
          child: Row(
            children: [
              Icon(icon, color: kBlueColor),
              SizedBox(width: defaultMargin),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: medium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      type,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              isMessage
                  ? const Icon(Icons.message, color: Colors.grey)
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
