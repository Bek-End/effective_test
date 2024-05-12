import 'package:effective_test/design/widgets/app_theme.dart';
import 'package:flutter/material.dart';

class TicketCardWidget extends StatelessWidget {
  const TicketCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final themeText = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
            decoration: BoxDecoration(
              color: colorScheme.basic.shade1,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (true) const SizedBox(height: 5),
                Text('6 990 ₽ ', style: themeText.title1),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.red,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const _DateAndAirportCode(),
                    SizedBox(
                      width: 10,
                      child: Divider(color: colorScheme.basic.shade6),
                    ),
                    const _DateAndAirportCode(),
                    const SizedBox(width: 13),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: '3.5ч в пути',
                          style: themeText.text2,
                          children: true
                              ? [
                                  TextSpan(
                                    text: ' / ',
                                    style: themeText.text2.copyWith(
                                      color: colorScheme.basic.shade6,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Без пересадок',
                                    style: themeText.text2,
                                  ),
                                ]
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (true)
            Positioned(
              top: -8,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: colorScheme.blue,
                ),
                child: Text('Самый удобный', style: themeText.title4),
              ),
            )
        ],
      ),
    );
  }
}

class _DateAndAirportCode extends StatelessWidget {
  const _DateAndAirportCode();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final colorScheme = theme.colorScheme;
    final style = theme.textTheme.title4;

    return Column(
      children: [
        Text(
          '17:45',
          style: style,
        ),
        const SizedBox(height: 4),
        Text(
          'DME',
          style: style.copyWith(color: colorScheme.basic.shade6),
        ),
      ],
    );
  }
}
