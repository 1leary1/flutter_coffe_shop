import 'package:coffe_shop/src/features/menu/modeles/category_model.dart';
import 'package:coffe_shop/src/features/menu/view/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProdustGrid extends StatelessWidget {
  final CategoryModel model;

  const ProdustGrid({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          model.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 16,
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 2,
          ),
          itemCount: model.productsList.length,
          itemBuilder: (context, index) {
            return ProductCard(
              model: model.productsList[index],
            );
          },
        ),
        // SizedBox(
        //   width: double.infinity,
        //   child: TextButton.icon(
        //     onPressed: () {
        //       context
        //           .read<MenuBloc>()
        //           .add(LoadPageEvent(category: int.parse(model.id), page: 2));
        //     },
        //     icon: const Icon(
        //       Icons.arrow_drop_down_rounded,
        //       color: AppColors.black,
        //     ),
        //     label: Text('Больше',
        //         style: Theme.of(context).textTheme.displayMedium),
        //   ),
        // ),
      ],
    );
  }
}
