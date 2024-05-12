import 'dart:math';

import 'package:effective_test/common/constants/app_colors.dart';
import 'package:effective_test/common/constants/assets.dart';
import 'package:effective_test/design/screens/tickets_screen.dart';
import 'package:effective_test/design/widgets/app_theme.dart';
import 'package:effective_test/design/widgets/bottom_sheet_with_header.dart';
import 'package:effective_test/design/widgets/filled_button_widget.dart';
import 'package:effective_test/design/widgets/rounded_button_widget.dart';
import 'package:effective_test/design/widgets/target_point_widget.dart';
import 'package:effective_test/design/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final _iconColors = [
    AppColors.red,
    AppColors.blue,
    AppColors.darkBasic.shadeF,
  ];

  void _showBottomSheet() {
    BottomSheetWithHeader.show(
      context: context,
      content: const TargetPointWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final themeText = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 47),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: colorScheme.basic.shade2,
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: colorScheme.basic.shade4,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.icons.arrowLeft,
                      colorFilter: ColorFilter.mode(
                        colorScheme.basic.shadeF,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFieldWidget(
                            hint: 'Откуда - Москва',
                            controller: TextEditingController(),
                            suffixIcon:
                                SvgPicture.asset(Assets.icons.swapUpDown),
                          ),
                          const Divider(),
                          TextFieldWidget(
                            hint: 'Куда - Турция',
                            controller: TextEditingController(),
                            suffixIcon: SvgPicture.asset(Assets.icons.close),
                            readOnly: true,
                            onTap: _showBottomSheet,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 13),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  RoundedButtonWidget(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(Assets.icons.add),
                        const SizedBox(width: 8),
                        Text(
                          'обратно',
                          style: themeText.title4,
                        )
                      ],
                    ),
                  ),
                  RoundedButtonWidget(
                    onTap: () {},
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: '24 фев',
                          style: themeText.title4,
                          children: [
                            TextSpan(
                              text: ', сб',
                              style: themeText.title4.copyWith(
                                color: colorScheme.basic.shade6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  RoundedButtonWidget(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(Assets.icons.person),
                        const SizedBox(width: 8),
                        Text(
                          '1,эконом',
                          style: themeText.title4,
                        )
                      ],
                    ),
                  ),
                  RoundedButtonWidget(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(Assets.icons.filter),
                        const SizedBox(width: 8),
                        Text(
                          'фильтры',
                          style: themeText.title4,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: colorScheme.basic.shade1,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Прямые рельсы', style: themeText.title2),
                  const SizedBox(height: 8),
                  ...List.generate(
                    min(3, 3),
                    (index) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _iconColors[index % 3],
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Уральские авиалинии',
                                            style: themeText.title4,
                                          ),
                                        ),
                                        Text(
                                          '2 390 ₽ ',
                                          style: themeText.title4,
                                        ),
                                        SvgPicture.asset(
                                            Assets.icons.arrowRightIos),
                                      ],
                                    ),
                                    Text(
                                      '07:00  09:10   10:00  11:00  12:00  13:00  12:00      ',
                                      overflow: TextOverflow.ellipsis,
                                      style: themeText.title4,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(color: colorScheme.basic.shade4),
                      ],
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Показать все',
                        style: themeText.buttonText.copyWith(
                          color: colorScheme.blue,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 23),
            FilledButtonWidget(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const TicketsScreen(),
              )),
              child: Text(
                'Посмотреть все билеты',
                style: themeText.buttonText.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
