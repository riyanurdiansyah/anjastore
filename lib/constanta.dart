import 'package:anjastore/models/sidebar_m.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/sort_m.dart';
import 'routes/app_route_name.dart';

List<SidebarM> listSidebar = [
  SidebarM(
    title: "Home",
    icon: Icons.home_rounded,
    route: AppRouteName.home,
  ),
  SidebarM(
    title: "Customer",
    icon: Icons.group_rounded,
    route: AppRouteName.customer,
  ),
  SidebarM(
    title: "Invoice",
    icon: Icons.inventory,
    route: AppRouteName.invoice,
  ),
  SidebarM(
    title: "Item",
    icon: Icons.add_circle_outline_rounded,
    route: AppRouteName.item,
  ),
  SidebarM(
    title: "Setting",
    icon: Icons.settings_rounded,
    route: AppRouteName.setting,
  ),
];

List<SortM> listSortDate = [
  SortM(
    title: "Terbaru",
    type: "date",
    sortBy: "asc",
  ),
  SortM(
    title: "Terlama",
    type: "date",
    sortBy: "desc",
  ),
];

List<SortM> listSortName = [
  SortM(
    title: "A ~ z",
    type: "name",
    sortBy: "asc",
  ),
  SortM(
    title: "Z ~ a",
    type: "name",
    sortBy: "desc",
  ),
];

final currencyFormatter = NumberFormat.currency(
  locale: "id_ID",
  symbol: "Rp ",
  decimalDigits: 0,
);
final currencyFormatterCompact = NumberFormat.compactCurrency(
  locale: "id_ID",
  symbol: "",
  decimalDigits: 0,
);

NumberFormat numberFormat = NumberFormat.decimalPattern('id');
