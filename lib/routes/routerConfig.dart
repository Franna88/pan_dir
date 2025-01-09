import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminPortal.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/ContactUsPage/ContactUsMainPage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginMainPage/ownersPortal.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesByAddress/servicesByAddressSearch.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/services.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/navPage/nav.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/navPage/navBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/websiteDisclaimer/WebsiteDisclaimer.dart';
import 'package:webdirectories/PanelBeatersDirectory/panelBeatersHome.dart';
import 'package:webdirectories/SuperAdmin/superAdmin.dart';
import 'package:webdirectories/routes/routerNames.dart';

class Routerconfig {
  static GoRouter returnRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: Routernames.panelbeatersHome,
          builder: (BuildContext context, GoRouterState state) =>
              const PanelBeatersHome(),
          routes: [
            GoRoute(
              path: ':id/profile',
              name: Routernames.panelbeatersServicesProfile,
              builder: (BuildContext context, GoRouterState state) => Services(
                listingId: state.pathParameters['id']!,
                page: ServicesPages.profile,
              ),
            ),
            GoRoute(
              path: ':id/contact',
              name: Routernames.panelbeatersServicesContact,
              builder: (BuildContext context, GoRouterState state) => Services(
                listingId: state.pathParameters['id']!,
                page: ServicesPages.contact,
              ),
            ),
            GoRoute(
              path: ':id/reviews',
              name: Routernames.panelbeatersServicesReviews,
              builder: (BuildContext context, GoRouterState state) => Services(
                listingId: state.pathParameters['id']!,
                page: ServicesPages.reviews,
              ),
            ),
            GoRoute(
              path: ':id/maps',
              name: Routernames.panelbeatersServicesMaps,
              builder: (BuildContext context, GoRouterState state) => Services(
                listingId: state.pathParameters['id']!,
                page: ServicesPages.maps,
              ),
            ),
            GoRoute(
              path: ':id/documents',
              name: Routernames.panelbeatersServicesDocuments,
              builder: (BuildContext context, GoRouterState state) => Services(
                listingId: state.pathParameters['id']!,
                page: ServicesPages.documents,
              ),
            ),
            GoRoute(
              path: ':id/finance',
              name: Routernames.panelbeatersServicesFinance,
              builder: (BuildContext context, GoRouterState state) => Services(
                listingId: state.pathParameters['id']!,
                page: ServicesPages.finance,
              ),
            ),
            GoRoute(
              path: 'listings-near-me',
              name: Routernames.panelbeatersNearMe,
              builder: (BuildContext context, GoRouterState state) => Nav(
                pageIndex: panelNavPages.servicesnearme,
              ),
            ),
            GoRoute(
              path: 'listings-by-area',
              name: Routernames.panelbeatersByArea,
              builder: (BuildContext context, GoRouterState state) => Nav(
                pageIndex: panelNavPages.servicesarea,
              ),
            ),
            GoRoute(
              path: 'services-approvals-near-me',
              name: Routernames.panelbeatersServicesNearMe,
              builder: (BuildContext context, GoRouterState state) {
                final params = state.extra as Map<String, dynamic>;
                return Nav(
                  pageIndex: panelNavPages.servicesapprovalsnearme,
                  approvalsNearMeData: params,
                );
              },
            ),
            GoRoute(
              path: 'services-approvals-address',
              name: Routernames.panelbeatersServicesByAddress,
              builder: (BuildContext context, GoRouterState state) {
                final params = state.extra as Map<String, dynamic>;
                return Nav(
                  pageIndex: panelNavPages.servicesapprovalbyaddress,
                  approvalsAddressData: params,
                );
              },
            ),
            GoRoute(
              path: 'listings-by-address/address=:address&lat=:lat&lng=:lng',
              name: Routernames.panelbeatersByAddress,
              builder: (context, state) {
                return ServicesByAddressSearch(
                    addressData: state.pathParameters);
              },
            ),
            GoRoute(
                path: 'listings-keyword/search-data=:searchData',
                name: Routernames.panelbeatersKeyword,
                builder: (BuildContext context, GoRouterState state) {
                  return Nav(
                    pageIndex: panelNavPages.serviceskeyword,
                    searchData: state.pathParameters['searchData'],
                  );
                }),
            GoRoute(
              path: 'login',
              name: Routernames.panelbeatersOPLogin,
              builder: (BuildContext context, GoRouterState state) => Nav(
                pageIndex: panelNavPages.ownersportal,
              ),
            ),
            GoRoute(
              path: 'we-connect',
              name: Routernames.panelbeatersWeConnect,
              builder: (BuildContext context, GoRouterState state) => Nav(
                pageIndex: panelNavPages.weconnect,
              ),
            ),
            GoRoute(
              path: 'register',
              name: Routernames.panelbeatersOPRegister,
              builder: (BuildContext context, GoRouterState state) =>
                  const OwnersPortal(
                pageIndex: PanelLoginPages.register,
              ),
            ),
            GoRoute(
              path: 'verify-code',
              name: Routernames.panelbeatersOPCode,
              builder: (BuildContext context, GoRouterState state) =>
                  const OwnersPortal(
                pageIndex: PanelLoginPages.code,
              ),
            ),
            GoRoute(
              path: 'create-profile',
              name: Routernames.panelbeatersOPCreateProfile,
              builder: (BuildContext context, GoRouterState state) =>
                  const OwnersPortal(
                pageIndex: PanelLoginPages.createprofile,
              ),
            ),
            GoRoute(
              path: 'membership-options',
              name: Routernames.panelbeatersOPOption,
              builder: (BuildContext context, GoRouterState state) =>
                  const OwnersPortal(
                pageIndex: PanelLoginPages.options,
              ),
            ),
            GoRoute(
              path: 'agreement',
              name: Routernames.panelbeatersOPAgreement,
              builder: (BuildContext context, GoRouterState state) =>
                  const OwnersPortal(
                pageIndex: PanelLoginPages.agreement,
              ),
            ),
            GoRoute(
              path: 'whats-next',
              name: Routernames.panelbeatersOPWhatsNext,
              builder: (BuildContext context, GoRouterState state) =>
                  const OwnersPortal(
                pageIndex: PanelLoginPages.whatsnext,
              ),
            ),
            GoRoute(
              path: 'reset-otp',
              name: Routernames.panelbeatersOPResetOTP,
              builder: (BuildContext context, GoRouterState state) =>
                  const OwnersPortal(
                pageIndex: PanelLoginPages.resetotp,
              ),
            ),
            GoRoute(
              path: 'reset-password',
              name: Routernames.panelbeatersOPResetPassword,
              builder: (BuildContext context, GoRouterState state) =>
                  const OwnersPortal(
                pageIndex: PanelLoginPages.reset,
              ),
            ),
            GoRoute(
              path: 'articles',
              name: Routernames.panelbeatersArticles,
              builder: (BuildContext context, GoRouterState state) => Nav(
                pageIndex: panelNavPages.articles,
              ),
            ),
            GoRoute(
              path: 'lightstone-article',
              name: Routernames.panelbeatersRecentArticlesPage,
              builder: (BuildContext context, GoRouterState state) => Nav(
                pageIndex: panelNavPages.RecentArticlesPage,
              ),
            ),
            GoRoute(
              path: 'we-can-help',
              name: Routernames.panelbeatersWeCanHelp,
              builder: (BuildContext context, GoRouterState state) => Nav(
                pageIndex: panelNavPages.WeCanHelp,
              ),
            ),
            GoRoute(
              path: 'admin-portal',
              name: Routernames.panelbeatersAdminPortal,
              builder: (BuildContext context, GoRouterState state) =>
                  Material(child: const SuperAdmin()),
            ),
            GoRoute(
                path: 'owners-portal',
                name: Routernames.panelbeatersOwnersPortal,
                builder: (BuildContext context, GoRouterState state) {
                  final params = state.extra as Map<String, dynamic>;
                  return Material(
                      child: AdminPortal(
                    listingsId: params['listingsId'],
                    normalUser: params['normalUser'],
                  ));
                }),
            GoRoute(
              path: 'contact-us',
              name: Routernames.panelbeatersContactUs,
              builder: (BuildContext context, GoRouterState state) => Material(
                child: ContactUsMainPage(),
              ),
            ),
            GoRoute(
              path: 'disclaimer',
              name: Routernames.panelbeatersDisclaimer,
              builder: (BuildContext context, GoRouterState state) => Material(
                child: WebsiteDisclaimer(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
