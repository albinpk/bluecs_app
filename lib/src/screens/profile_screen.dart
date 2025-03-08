import 'package:flutter/material.dart';

const _pagePadding = 15.0;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const _chips = ['Profile', 'Inventory', 'All Posts', 'Job Posts'];
  int _selectedChipIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: const Text('Business Profile'),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(value: 1, child: Text('Option 1')),
                    const PopupMenuItem(value: 2, child: Text('Option 2')),
                  ];
                },
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(_pagePadding),
              child: Row(
                spacing: 10,
                children:
                    _chips.indexed
                        .map(
                          (e) => ChoiceChip(
                            label: Text(e.$2),
                            selected: e.$1 == _selectedChipIndex,
                            elevation: 0,
                            showCheckmark: false,
                            onSelected: (value) {
                              setState(() {
                                _selectedChipIndex = e.$1;
                              });
                            },
                            visualDensity: VisualDensity.compact,
                          ),
                        )
                        .toList(),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate([
              const _Company(),
              const _Rating(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: _pagePadding),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: theme.cardTheme.color,
                          foregroundColor: colors.onSurface,
                        ),
                        onPressed: () {},
                        child: const Text('Share Visiting Card'),
                      ),
                    ),

                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: theme.cardTheme.color,
                          foregroundColor: colors.onSurface,
                        ),
                        onPressed: () {},
                        child: const Text('Share Profile'),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const _About(),
              const SizedBox(height: 10),

              Card(
                shape: const RoundedRectangleBorder(),
                child: SizedBox(
                  height: 150,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: _pagePadding,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://images.pexels.com/photos/1581384/pexels-photo-1581384.jpeg?cs=srgb&dl=pexels-reneterp-1581384.jpg&fm=jpg',
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 10);
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // location
              const _Location(),

              // products and services
              const _Products(),

              const SizedBox(height: 20),
              const _SimilarStores(),

              const SizedBox(height: 20),
            ]),
          ),
        ],
      ),

      // nav bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: theme.scaffoldBackgroundColor,
        currentIndex: 4,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center_sharp),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Connections',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class _SimilarStores extends StatelessWidget {
  const _SimilarStores({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: _pagePadding,
          ).copyWith(right: 0),
          child: _TitleText(
            title: 'Similar Stores',
            trailing: TextButton(
              onPressed: () {},
              child: const Row(
                spacing: 5,
                children: [Text('View All'), Icon(Icons.arrow_forward_rounded)],
              ),
            ),
          ),
        ),

        SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: _pagePadding,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const _StoreCard();
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 10);
            },
          ),
        ),
      ],
    );
  }
}

class _StoreCard extends StatelessWidget {
  const _StoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colors = theme.colorScheme;
    return SizedBox(
      width: 240,
      child: Card(
        // margin: con,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 8,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                  child: Image.network(
                    'https://plus.unsplash.com/premium_photo-1661883237884-263e8de8869b?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudHxlbnwwfHwwfHx8MA%3D%3D',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                spacing: 5,
                children: [
                  const CircleAvatar(
                    radius: 13,
                    backgroundImage: NetworkImage('https://picsum.photos/100'),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Burger King',
                          style: textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Row(
                          spacing: 2,
                          children: [
                            Text(
                              '4.5',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.orange,
                              ),
                            ),
                            Icon(
                              Icons.star_rounded,
                              size: 10,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: colors.primary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      child: Text(
                        'Contact Us',
                        style: textTheme.labelSmall?.copyWith(fontSize: 8),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Location extends StatelessWidget {
  const _Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: _pagePadding),
          child: _TitleText(title: 'Business Location'),
        ),
        Card(
          margin: const EdgeInsets.all(_pagePadding),
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            'https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/07/route-marked-on-a-map.jpg',
          ),
        ),
      ],
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText({required this.title, super.key, this.trailing});

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class _Products extends StatelessWidget {
  const _Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(_pagePadding),
            child: Row(
              spacing: 10,
              children: [
                ChoiceChip(
                  label: const Text('Products'),
                  selected: true,
                  elevation: 0,
                  showCheckmark: false,
                  onSelected: (value) {},
                ),
                ChoiceChip(
                  label: const Text('Services'),
                  selected: false,
                  elevation: 0,
                  showCheckmark: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 180,
            // width: double.infinity,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: _pagePadding,
              ).copyWith(bottom: 15),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://static.toiimg.com/thumb/83565509.cms?width=1200&height=900',
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 10);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _About extends StatelessWidget {
  const _About({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.all(_pagePadding),
      child: Column(
        spacing: 10,
        children: [
          const _TitleText(
            title: 'About Our Business',
            trailing: Icon(Icons.arrow_forward_rounded),
          ),

          // description
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. '
            'Curabitur aliquet quam id dui posuere blandit.',

            style: textTheme.labelSmall?.copyWith(color: Colors.grey),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),

          // details
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                spacing: 15,
                children: [
                  Row(
                    children: [
                      _buildStatus(
                        icon: Icons.star_rounded,
                        theme: theme,
                        label: '4.5',
                      ),
                      const SizedBox(height: 20, child: VerticalDivider()),
                      _buildStatus(
                        icon: Icons.remove_red_eye,
                        theme: theme,
                        label: '100+',
                      ),
                      const SizedBox(height: 20, child: VerticalDivider()),
                      _buildStatus(
                        icon: Icons.comment,
                        theme: theme,
                        label: '50+',
                      ),
                      const SizedBox(height: 20, child: VerticalDivider()),
                      _buildStatus(
                        icon: Icons.person,
                        theme: theme,
                        label: '50+',
                      ),
                    ],
                  ),

                  DefaultTextStyle(
                    style: textTheme.labelMedium!,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Since 1980'),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Joined At',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: ': 1/1/2024'),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Posts',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: ': 31'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatus({
    required IconData icon,
    required String label,
    required ThemeData theme,
  }) => Expanded(
    child: Row(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: theme.colorScheme.primary, size: 20),
        Text(label, style: theme.textTheme.labelSmall),
      ],
    ),
  );
}

class _Rating extends StatelessWidget {
  const _Rating({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colors = theme.colorScheme;
    return Card.filled(
      // color: colors.surfaceContainerHighest,
      margin: const EdgeInsets.all(_pagePadding),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          spacing: 10,
          children: [
            Text(
              'Rate Our Business',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < 5; i++)
                  Icon(
                    i == 0 ? Icons.star_rounded : Icons.star_outline_rounded,
                    color: i == 0 ? colors.primary : null,
                    size: 40,
                  ),
              ],
            ),
            Text('0 Rated - View Ratings', style: textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _Company extends StatelessWidget {
  const _Company({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colors = theme.colorScheme;
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: const EdgeInsets.all(_pagePadding),
      child: Row(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // logo
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              'https://w7.pngwing.com/pngs/676/74/png-transparent-fast-food-mcdonald-s-logo-golden-arches-restaurant-mcdonalds-mcdonald-s-logo-miscellaneous-food-company.png',
            ),
          ),

          // content
          Expanded(
            child: Column(
              spacing: 10,
              children: [
                Row(
                  children: [
                    // name
                    Expanded(
                      child: Text(
                        'McDonalds',
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // type
                    Chip(
                      label: const Text('Restaurant'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.yellow),
                      ),
                      labelStyle: textTheme.labelSmall,
                      visualDensity: VisualDensity.compact,

                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),

                // location
                Row(
                  spacing: 10,
                  children: [
                    ClipOval(
                      child: ColoredBox(
                        color: colors.primary.withValues(alpha: 0.5),
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(Icons.location_on_outlined, size: 18),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut.',
                        style: textTheme.labelSmall?.copyWith(
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () {},
                        child: const Text('Follow'),
                      ),
                    ),

                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Chat'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
