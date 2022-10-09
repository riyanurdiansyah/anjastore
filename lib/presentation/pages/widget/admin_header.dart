import 'package:anjastore/styles/app_responsive.dart';
import 'package:anjastore/styles/app_style_text.dart';
import 'package:flutter/material.dart';

class AdminHeader extends StatelessWidget {
  const AdminHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: Colors.white,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/man.png',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Riyan Nurdiansyah',
                      style: AppStyleText.stylePoppins(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Owner',
                      style: AppStyleText.stylePoppins(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color.fromRGBO(241, 242, 244, 1),
              ),
              child: const Icon(
                Icons.settings_rounded,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          if (!AppResponsive.isDesktop(context))
            InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color.fromRGBO(241, 242, 244, 1),
                ),
                child: const Icon(
                  Icons.grid_view_rounded,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
