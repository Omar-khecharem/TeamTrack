import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

enum MemberFilter { all, active, inactive, admin }

class FilterChips extends StatelessWidget {
  final MemberFilter selected;
  final ValueChanged<MemberFilter> onChanged;

  const FilterChips({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _Chip(
            label: 'All',
            icon: Icons.people_outline,
            selected: selected == MemberFilter.all,
            color: AppColors.primary,
            onTap: () => onChanged(MemberFilter.all),
          ),
          const SizedBox(width: 8),
          _Chip(
            label: 'Active',
            icon: Icons.check_circle_outline,
            selected: selected == MemberFilter.active,
            color: AppColors.success,
            onTap: () => onChanged(MemberFilter.active),
          ),
          const SizedBox(width: 8),
          _Chip(
            label: 'Inactive',
            icon: Icons.cancel_outlined,
            selected: selected == MemberFilter.inactive,
            color: Colors.grey,
            onTap: () => onChanged(MemberFilter.inactive),
          ),
          const SizedBox(width: 8),
          _Chip(
            label: 'Admin',
            icon: Icons.admin_panel_settings_outlined,
            selected: selected == MemberFilter.admin,
            color: Colors.blue,
            onTap: () => onChanged(MemberFilter.admin),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  const _Chip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: selected ? Colors.white : color,
          ),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
      selected: selected,
      onSelected: (_) => onTap(),
      selectedColor: color,
      checkmarkColor: Colors.white,
      labelStyle: TextStyle(
        color: selected ? Colors.white : null,
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: selected ? color : color.withAlpha(60),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
}
