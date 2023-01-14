import 'package:flutter/material.dart';
import 'package:flutter_employee_list_transisi/constant.dart';
import 'package:flutter_employee_list_transisi/models/employee_model.dart';
import 'package:flutter_employee_list_transisi/widgets/custom_card_detail.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.employee}) : super(key: key);

  final DataEmployee employee;

  @override
  Widget build(BuildContext context) {
    _launchCaller() async {
      Uri url = Uri.parse("tel:082129355094");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _launchEmail(String email) async {
      String? encodeQueryParameters(Map<String, String> params) {
        return params.entries
            .map((MapEntry<String, String> e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
            .join('&');
      }

      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: email,
        query: encodeQueryParameters(<String, String>{
          'subject': 'Haloo ini adalah project test dari Transisi',
        }),
      );

      launchUrl(emailLaunchUri);
    }

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              actions: [
                const Icon(Icons.star_border),
                SizedBox(width: defaultMargin / 2),
                const Icon(Icons.edit),
                SizedBox(width: defaultMargin / 2),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  width: double.infinity,
                  color: kBlueColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          employee.avatar,
                        ),
                      ),
                      SizedBox(height: defaultMargin),
                      Text(
                        "${employee.firstName} ${employee.lastName}",
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: defaultMargin),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  CustomCardDetail(
                    icon: Icons.phone,
                    title: "082129355094",
                    type: "Telephone",
                    isMessage: true,
                    onTap: () {
                      _launchCaller();
                    },
                  ),
                  CustomCardDetail(
                    icon: Icons.mail,
                    title: employee.email,
                    type: "E-mail",
                    onTap: () {
                      _launchEmail(employee.email);
                    },
                  ),
                  CustomCardDetail(
                    icon: Icons.share,
                    title: "Send Contact",
                    type: "Share",
                    onTap: () {
                      Share.share(
                          "Name: ${employee.firstName}, email: ${employee.email}");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
