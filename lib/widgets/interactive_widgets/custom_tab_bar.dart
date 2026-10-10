import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';

class TabItem {
  const TabItem({
    required this.label,
    this.icon,
  });

  final String label;
  final IconData? icon;
}

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.tabViews,
    this.initialIndex = 0,
    this.backgroundColor,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.height = 48,
  });

  final List<TabItem> tabs;
  final List<Widget> tabViews;
  final int initialIndex;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final double height;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: widget.initialIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      children: [
        const SizedBox(height: 16),
        SizedBox(
          height: widget.height,
          child: TabBar(
            controller: _tabController,
            onTap: (index) {
              setState(() {
                _tabController.index = index;
              });
            },
            indicator: const BoxDecoration(color: Colors.transparent),
            labelColor: widget.labelColor ?? colors.accent,
            unselectedLabelColor: widget.unselectedLabelColor ?? colors.text1,
            labelStyle: AppTextStyles.t14(),
            unselectedLabelStyle: AppTextStyles.b14(),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            tabs: widget.tabs.asMap().entries.map((entry) {
              final index = entry.key;
              final tab = entry.value;
              return _CustomTab(
                isSelected: _tabController.index == index,
                label: tab.label,
                icon: tab.icon,
                colors: colors,
                accentColor: widget.indicatorColor ?? colors.accentSoft,
                backgroundColor: widget.backgroundColor ?? colors.surface,
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.tabViews,
          ),
        ),
      ],
    );
  }
}

class _CustomTab extends StatelessWidget {
  const _CustomTab({
    required this.isSelected,
    required this.label,
    this.icon,
    required this.colors,
    required this.accentColor,
    required this.backgroundColor,
  });

  final bool isSelected;
  final String label;
  final IconData? icon;
  final dynamic colors;
  final Color accentColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isSelected ? accentColor : backgroundColor,
        borderRadius: BorderRadius.circular(pillsRadius),
      ),
      child: Tab(
        icon: icon != null ? Icon(icon, size: 20) : null,
        text: label,
      ),
    );
  }
}
