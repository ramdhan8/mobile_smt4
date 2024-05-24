import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projek/presentation/home/pages/elektronik_page.dart';
import 'package:projek/presentation/home/pages/fashion_page.dart';
import 'package:projek/presentation/home/pages/sport_pages.dart';

import '../../../../core/core.dart';
import '../../../../data/models/responses/category_response_model.dart';
import '../../bloc/category/category_bloc.dart';
import '../category_button.dart';

class MenuCategories extends StatefulWidget {
  const MenuCategories({super.key});

  @override
  State<MenuCategories> createState() => _MenuCategoriesState();
}

class _MenuCategoriesState extends State<MenuCategories> {
  @override
  void initState() {
    context.read<CategoryBloc>().add(const CategoryEvent.getCategories());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (categories) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...categories.map(
                (category) => Flexible(
                  child: CategoryButton(
                    imagePath: category.image!,
                    label: category.name!,
                    onPressed: () {
                      _navigateToCategoryPage(category);
                    },
                  ),
                ),
              ),
            ],
          ),
          orElse: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (message) => Center(
            child: Text(message),
          ),
        );
        //   return Row(
        //   children: [
        //     Flexible(
        //       child: CategoryButton(
        //         imagePath: Assets.images.categories.menuBestseller.path,
        //         label: 'Bestseller',
        //         onPressed: () {},
        //       ),
        //     ),
        //     Flexible(
        //       child: CategoryButton(
        //         imagePath: Assets.images.categories.menuFlashsale.path,
        //         label: 'Flashsale',
        //         onPressed: () {},
        //       ),
        //     ),
        //     Flexible(
        //       child: CategoryButton(
        //         imagePath: Assets.images.categories.menuToprated.path,
        //         label: 'Toprated',
        //         onPressed: () {},
        //       ),
        //     ),
        //     Flexible(
        //       child: CategoryButton(
        //         imagePath: Assets.images.categories.menuMore.path,
        //         label: 'More',
        //         onPressed: () {},
        //       ),
        //     ),
        //   ],
        // );
      },
    );
  }


void _navigateToCategoryPage(Category category) {
    // Navigate to the corresponding page based on the category
    if (category.name == 'Sport') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SportPage()),
      );
    } else if (category.name == 'Electronic') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ElektronikPage()),
      );
    } else if (category.name == 'Fashion') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FashionPage()),
      );
    }
  }
}
