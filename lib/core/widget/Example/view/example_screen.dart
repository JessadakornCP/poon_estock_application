import 'package:poon_estock_application/core/base/base_screen.dart';
import 'package:poon_estock_application/core/widget/widgets.dart';
import 'package:flutter/material.dart';

import '../view_model/example_view_model.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      viewmodel: ExampleViewModel(context: context),
      builder: (context, viewmodel, child) {
        return BuildTemplateMain(child: _buildContent(context, viewmodel));
      },
    );
  }

  Widget _buildContent(BuildContext context, ExampleViewModel viewmodel) {
    return Column(
      children: [
        _buildHeader(context, viewmodel),
        _buildBody(context, viewmodel),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, ExampleViewModel viewmodel) {
    return const Column(children: []);
  }

  Widget _buildBody(BuildContext context, ExampleViewModel viewmodel) {
    return const Column(children: []);
  }
}
