import 'package:flutter/material.dart';
import 'package:gutendex/core/custom_widgets/custom_image/custom_network_image.dart';
import 'package:gutendex/core/size/app_size.dart';
import 'package:gutendex/core/theme/app_colors.dart';
import 'package:gutendex/core/theme/app_text_style.dart';
import 'package:gutendex/core/theme/style.dart';
import 'package:gutendex/features/home/domain/entity/book_data_entity.dart';
import 'package:gutendex/features/home/presentation/view/widget/book_summary_widget.dart';

class BookItemWidget extends StatelessWidget {
  final BookDataEntity? bookData;
  const BookItemWidget({
    super.key,
    required this.bookData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: appShadow,
              color: AppColor.whiteColor(context),
              borderRadius: BorderRadius.circular(AppSize.radius11),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.radius11),
                    topRight: Radius.circular(AppSize.radius11),
                  ),
                  child: CustomNetworkImage(
                    fit: BoxFit.cover,
                    height: AppSize.height136,
                    width: double.infinity,
                    imageUrl: bookData?.formats?.image ?? "",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.padding12,
                    vertical: AppSize.padding10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              bookData?.title ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  AppTextStyle.text16MSecond(context).copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(width: AppSize.width8),
                        ],
                      ),
                      SizedBox(height: AppSize.height6),
                      if (bookData?.authors != null)
                        ...List.generate(
                          bookData?.authors?.length ?? 0,
                          (index) => Padding(
                            padding:
                                EdgeInsets.only(bottom: AppSize.bottomPadding4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  size: AppSize.iconSize14,
                                  color: Theme.of(context).hintColor,
                                ),
                                SizedBox(width: AppSize.width4),
                                Expanded(
                                  child: Text(
                                    bookData?.authors?[index].name ?? "",
                                    style: AppTextStyle.text16SDark(context),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      SizedBox(height: AppSize.height6),
                      BookSummaryWidget(
                        summaries: bookData?.summaries,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
