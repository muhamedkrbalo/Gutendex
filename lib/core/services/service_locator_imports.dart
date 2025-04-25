import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gutendex/core/network/api_consumer.dart';
import 'package:gutendex/core/network/app_interceptors.dart';
import 'package:gutendex/core/network/constants.dart';
import 'package:gutendex/core/network/dio_consumer.dart';
import 'package:gutendex/features/home/data/data_source/local_data_source/home_local_data_source.dart';
import 'package:gutendex/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:gutendex/features/home/data/repository_impl/home_repository_impl.dart';
import 'package:gutendex/features/home/domain/repository/home_repository.dart';
import 'package:gutendex/features/home/domain/useCase/home_use_case.dart';
import 'package:gutendex/features/home/presentation/controller/home_cubit.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'service_locator.dart';
