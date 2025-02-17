import 'package:effective_test/common/constants/assets.dart';
import 'package:effective_test/design/logic/ticket/ticket_bloc.dart';
import 'package:effective_test/design/widgets/app_theme.dart';
import 'package:effective_test/design/widgets/bottom_sheet_with_header.dart';
import 'package:effective_test/design/widgets/target_point_widget.dart';
import 'package:effective_test/design/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  late final _countryFromCtrl = TextEditingController();
  late final _countryToCtrl = TextEditingController();

  final inputCyrillicFormat =
      FilteringTextInputFormatter.allow(RegExp("[а-яА-Я]"));

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
            const SizedBox(height: 28),
            Center(
              child: Text(
                'Поиск дешевых\nавиабилетов',
                textAlign: TextAlign.center,
                style: themeText.title1,
              ),
            ),
            const SizedBox(height: 36),
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
                      Assets.icons.search,
                      colorFilter: ColorFilter.mode(
                        colorScheme.basic,
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
                            controller: _countryFromCtrl,
                            inputFormatters: [inputCyrillicFormat],
                          ),
                          const Divider(),
                          TextFieldWidget(
                            hint: 'Куда - Турция',
                            controller: _countryToCtrl,
                            inputFormatters: [inputCyrillicFormat],
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
            const SizedBox(height: 32),
            Text('Музыкально отлететь', style: themeText.title1),
            const SizedBox(height: 25),
            SizedBox(
              height: 225,
              child: BlocBuilder<TicketBloc, TicketState>(
                buildWhen: (p, c) => p != c && c is TicketOffersState,
                builder: (context, state) {
                  if (state is! TicketOffersState) {
                    return const SizedBox.shrink();
                  }

                  final offers = state.offers;

                  return ListView.builder(
                    itemCount: offers.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final offer = offers[index];

                      return Container(
                        width: 132,
                        margin: EdgeInsets.only(right: index == 9 ? 0 : 67),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                Assets.images.constImages[index % 3],
                                width: 132,
                                height: 133.16,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(offer.title, style: themeText.title3),
                            const SizedBox(height: 8),
                            Text(offer.town, style: themeText.text2),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                SvgPicture.asset(Assets.icons.airplane),
                                Text(
                                  'от ${offer.price} ₽ ',
                                  style: themeText.text2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
