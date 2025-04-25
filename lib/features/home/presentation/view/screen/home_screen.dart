import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutendex/core/custom_widgets/api_response_widget/api_response_widget.dart';
import 'package:gutendex/core/custom_widgets/custom_app_bar/custom_app_bar.dart';
import 'package:gutendex/core/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:gutendex/core/custom_widgets/custom_loading/custom_shimmer_list.dart';
import 'package:gutendex/core/custom_widgets/custom_notification_listener/custom_notification_listener.dart';
import 'package:gutendex/core/enum/cubit_state/cubit_state.dart';
import 'package:gutendex/core/locale/app_locale_key.dart';
import 'package:gutendex/core/services/service_locator_imports.dart';
import 'package:gutendex/core/size/app_size.dart';
import 'package:gutendex/features/home/presentation/controller/home_cubit.dart';
import 'package:gutendex/features/home/presentation/view/widget/book_item_widget.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _debounce;

  void _onSearchChanged(String value, BuildContext context) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      context.read<HomeCubit>().resetBooks();
      context.read<HomeCubit>().getBooks(search: value);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: const Text(AppLocaleKey.gutendex),
      ),
      body: BlocProvider(
        create: (context) => sl<HomeCubit>()..getBooks(),
        child: Builder(builder: (context) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSize.padding16.w, vertical: AppSize.padding10.h),
            child: Column(
              children: [
                Builder(builder: (context) {
                  return CustomFormField(
                    onChanged: (value) => _onSearchChanged(value, context),
                    hintText: AppLocaleKey.search.tr(),
                  );
                }),
                SizedBox(height: AppSize.height16),
                Expanded(
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      final homeCubit = context.read<HomeCubit>();
                      return CustomNotificationListener(
                        onLoadMore: () => homeCubit.getBooks(),
                        isLastPage: homeCubit.isLastPageBooks,
                        paginationStatus: state.paginateBooksStatus,
                        child: ApiResponseWidget(
                          cubitStatus: state.getBooksStatus,
                          onReload: () => homeCubit.getBooks(),
                          isEmpty: state.books.isEmpty,
                          loadingWidget: const CustomShimmerList(),
                          isOfflineData: state.isOfflineData,
                          child: RefreshIndicator(
                            onRefresh: () async {
                              context.read<HomeCubit>().resetBooks();
                              context.read<HomeCubit>().getBooks();
                            },
                            child: ListView.separated(
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                if (index < state.books.length) {
                                  return BookItemWidget(
                                      bookData: state.books[index]);
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: AppSize.height16),
                              itemCount: state.books.length +
                                  (homeCubit.state.paginateBooksStatus ==
                                          CubitStatus.loading
                                      ? 1
                                      : 0),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
