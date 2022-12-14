import 'package:anjastore/constanta.dart';
import 'package:anjastore/presentation/pages/customer_page.dart';
import 'package:anjastore/presentation/pages/invoice_page.dart';
import 'package:anjastore/presentation/pages/item_page.dart';
import 'package:anjastore/presentation/pages/setting_page.dart';
import 'package:anjastore/presentation/pages/widget/admin_header.dart';
import 'package:anjastore/presentation/pages/widget/sidebar.dart';
import 'package:anjastore/styles/app_responsive.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    Key? key,
    required this.route,
  }) : super(key: key);

  final String route;

  @override
  Widget build(BuildContext context) {
    if (AppResponsive.isDesktop(context)) {
      return Container(
        color: Colors.blueGrey,
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 2,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Scaffold(
            backgroundColor: Colors.white,
            drawer: const CustomSidebar(),
            body: Row(
              children: [
                if (AppResponsive.isDesktop(context))
                  Expanded(
                    flex: 1,
                    child: CustomSidebar(
                      route: route,
                    ),
                  ),
                Expanded(
                  flex: 5,
                  child: MainWidget(
                    route: route,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        drawer: CustomSidebar(
          route: route,
        ),
        body: MainWidget(route: route),
      );
    }
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key, required this.route}) : super(key: key);

  final String route;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AdminHeader(),
        Expanded(
          child: AnimatedSwitcher(
            transitionBuilder: AnimatedSwitcher.defaultTransitionBuilder,
            duration: const Duration(milliseconds: 500),
            child: IndexedStack(
              index: listSidebar.indexWhere(
                (e) => e.route.contains(route),
              ),
              children: [
                Container(
                  color: Colors.red,
                ),
                CustomerPage(),
                InvoicePage(),
                const ItemPage(),
                const SettingPage(),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
