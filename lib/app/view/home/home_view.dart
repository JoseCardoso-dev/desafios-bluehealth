import 'package:desafio_bluehealth/app/model/option_model.dart';
import 'package:desafio_bluehealth/app/src/utils/responsive_utils.dart';
import 'package:desafio_bluehealth/app/src/utils/transition_page_utils.dart';
import 'package:desafio_bluehealth/app/view/login/login_view.dart';
import 'package:desafio_bluehealth/app/viewModel/home_viewModel.dart';
import 'package:desafio_bluehealth/app/widgets/background_widget.dart';
import 'package:desafio_bluehealth/app/widgets/homeViewWidgets/card_widget.dart';
import 'package:desafio_bluehealth/app/widgets/homeViewWidgets/graphic_widget.dart';
import 'package:desafio_bluehealth/app/widgets/homeViewWidgets/option_item.dart';
import 'package:desafio_bluehealth/app/widgets/homeViewWidgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomePageState();
}

class _HomePageState extends State<HomeView> {
  final HomeViewModel homeViewModel = HomeViewModel();
  final ResponsiveUltils responsiveUltils = ResponsiveUltils();
  List<Option> options = [
    Option(image: 'images/homeView/cartao.png', name: 'Cartão'),
    Option(image: 'images/homeView/perfil.png', name: 'Perfil'),
    Option(image: 'images/homeView/grafico.png', name: 'Métricas'),
  ];

  @override
  void initState() {
    super.initState();
    homeViewModel.loadDataUser();
  }

  @override
  void dispose() {
    super.dispose();
    homeViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            SizedBox(
              width: responsiveUltils.getWidthSpacing(context, 20),
            ),
            Text(
              'Meu Saúde Blue',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16 * responsiveUltils.getTextScale(context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text(
                    'Sair',
                    textAlign: TextAlign.center,
                  ),
                  content: Text(
                    'Tem certeza que deseja sair do aplicativo?',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                          fontSize: 14 * responsiveUltils.getTextScale(context),
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        TransitionPageUtils.navigateToPage(
                          context,
                          const LoginView(),
                        );
                      },
                      child: Text(
                        'Sair',
                        style: TextStyle(
                          fontSize: 14 * responsiveUltils.getTextScale(context),
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(
              Icons.exit_to_app,
              size: 30 * responsiveUltils.getImageScale(context),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(
            width: responsiveUltils.getWidthSpacing(context, 15),
          )
        ],
      ),
      body: Stack(
        children: [
          const Background(),
          ValueListenableBuilder(
            valueListenable: homeViewModel,
            builder: (context, value, child) {
              return homeViewModel.loading
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            responsiveUltils.getWidthSpacing(context, 20),
                        vertical:
                            responsiveUltils.getHeightSpacing(context, 20),
                      ),
                      child: LoadingAnimationWidget.newtonCradle(
                        color: Theme.of(context).colorScheme.primary,
                        size: 100 * responsiveUltils.getImageScale(context),
                      ),
                    )
                  : Positioned(
                      top: responsiveUltils.getHeightSpacing(context, 30),
                      left: responsiveUltils.getWidthSpacing(context, 55),
                      right: responsiveUltils.getWidthSpacing(context, 55),
                      child: Text(
                        'Bem vindo, ${homeViewModel.user.firstName}!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40 * responsiveUltils.getTextScale(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
            },
          ),
          Positioned(
            top: 120,
            child: ClipPath(
              clipper: Clip(),
              child: Container(
                height: responsiveUltils.getHeightSpacing(context, 150),
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.primary,
                child: ValueListenableBuilder(
                  valueListenable: homeViewModel,
                  builder: (context, value, child) {
                    return Row(
                      children: [
                        ...List.generate(
                          options.length,
                          (index) => Container(
                            height:
                                responsiveUltils.getHeightSpacing(context, 250),
                            width: MediaQuery.of(context).size.width /
                                options.length,
                            color: homeViewModel.currentOption == index
                                ? Theme.of(context).colorScheme.secondary
                                : Colors.transparent,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 125,
            child: ClipPath(
              clipper: Clip(),
              child: Container(
                height: responsiveUltils.getHeightSpacing(context, 300),
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.primary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(options.length, (index) {
                      int decrease = 0;
                      int max = 1;
                      int bottomPadding = 0;
                      for (var i = 0; i < options.length; i++) {
                        bottomPadding =
                            index > max ? index - decrease++ : index;
                      }
                      return GestureDetector(
                        onTap: () {
                          homeViewModel.changeOption(index);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: responsiveUltils.getHeightSpacing(context, 20),
                            bottom: bottomPadding.abs() * 70,
                          ),
                          child: OptionItem(
                            option: options[index],
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -60,
            child: ClipPath(
              clipper: Clip(),
              child: Container(
                height: responsiveUltils.getHeightSpacing(context, 470),
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                ClipPath(
                  clipper: Clip(),
                  child: Container(
                    color: Colors.transparent,
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: homeViewModel,
                          builder: (context, value, child) {
                            return homeViewModel.loading
                                ? Center(
                                    child: LoadingAnimationWidget.newtonCradle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      size: 130 *
                                          responsiveUltils
                                              .getImageScale(context),
                                    ),
                                  )
                                : AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 500),
                                    child:
                                        toWidget(homeViewModel.currentOption),
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget toWidget(numero) {
    switch (numero) {
      case 0:
        return CardWidget(
          user: homeViewModel.user,
        );
      case 1:
        return ProfileWidget(
          imgUrl: homeViewModel.user.imgUrl!,
          name: homeViewModel.user.name!,
        );
      case 2:
        return const GraphicWidget();
      default:
        return const SizedBox.shrink();
    }
  }
}

class Clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 70);
    path.quadraticBezierTo(size.width / 2, -30, 0, 70);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
