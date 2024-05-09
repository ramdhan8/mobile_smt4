import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projek/data/datasources/address_remote_datasource.dart';
import 'package:projek/data/datasources/auth_remote_datasource.dart';
import 'package:projek/data/datasources/order_remote_datasource.dart';
import 'package:projek/data/datasources/product_remote_datasource.dart';
import 'package:projek/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:projek/presentation/address/bloc/add_address/add_address_bloc.dart';
import 'package:projek/presentation/address/bloc/address/address_bloc.dart';
import 'package:projek/presentation/address/bloc/city/city_bloc.dart';
import 'package:projek/presentation/address/bloc/province/province_bloc.dart';
import 'package:projek/presentation/address/bloc/subdistrict/subdistrict_bloc.dart';
import 'package:projek/presentation/auth/bloc/login/login_bloc.dart';
import 'package:projek/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:projek/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:projek/presentation/home/bloc/best_seller/best_seller_product_bloc.dart';
import 'package:projek/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:projek/presentation/home/bloc/special_offer_product/special_offer_product_bloc.dart';
import 'package:projek/presentation/order/bloc/cost/cost_bloc.dart';
import 'package:projek/presentation/order/bloc/order/order_bloc.dart';
import 'package:projek/presentation/order/bloc/status_order/status_order_bloc.dart';
//import 'package:projek/presentation/order/bloc/order/order_bloc.dart';

import 'core/constants/colors.dart';
import 'core/router/app_router.dart';
import 'data/datasources/category_remote_datasouce.dart';
import 'data/datasources/firebase_messanging_remote_datasource.dart';
import 'presentation/home/bloc/category/category_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
await FirebaseMessagingRemoteDatasource().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final router = appRouter.router;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc(CategoryRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AllProductBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => BestSellerProductBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              SpecialOfferProductBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddressBloc(AddressRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => AddAddressBloc(AddressRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => ProvinceBloc(RajaongkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CityBloc(RajaongkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => SubdistrictBloc(RajaongkirRemoteDatasource()),
        ),BlocProvider(
          create: (context) => CostBloc(RajaongkirRemoteDatasource()),
        ),BlocProvider(
          create: (context) => OrderBloc(OrderRemoteDatasource()),
        ),BlocProvider(
          create: (context) => StatusOrderBloc(OrderRemoteDatasource()),
        ),

      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            titleTextStyle: GoogleFonts.quicksand(
              color: AppColors.primary,
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.black,
            ),
            centerTitle: true,
            shape: Border(
              bottom: BorderSide(
                color: AppColors.black.withOpacity(0.05),
              ),
            ),
          ),
        ),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
