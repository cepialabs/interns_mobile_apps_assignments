import '../../core/repo/home_repository.dart';
import '../../core/services/home_api_service.dart';
import 'widgets/continue_learning_section.dart';
import 'widgets/development_section.dart';
import 'widgets/home_loading_view.dart';
import 'widgets/search_filter_chips.dart';
import 'widgets/top_design_section.dart';
import 'widgets/trending_section.dart';
import 'package:flutter/material.dart';

import 'model/home_response_model.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  String selectedFilter = 'All';

  late Future<HomeResponseModel> homeFuture;
  final HomeRepository repository = HomeRepository(HomeApiService());

  @override
  void initState() {
    super.initState();
    homeFuture = repository.getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<HomeResponseModel>(
          future: homeFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const HomeLoadingView();
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || !snapshot.data!.success) {
              return const Center(child: Text('No data available'));
            }

            final data = snapshot.data!.data;
            // final continueLearning = data.continueLearning;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const HomeAppBar(),
                    const SizedBox(height: 20),

                    SearchBarWidget(
                      onTap: () {
                        print('Search bar tapped');
                      },
                      onFilterTap: () {
                        print('Filter tapped');
                      },
                    ),
                    const SizedBox(height: 12),

                    SearchFilterChips(
                      filters: const [
                        'All',
                        'UI/UX',
                        'Development',
                        'Flutter',
                        'Design',
                        'Popular',
                        'New',
                      ],
                      selectedFilter: selectedFilter,
                      onSelected: (value) {
                        setState(() {
                          selectedFilter = value;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    const SizedBox(height: 20),

                    ContinueLearningSection(data: data.continueLearning),

                    TrendingSection(courses: data.trendingCourses),

                    TopDesignSection(courses: data.topDesignCourses),

                    DevelopmentSection(courses: data.developmentCourses),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
