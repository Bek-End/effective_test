import 'package:effective_test/common/constants/assets.dart';
import 'package:effective_test/common/utils/date_time_extentions.dart';
import 'package:effective_test/design/widgets/app_theme.dart';
import 'package:effective_test/design/widgets/ticket_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({
    super.key,
    required this.countryFrom,
    required this.countryTo,
    required this.departureDate,
    required this.personCount,
  });

  final String countryFrom;
  final String countryTo;
  final DateTime departureDate;
  final int personCount;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final themeText = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: colorScheme.basic.shade1,
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.arrowLeft,
                    colorFilter: ColorFilter.mode(
                      colorScheme.blue,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$countryFrom-$countryTo',
                        style: themeText.title3,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${departureDate.inDDMMMM}, $personCount пассажир',
                        style: themeText.title4.copyWith(
                          color: colorScheme.basic.shade6,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ListView.builder(
                    itemCount: 10,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return const TicketCardWidget();
                    },
                  ),
                  FittedBox(
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: colorScheme.blue,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(Assets.icons.filter),
                                const SizedBox(width: 4),
                                Text('Фильтр', style: themeText.title4),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(Assets.icons.graffic),
                                const SizedBox(width: 4),
                                Text('График цен', style: themeText.title4),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
