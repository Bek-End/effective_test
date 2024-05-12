import 'package:effective_test/common/constants/app_colors.dart';
import 'package:effective_test/common/constants/assets.dart';
import 'package:effective_test/design/screens/search_result_screen.dart';
import 'package:effective_test/design/widgets/app_theme.dart';
import 'package:effective_test/design/widgets/text_field_widget.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TargetPointWidget extends StatefulWidget {
  const TargetPointWidget({super.key});

  @override
  State<TargetPointWidget> createState() => _TargetPointWidgetState();
}

class _TargetPointWidgetState extends State<TargetPointWidget> {
  late final _helperTargetPoints = [
    _HelperTargetPoint(
      label: 'Сложный маршрут',
      icon: Assets.icons.track,
      color: AppColors.green,
      onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const SearchResultScreen(),
      )),
    ),
    _HelperTargetPoint(
      label: 'Куда угодно',
      icon: Assets.icons.globe,
      color: AppColors.blue,
      onTap: () {},
    ),
    _HelperTargetPoint(
      label: 'Выходные',
      icon: Assets.icons.calendar,
      color: AppColors.darkBlue,
      onTap: () {},
    ),
    _HelperTargetPoint(
      label: 'Горячие билеты',
      icon: Assets.icons.fire,
      color: AppColors.red,
      onTap: () {},
    ),
  ];

  late final _helperTargetPoints2 = [
    _HelperTargetPoint(
      label: 'Стамбул',
      subTitle: 'Популярное направление',
      icon: Assets.images.constImages2[0],
      onTap: () {},
    ),
    _HelperTargetPoint(
      label: 'Сочи',
      subTitle: 'Популярное направление',
      icon: Assets.images.constImages2[1],
      onTap: () {},
    ),
    _HelperTargetPoint(
      label: 'Пхукет',
      subTitle: 'Популярное направление',
      icon: Assets.images.constImages2[2],
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.basic.shade2,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldWidget(
                  hint: 'Откуда - Москва',
                  controller: TextEditingController(),
                  prefixIcon: SvgPicture.asset(Assets.icons.airplaneUp),
                ),
                const Divider(),
                TextFieldWidget(
                  hint: 'Куда - Турция',
                  controller: TextEditingController(),
                  prefixIcon: SvgPicture.asset(
                    Assets.icons.search,
                    colorFilter: ColorFilter.mode(
                      colorScheme.basic.shadeF,
                      BlendMode.srcIn,
                    ),
                  ),
                  suffixIcon: SvgPicture.asset(
                    Assets.icons.close,
                    colorFilter: ColorFilter.mode(
                      colorScheme.basic.shadeF,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              _helperTargetPoints.length,
              (index) {
                final helperTargetPointItem = _helperTargetPoints[index];
                return Expanded(
                  child: GestureDetector(
                    onTap: helperTargetPointItem.onTap,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: helperTargetPointItem.color,
                          ),
                          child: SvgPicture.asset(helperTargetPointItem.icon),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          helperTargetPointItem.label,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: textTheme.text2,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: colorScheme.basic.shade2,
            ),
            child: Column(
              children: List.generate(
                _helperTargetPoints2.length,
                (index) {
                  final helperTargetPointItem = _helperTargetPoints2[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        onTap: helperTargetPointItem.onTap,
                        title: Text(helperTargetPointItem.label),
                        subtitle: Text(helperTargetPointItem.subTitle ?? ''),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            helperTargetPointItem.icon,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (index != _helperTargetPoints2.length - 1)
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Divider(),
                        ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _HelperTargetPoint with EquatableMixin {
  _HelperTargetPoint({
    required this.label,
    required this.icon,
    required this.onTap,
    this.color,
    this.subTitle,
  });

  final String label;
  final String icon;
  final VoidCallback onTap;
  final Color? color;
  final String? subTitle;

  @override
  List<Object?> get props => [label, icon, onTap, color, subTitle];
}
