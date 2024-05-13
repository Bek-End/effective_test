import 'dart:math';

import 'package:effective_test/common/constants/app_colors.dart';
import 'package:effective_test/common/constants/assets.dart';
import 'package:effective_test/common/utils/date_time_extentions.dart';
import 'package:effective_test/design/logic/ticket/ticket_bloc.dart';
import 'package:effective_test/design/widgets/app_theme.dart';
import 'package:effective_test/design/widgets/bottom_sheet_with_header.dart';
import 'package:effective_test/design/widgets/filled_button_widget.dart';
import 'package:effective_test/design/widgets/rounded_button_widget.dart';
import 'package:effective_test/design/widgets/target_point_widget.dart';
import 'package:effective_test/design/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  late final TicketBloc _ticketBloc;
  late final _countryFromCtrl = TextEditingController();
  late final _countryToCtrl = TextEditingController();

  final _iconColors = [
    AppColors.red,
    AppColors.blue,
    AppColors.darkBasic.shadeF,
  ];

  @override
  void initState() {
    _ticketBloc = context.read<TicketBloc>();
    super.initState();
  }

  void _showBottomSheet() {
    BottomSheetWithHeader.show(
      context: context,
      content: const TargetPointWidget(),
    );
  }

  void _swapPlaces() {
    final tempVar = _countryFromCtrl.text;
    _countryFromCtrl.text = _countryToCtrl.text;
    _countryToCtrl.text = tempVar;
  }

  Future<DateTime?> _showDatePicker() async {
    return await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.utc(3000),
    );
  }

  void _changeDepartureDate() {
    _showDatePicker().then((date) {
      if (date == null) return;
      _ticketBloc.add(TicketChangeDepartureDateEvent(date));
    });
  }

  void _showAllTickets() {
    final date = (_ticketBloc.state as TicketOfferTicketsState).departureDate;
    _ticketBloc.add(TicketGetTicketsEvent(
      countryFrom: _countryFromCtrl.text,
      countryTo: _countryToCtrl.text,
      departureDate: date,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final themeText = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TicketBloc, TicketState>(
          buildWhen: (p, c) => p != c && c is TicketOfferTicketsState,
          builder: (context, state) {
            if (state is! TicketOfferTicketsState) {
              return const SizedBox.shrink();
            }

            final ticketOffers = state.ticketOffers;
            final departureDate = state.departureDate;

            return ListView(
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
                                controller: _countryFromCtrl,
                                suffixIcon: InkWell(
                                  onTap: _swapPlaces,
                                  child:
                                      SvgPicture.asset(Assets.icons.swapUpDown),
                                ),
                              ),
                              const Divider(),
                              TextFieldWidget(
                                hint: 'Куда - Турция',
                                controller: _countryToCtrl,
                                suffixIcon:
                                    SvgPicture.asset(Assets.icons.close),
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
                        onTap: _showDatePicker,
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
                        onTap: _changeDepartureDate,
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              text: departureDate.inDDMMM,
                              style: themeText.title4,
                              children: [
                                TextSpan(
                                  text: ', ${departureDate.weekdayName}',
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
                        min(ticketOffers.length, 3),
                        (index) {
                          final ticketOffer = ticketOffers[index];
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (index != 0)
                                Divider(color: colorScheme.basic.shade4),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
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
                                                  ticketOffer.title,
                                                  style: themeText.title4,
                                                ),
                                              ),
                                              Text(
                                                '${ticketOffer.price} ₽ ',
                                                style: themeText.title4,
                                              ),
                                              SvgPicture.asset(
                                                  Assets.icons.arrowRightIos),
                                            ],
                                          ),
                                          Text(
                                            ticketOffer.timeRange.join(' '),
                                            overflow: TextOverflow.ellipsis,
                                            style: themeText.title4,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 23),
                FilledButtonWidget(
                  onTap: _showAllTickets,
                  child: Text(
                    'Посмотреть все билеты',
                    style: themeText.buttonText.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
