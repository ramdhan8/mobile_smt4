//import 'package:fic12_flutter_starter/presentation/home/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projek/presentation/account/addres_account.dart';
import 'package:projek/presentation/account/profil_page.dart';
import 'package:projek/presentation/home/pages/all_product.dart';
import 'package:projek/presentation/home/pages/elektronik_page.dart';
import 'package:projek/presentation/home/pages/sport_pages.dart';

import '../../presentation/address/models/address_model.dart';
import '../../presentation/address/pages/add_address_page.dart';
import '../../presentation/address/pages/address_page.dart';
import '../../presentation/address/pages/edit_address_page.dart';
import '../../presentation/auth/pages/login_page.dart';
import '../../presentation/auth/pages/register_page.dart';
import '../../presentation/home/pages/dashboard_page.dart';
import '../../presentation/home/pages/fashion_page.dart';
import '../../presentation/home/pages/logout_page.dart';
import '../../presentation/intro/splash_page.dart';
import '../../presentation/order/pages/cart_page.dart';
import '../../presentation/order/pages/history_order_page.dart';
import '../../presentation/order/pages/order_detail_page.dart';
import '../../presentation/order/pages/payment_detail_page.dart';
import '../../presentation/order/pages/payment_waiting_page.dart';
import '../../presentation/order/pages/shipping_detail_page.dart';
import '../../presentation/order/pages/tracking_order_page.dart';

// import '../../../ui/address/models/address_model.dart';
// import '../../../ui/address/pages/add_address_page.dart';
// import '../../../ui/address/pages/address_page.dart';
// import '../../../ui/address/pages/edit_address_page.dart';
// import '../../../ui/auth/pages/login_page.dart';
// import '../../../ui/auth/pages/register_page.dart';
// import '../../../ui/auth/pages/verification_page.dart';
// import '../../../ui/home/models/product_model.dart';
// import '../../../ui/home/pages/product_detail_page.dart';
// import '../../../ui/home/pages/root_page.dart';
// import '../../../ui/intro/splash_page.dart';
// import '../../../ui/orders/pages/cart_page.dart';
// import '../../../ui/orders/pages/order_detail_page.dart';
// import '../../../ui/orders/pages/payment_detail_page.dart';
// import '../../../ui/orders/pages/shipping_detail_page.dart';
// import '../../../ui/orders/pages/tracking_order_page.dart';

part 'route_constants.dart';
part 'enums/root_tab.dart';
part 'models/path_parameters.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: RouteConstants.splashPath,
    routes: [
      GoRoute(
        name: RouteConstants.splash,
        path: RouteConstants.splashPath,
        builder: (context, state) => const SplashPage(),
      ),
      
      GoRoute(
        name: RouteConstants.login,
        path: RouteConstants.loginPath,
        builder: (context, state) => const LoginPage(),
        routes: [
          GoRoute(
            name: RouteConstants.register,
            path: RouteConstants.registerPath,
            builder: (context, state) => const RegisterPage(),
          ),
          
        ],
      ),
      GoRoute(
        name: RouteConstants.root,
        path: RouteConstants.rootPath,
        builder: (context, state) {
          final tab = int.tryParse(state.pathParameters['root_tab'] ?? '') ?? 0;
          return DashboardPage(
            key: state.pageKey,
            currentTab: tab,
          );
        },
        routes: [
          GoRoute(
              name: RouteConstants.orderList,
              path: RouteConstants.orderListPath,
              builder: (context, state) => const HistoryOrderPage(),
            ),
            GoRoute(
            name: RouteConstants.logout,
            path: RouteConstants.logoutPath,
            builder: (context, state) => const LogoutPage(),
          ),
          GoRoute(
            name: RouteConstants.sport,
            path: RouteConstants.sportPath, 
            builder: (context, state) => const SportPage(),
          ),
          GoRoute(
            name: RouteConstants.allProduct,
            path: RouteConstants.allProductPath,
            builder: (context, state) => const AllProduct(),
          ),
          GoRoute(
            name: RouteConstants.elektronik,
            path: RouteConstants.elektronikPath,
            builder: (context, state) => const ElektronikPage(),
          ),
          GoRoute(
            name: RouteConstants.fashion,
            path: RouteConstants.fashionPath,
            builder: (context, state) => const FashionPage(), 
          ),
          GoRoute(
            name: RouteConstants.profil,
            path: RouteConstants.profilPath,
            builder: (context, state) =>  ProfilPage(),
          ),
          GoRoute(
            name: RouteConstants.addressAccount,
            path: RouteConstants.addressAccountPath,
            builder: (context, state) =>  const AddressAccount(),
          ),
          GoRoute(
              name: RouteConstants.cart,
              path: RouteConstants.cartPath,
              builder: (context, state) => const CartPage(),
              routes: [
                GoRoute(
                  name: RouteConstants.orderDetail,
                  path: RouteConstants.orderDetailPath,
                  builder: (context, state) => const OrderDetailPage(),
                  routes: [
                  GoRoute(
                    name: RouteConstants.paymentDetail,
                    path: RouteConstants.paymentDetailPath,
                    builder: (context, state) => const PaymentDetailPage(),
                    routes: [
                      GoRoute(
                        name: RouteConstants.paymentWaiting,
                        path: RouteConstants.paymentWaitingPath,
                        builder: (context, state) {
                          final args = state.extra as int;
                          return PaymentWaitingPage(orderId: args);
                        },
                      ),
                       GoRoute(
                        name: RouteConstants.trackingOrder,
                        path: RouteConstants.trackingOrderPath,
                        builder: (context, state) {
                          final args = state.extra as int;
                          return TrackingOrderPage(orderId: args);
                        } ,
                        routes: [
                          GoRoute(
                            name: RouteConstants.shippingDetail,
                            path: RouteConstants.shippingDetailPath,
                            builder: (context, state) {
                              final args = state.extra as String;
                              return ShippingDetailPage(resi: args);
                            }
                                ,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
                  // routes: [
                  //   GoRoute(
                  //     name: RouteConstants.paymentDetail,
                  //     path: RouteConstants.paymentDetailPath,
                  //     builder: (context, state) => const PaymentDetailPage(),
                  //     routes: [
                  //       GoRoute(
                  //         name: RouteConstants.trackingOrder,
                  //         path: RouteConstants.trackingOrderPath,
                  //         builder: (context, state) => const TrackingOrderPage(),
                  //         routes: [
                  //           GoRoute(
                  //             name: RouteConstants.shippingDetail,
                  //             path: RouteConstants.shippingDetailPath,
                  //             builder: (context, state) =>
                  //                 const ShippingDetailPage(),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ],
                ),
              ],
              
            ),

              GoRoute(
              name: RouteConstants.address,
              path: RouteConstants.addressPath,
              builder: (context, state) => const AddressPage(),
              routes: [
                GoRoute(
                  name: RouteConstants.addAddress,
                  path: RouteConstants.addAddressPath,
                  builder: (context, state) => const AddAddressPage(),
                ),
                GoRoute(
                  name: RouteConstants.editAddress,
                  path: RouteConstants.editAddressPath,
                  builder: (context, state) {
                    final args = state.extra as AddressModel;
                    return EditAddressPage(data: args);
                  },
                ),
              ]),
        ],
      ),
      
      //   routes: [
      //     GoRoute(
      //       name: RouteConstants.productDetail,
      //       path: RouteConstants.productDetailPath,
      //       builder: (context, state) {
      //         final args = state.extra as ProductModel;
      //         return ProductDetailPage(data: args);
      //       },
      //     ),
      //     GoRoute(
      //       name: RouteConstants.cart,
      //       path: RouteConstants.cartPath,
      //       builder: (context, state) => const CartPage(),
      //     ),
      //     GoRoute(
      //       name: RouteConstants.address,
      //       path: RouteConstants.addressPath,
      //       builder: (context, state) => const AddressPage(),
      //       routes: [
      //         GoRoute(
      //           name: RouteConstants.addAddress,
      //           path: RouteConstants.addAddressPath,
      //           builder: (context, state) => const AddAddressPage(),
      //         ),
      //         GoRoute(
      //           name: RouteConstants.editAddress,
      //           path: RouteConstants.editAddressPath,
      //           builder: (context, state) {
      //             final args = state.extra as AddressModel;
      //             return EditAddressPage(data: args);
      //           },
      //         ),
      //         GoRoute(
      //           name: RouteConstants.orderDetail,
      //           path: RouteConstants.orderDetailPath,
      //           builder: (context, state) => const OrderDetailPage(),
      //           routes: [
      //             GoRoute(
      //               name: RouteConstants.paymentDetail,
      //               path: RouteConstants.paymentDetailPath,
      //               builder: (context, state) => const PaymentDetailPage(),
      //               routes: [
      //                 GoRoute(
      //                   name: RouteConstants.trackingOrder,
      //                   path: RouteConstants.trackingOrderPath,
      //                   builder: (context, state) => const TrackingOrderPage(),
      //                   routes: [
      //                     GoRoute(
      //                       name: RouteConstants.shippingDetail,
      //                       path: RouteConstants.shippingDetailPath,
      //                       builder: (context, state) =>
      //                           const ShippingDetailPage(),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    },
  );
}
