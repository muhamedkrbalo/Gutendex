import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutendex/core/network/constants.dart';
import 'package:gutendex/core/services/service_locator_imports.dart';
import 'package:gutendex/features/home/domain/entity/author_entity.dart';
import 'package:gutendex/features/home/domain/entity/book_data_entity.dart';
import 'package:gutendex/features/home/domain/entity/formats_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/theme/theme_enum.dart';
import 'package:easy_localization/easy_localization.dart';

class ServiceInitialize {
  ServiceInitialize._();
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Hive.initFlutter();
    await ScreenUtil.ensureScreenSize();
    await EasyLocalization.ensureInitialized();
    Hive.registerAdapter(ThemeEnumAdapter());
    Hive.registerAdapter(BookDataEntityAdapter());
    Hive.registerAdapter(AuthorEntityAdapter());
    Hive.registerAdapter(FormatsEntityAdapter());
    await Hive.openBox('app');

    await Hive.openBox<BookDataEntity>(Constants.booksBox);
    await initDependencies();
  }
}
