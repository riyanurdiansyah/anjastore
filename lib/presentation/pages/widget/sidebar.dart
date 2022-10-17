import 'package:anjastore/constanta.dart';
import 'package:anjastore/styles/app_responsive.dart';
import 'package:anjastore/styles/app_style_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CustomSidebar extends StatelessWidget {
  const CustomSidebar({Key? key, this.route}) : super(key: key);

  final String? route;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 1.5,
      color: Colors.grey.shade200,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: Image.asset(
              "assets/images/anjas.png",
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              color: Colors.white,
              width: double.infinity,
              child: Drawer(
                elevation: 0,
                child: Material(
                  child: Column(
                    children: List.generate(
                      listSidebar.length,
                      (index) => SizedBox(
                        width: double.infinity,
                        child: InkWell(
                          overlayColor: MaterialStateProperty.all(
                              Colors.grey.withOpacity(0.4)),
                          highlightColor: Colors.grey,
                          onTap: () {
                            context.go('/${listSidebar[index].route}');
                            if (AppResponsive.isMobile(context)) {
                              Scaffold.of(context).closeDrawer();
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 1000,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            height: 60.0,
                            child: Row(
                              children: [
                                Container(
                                  width: 6,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: route == listSidebar[index].route
                                        ? Colors.blue
                                        : Colors.grey.shade200,
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Icon(
                                      listSidebar[index].icon,
                                      color: route == listSidebar[index].route
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      listSidebar[index].title,
                                      style: AppStyleText.stylePoppins(
                                        fontSize: 14,
                                        color: route == listSidebar[index].route
                                            ? Colors.blue
                                            : Colors.grey,
                                        fontWeight:
                                            route == listSidebar[index].route
                                                ? FontWeight.bold
                                                : FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
