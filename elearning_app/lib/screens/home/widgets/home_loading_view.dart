import 'package:flutter/material.dart';

import 'home_app_bar.dart';

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 20),
          HomeAppBar(),
          SizedBox(height: 20),

          _LoadingBox(height: 48),
          SizedBox(height: 24),

          _LoadingBox(height: 120),
          SizedBox(height: 30),

          _LoadingTitle(),
          SizedBox(height: 10),
          _HorizontalLoadingList(),

          SizedBox(height: 20),
          _LoadingTitle(),
          SizedBox(height: 10),
          _HorizontalLoadingList(),

          SizedBox(height: 20),
          _LoadingTitle(),
          SizedBox(height: 10),
          _VerticalLoadingList(),

          SizedBox(height: 100),
        ],
      ),
    );
  }
}

/// -------------------- HELPERS --------------------

class _LoadingBox extends StatelessWidget {
  final double height;

  const _LoadingBox({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class _LoadingTitle extends StatelessWidget {
  const _LoadingTitle();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class _HorizontalLoadingList extends StatelessWidget {
  const _HorizontalLoadingList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (_, __) => Container(
          width: 180,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

class _VerticalLoadingList extends StatelessWidget {
  const _VerticalLoadingList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (_) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
