import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gutendex/core/locale/app_locale_key.dart';
import 'package:gutendex/core/size/app_size.dart';
import 'package:gutendex/core/theme/app_text_style.dart';

class BookSummaryWidget extends StatelessWidget {
  final List<String>? summaries;

  BookSummaryWidget({
    super.key,
    required this.summaries,
  });

  final ValueNotifier<bool> _isExpanded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.info_outline,
              size: AppSize.iconSize14,
              color: Theme.of(context).hintColor,
            ),
            SizedBox(width: AppSize.width4),
            Expanded(
              child: Column(
                children: [
                  if (summaries != null)
                    ...List.generate(
                      summaries?.length ?? 0,
                      (index) {
                        return ValueListenableBuilder<bool>(
                          valueListenable: _isExpanded,
                          builder: (context, isExpanded, child) {
                            return Text(
                              summaries?[index] ?? "",
                              maxLines: isExpanded ? null : 3,
                              overflow: isExpanded
                                  ? TextOverflow.visible
                                  : TextOverflow.ellipsis,
                              style: AppTextStyle.text14RGrey(context),
                            );
                          },
                        );
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: AppSize.height4),
        ValueListenableBuilder<bool>(
          valueListenable: _isExpanded,
          builder: (context, isExpanded, child) {
            return InkWell(
              onTap: () {
                _isExpanded.value = !_isExpanded.value;
              },
              child: Text(
                  isExpanded
                      ? AppLocaleKey.seeLess.tr()
                      : AppLocaleKey.seeMore.tr(),
                  style: AppTextStyle.text14MPrimary(context)),
            );
          },
        ),
      ],
    );
  }
}
