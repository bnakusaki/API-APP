import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:apiapp/main.dart' as main;

class ReadMore extends StatelessWidget {
  const ReadMore({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    context.setLocale(main.localeState);
    return Scaffold(
      body: Scrollbar(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              stretch: true,
              expandedHeight: screenHeight * 0.3,
              title: Text(
                'title1'.tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              floating: true,
              centerTitle: true,
              flexibleSpace: const FlexibleSpaceBar(
                background: Image(
                  image: AssetImage('assets/images/image1.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Semantics(
                    readOnly: true,
                    child: Text(
                      """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lorem nisi, lacinia vel odio eget, vestibulum blandit nunc. Quisque ornare porttitor urna, et aliquam ex facilisis ac. Pellentesque erat turpis, porta sit amet mi quis, imperdiet pharetra ante. In nunc tellus, consequat sit amet congue placerat, facilisis vitae dolor. Nullam mollis massa eu nibh venenatis, eu laoreet neque interdum. Proin quis neque ex. Morbi a tincidunt risus. Morbi condimentum non ex eget viverra. Suspendisse interdum erat urna, et cursus sem ultrices et. Maecenas lobortis consequat consequat. In quis iaculis mi, in mattis eros. Nulla facilisi. Nunc aliquet lacus et tellus aliquet, sed porttitor augue tincidunt. Suspendisse efficitur dui quam, vel accumsan augue tincidunt in. Nunc pulvinar efficitur rutrum. Duis tristique fermentum justo, ac auctor risus pretium a.
                              
                              Mauris laoreet purus quis nunc tincidunt cursus. Morbi gravida augue pretium sapien volutpat dapibus. Aenean iaculis tempus nisi ac accumsan. Aliquam tristique condimentum augue vel pretium. Maecenas eget ultricies mi, id consequat arcu. Fusce velit enim, vulputate et nisi in, porta pellentesque ipsum. Mauris eleifend augue eget volutpat condimentum. Nullam hendrerit tellus eget fermentum pretium. Aenean dui ante, pretium quis urna non, pharetra vestibulum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed interdum quam porta, maximus mauris id, finibus arcu. Aenean ornare aliquam molestie. Cras lorem dolor, luctus id volutpat nec, aliquet sed nisi.
                              
                              Nunc rutrum lobortis sapien, non interdum felis. Integer eget lacus diam. Vestibulum non volutpat neque, non eleifend ante. Nullam scelerisque nisi nisl, et interdum erat eleifend nec. Curabitur non purus sit amet erat laoreet rhoncus ac nec nisl. Donec iaculis arcu eget volutpat fermentum. Donec blandit erat quis arcu facilisis efficitur. Sed luctus rutrum nunc, ut aliquet mauris tempus et. Suspendisse ornare leo et ultricies vestibulum. Ut viverra vehicula pharetra. Praesent ipsum elit, tincidunt nec vehicula non, maximus sit amet leo. Nulla sollicitudin dui nunc, scelerisque porta nisi gravida quis. Pellentesque sagittis nec risus ut aliquam.
                              
                              Maecenas mattis, metus sed fermentum ullamcorper, augue mi egestas arcu, non rutrum dolor magna sodales enim. In hac habitasse platea dictumst. Donec pulvinar neque turpis, ut vehicula diam fringilla et. Nullam mollis velit quis tincidunt venenatis. Maecenas interdum faucibus tempor. Cras fermentum finibus leo, at pharetra mauris molestie vitae. Donec ac sem id nibh efficitur vestibulum.
                              
                              Pellentesque mi libero, tincidunt maximus consectetur ac, porttitor vel risus. Aliquam vehicula purus ut dui interdum, sed mollis erat volutpat. Duis massa diam, varius quis ipsum a, iaculis euismod ligula. Donec sed quam ex. Aenean luctus sapien nec dui ultrices, sed ullamcorper est maximus. Suspendisse neque lorem, placerat in iaculis laoreet, convallis ut ante. Maecenas a condimentum arcu. Phasellus posuere lacus feugiat, lacinia erat ut, volutpat arcu. Nullam ultricies, felis dignissim lobortis venenatis, libero justo faucibus nunc, quis imperdiet nulla magna vel nisi. Sed in arcu vehicula, sollicitudin sem et, eleifend nulla. Integer in nunc consectetur, laoreet justo quis, porta risus. Nullam sollicitudin congue lacus, vel dignissim leo rhoncus et. Nunc rhoncus vel enim quis imperdiet.""",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
