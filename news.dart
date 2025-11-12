import 'dart:async';
import 'package:flutter/material.dart';

// --- 1. MODEL: The structure for a single news article ---
class NewsArticle {
  final String title;
  final String description;
  final String imageUrl;
  final String source;
  final String category;

  NewsArticle({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.source,
    required this.category,
  });
}

// --- 2. SERVICE: Mock Data Fetching (where a real API call would go) ---
class NewsService {
  // Mock data representing a JSON response from a real news API
  // Using specific image IDs from picsum.photos to simulate thematic relevance.
  static final List<NewsArticle> _mockArticles = [
    NewsArticle(
      title: 'Global Tech Summit Concludes with AI Breakthroughs',
      description: 'Experts predict massive shifts in robotics and large language models within the next year, pushing boundaries of innovation.',
      imageUrl: 'https://picsum.photos/id/21/800/600', // Tech focused
      source: 'Silicon Herald',
      category: 'Technology',
    ),
    NewsArticle(
      title: 'New Study Reveals Surprising Benefits of Blueberries',
      description: 'Daily consumption linked to improved cognitive function in adults over 50, showing promising results for brain health.',
      imageUrl: 'https://picsum.photos/id/160/800/600', // Health/Food focused
      source: 'Wellness Weekly',
      category: 'Health',
    ),
    NewsArticle(
      title: 'Central Bank Announces Unexpected Rate Hike',
      description: 'The Federal Reserve\'s move aims to cool down inflation, impacting stock market futures and consumer borrowing.',
      imageUrl: 'https://picsum.photos/id/19/800/600', // Finance focused
      source: 'The Daily Trader',
      category: 'Finance',
    ),
    NewsArticle(
      title: 'Explorers Discover Ancient City in Amazon Rainforest',
      description: 'Archaeologists uncover a vast network of ruins, shedding new light on pre-Columbian civilizations and their complex societies.',
      imageUrl: 'https://picsum.photos/id/30/800/600', // World/Exploration focused
      source: 'Global Explorer',
      category: 'World',
    ),
    NewsArticle(
      title: 'Underdog Team Wins Championship in Thrilling Overtime',
      description: 'Fans celebrate late into the night as the underdog team clinches the title in a nail-biting finish.',
      imageUrl: 'https://picsum.photos/id/1071/800/600', // Sports focused
      source: 'Sports Daily',
      category: 'Sports',
    ),
    NewsArticle(
      title: 'Quantum Computing Hits New Milestone',
      description: 'Researchers achieve sustained entanglement across multiple distant qubits in a major scientific leap.',
      imageUrl: 'https://picsum.photos/id/60/800/600', // Science/Tech focused
      source: 'Tech Insider',
      category: 'Technology',
    ),
    NewsArticle(
      title: 'Mars Rover Finds Subsurface Ice Deposits',
      description: 'The discovery confirms liquid water resources, fueling excitement for future manned missions to the red planet.',
      imageUrl: 'https://picsum.photos/id/1014/800/600', // Science/Space focused
      source: 'Astro Review',
      category: 'Science',
    ),
    NewsArticle(
      title: 'Acclaimed Chef Earns Michelin Star for Vegan Cuisine',
      description: 'The restaurant, "Green Plate," is praised for its innovative use of local, sustainable ingredients.',
      imageUrl: 'https://picsum.photos/id/183/800/600', // Food focused
      source: 'Gourmet World',
      category: 'Food',
    ),
    NewsArticle(
      title: 'Primary Election Results Signal Shift in National Mood',
      description: 'Unexpected victories challenge incumbents, setting the stage for a dramatic general election cycle.',
      imageUrl: 'https://picsum.photos/id/1015/800/600', // Politics focused
      source: 'Capitol Times',
      category: 'Politics',
    ),
    NewsArticle(
      title: 'Major Cities Commit to Net-Zero Carbon by 2040',
      description: 'A coalition of global mayors pledge aggressive climate action plans to curb urban emissions.',
      imageUrl: 'https://picsum.photos/id/1051/800/600', // Environment focused
      source: 'Green Planet',
      category: 'Environment',
    ),
    NewsArticle(
      title: 'Hollywood Blockbuster Shatters Box Office Records',
      description: 'The sci-fi epic, "Cosmic Drift," earns rave reviews for its stunning visuals and compelling storyline.',
      imageUrl: 'https://picsum.photos/id/1040/800/600', // Entertainment focused
      source: 'Screen Weekly',
      category: 'Entertainment',
    ),
    NewsArticle(
      title: 'New Pediatric Vaccine Shows High Efficacy',
      description: 'Clinical trials demonstrate 95% effectiveness against a common seasonal virus in children.',
      imageUrl: 'https://picsum.photos/id/350/800/600', // Health focused
      source: 'Medical Journal',
      category: 'Health',
    ),
    NewsArticle(
      title: 'Global Housing Market Enters Cooldown Phase',
      description: 'Rising interest rates and inventory increases lead to a deceleration in home price growth worldwide.',
      imageUrl: 'https://picsum.photos/id/150/800/600', // Finance focused
      source: 'Property Watch',
      category: 'Finance',
    ),
    NewsArticle(
      title: 'Deep Sea Submersible Discovers New Species',
      description: 'An expedition into the Mariana Trench brings back footage of bioluminescent creatures never before seen.',
      imageUrl: 'https://picsum.photos/id/1043/800/600', // Science focused
      source: 'Oceanographic Today',
      category: 'Science',
    ),
    NewsArticle(
      title: 'International Climate Accord Reached After Tense Talks',
      description: 'The agreement focuses on reducing methane emissions and protecting endangered ecosystems.',
      imageUrl: 'https://picsum.photos/id/1039/800/600', // Environment focused
      source: 'World Policy',
      category: 'Environment',
    ),
    NewsArticle(
      title: 'Basketball Championship Roster Undergoes Major Shakeup',
      description: 'Three veteran players traded in a move commentators describe as high-risk, high-reward.',
      imageUrl: 'https://picsum.photos/id/1074/800/600', // Sports focused
      source: 'Hoops Insider',
      category: 'Sports',
    ),
    NewsArticle(
      title: 'The Rise of Hyper-Casual Gaming on Mobile',
      description: 'Simple, addictive games are dominating app store charts, driving new revenue models.',
      imageUrl: 'https://picsum.photos/id/201/800/600', // Technology focused
      source: 'Digital Trends',
      category: 'Technology',
    ),
    NewsArticle(
      title: 'Volcanic Activity Monitored in Pacific Ring of Fire',
      description: 'Local authorities issue evacuation warnings as seismic activity increases near Mount Kila.',
      imageUrl: 'https://picsum.photos/id/1084/800/600', // World focused
      source: 'Geo Report',
      category: 'World',
    ),
    NewsArticle(
      title: 'Indie Game "Pixel Quest" Wins Multiple Awards',
      description: 'The retro-style RPG is lauded for its nostalgic graphics and innovative storytelling.',
      imageUrl: 'https://picsum.photos/id/202/800/600', // Entertainment focused
      source: 'Game Dev Monthly',
      category: 'Entertainment',
    ),
    NewsArticle(
      title: 'Mediterranean Diet Linked to Lower Dementia Risk',
      description: 'Long-term population study reinforces the benefits of plant-based diets for neurological health.',
      imageUrl: 'https://picsum.photos/id/210/800/600', // Food/Health focused
      source: 'Nutrition Today',
      category: 'Food',
    ),
    NewsArticle(
      title: 'Government Passes Landmark Digital Privacy Bill',
      description: 'The new legislation imposes strict limits on how tech companies can collect and use user data.',
      imageUrl: 'https://picsum.photos/id/20/800/600', // Politics/Tech focused
      source: 'Legal Review',
      category: 'Politics',
    ),
    NewsArticle(
      title: 'World GDP Forecast Adjusted Upwards for Next Quarter',
      description: 'Despite ongoing conflicts, global trade and manufacturing show surprising resilience.',
      imageUrl: 'https://picsum.photos/id/214/800/600', // Finance focused
      source: 'Economic Outlook',
      category: 'Finance',
    ),
    NewsArticle(
      title: 'New Satellite Deployment Improves Global GPS Accuracy',
      description: 'The next-generation satellites promise real-time, centimeter-level positioning for commercial use.',
      imageUrl: 'https://picsum.photos/id/207/800/600', // Technology/Science focused
      source: 'Space Systems',
      category: 'Technology',
    ),
    NewsArticle(
      title: 'Drought Continues to Impact West Coast Agriculture',
      description: 'Farmers face critical decisions as water reserves drop to historic lows for the third straight year.',
      imageUrl: 'https://picsum.photos/id/230/800/600', // Environment/World focused
      source: 'AgriNews',
      category: 'Environment',
    ),
  ];

  final List<String> availableCategories = [
    'All', 'Technology', 'Health', 'Finance', 'World', 'Sports', 
    'Science', 'Food', 'Politics', 'Environment', 'Entertainment'
  ];

  // Simulates an asynchronous API call with a 2-second delay
  Future<List<NewsArticle>> fetchTopHeadlines() async {
    await Future.delayed(const Duration(seconds: 2));
    return _mockArticles;
  }
}

// --- 3. MAIN APPLICATION & WIDGETS ---

void main() {
  runApp(const NewsReaderApp());
}

class NewsReaderApp extends StatelessWidget {
  const NewsReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News Reader',
      theme: ThemeData(
        // Primary color changed to Indigo for a more colorful look
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          elevation: 4,
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        scaffoldBackgroundColor: Colors.indigo[50], // Light background with Indigo tint
      ),
      home: const SplashScreen(), // Start with a Splash Screen
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NewsListPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900], // Deep background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.newspaper, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            Text(
              'Your Colorful Daily Read',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent.shade100), // Pink accent loader
            ),
          ],
        ),
      ),
    );
  }
}


// Stateful Widget to manage the list of articles and the loading state
class NewsListPage extends StatefulWidget {
  const NewsListPage({super.key});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  late Future<List<NewsArticle>> _articlesFuture;
  String _searchQuery = ''; // State for search query
  String _selectedCategory = 'All'; // State for category filter

  final NewsService _newsService = NewsService();

  @override
  void initState() {
    super.initState();
    _articlesFuture = _newsService.fetchTopHeadlines();
  }

  // Function to refresh the data
  Future<void> _refreshArticles() async {
    setState(() {
      _articlesFuture = _newsService.fetchTopHeadlines();
      // Keep existing filters to maintain user context
    });
  }

  // Method to apply filters based on current state
  List<NewsArticle> _filterArticles(List<NewsArticle> articles) {
    List<NewsArticle> filtered = articles;

    // 1. Filter by Category
    if (_selectedCategory != 'All') {
      filtered = filtered
          .where((article) => article.category == _selectedCategory)
          .toList();
    }

    // 2. Filter by Search Query
    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      filtered = filtered.where((article) {
        return article.title.toLowerCase().contains(query) ||
            article.description.toLowerCase().contains(query) ||
            article.source.toLowerCase().contains(query);
      }).toList();
    }

    return filtered;
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 8.0),
      child: TextField(
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Search articles by title or content...',
          prefixIcon: const Icon(Icons.search, color: Colors.indigo),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      _searchQuery = '';
                      FocusScope.of(context).unfocus(); // Dismiss keyboard
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(color: Colors.indigo, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(color: Colors.pinkAccent, width: 2.0),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _newsService.availableCategories.map((category) {
          final isSelected = _selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ActionChip(
              label: Text(category),
              labelStyle: TextStyle(
                // Use white text on selected chip for high contrast
                color: isSelected ? Colors.white : Colors.indigo[800],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              backgroundColor: isSelected ? Colors.pinkAccent : Colors.indigo[100], // Pink accent for selected
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: isSelected ? BorderSide.none : BorderSide(color: Colors.indigo.shade200),
              ),
              onPressed: () {
                setState(() {
                  _selectedCategory = category;
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global News Feed'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshArticles,
          ),
        ],
      ),
      body: Column( // Column to stack search/filter above the main list
        children: [
          _buildSearchBar(),
          _buildCategoryChips(),
          Expanded( // Expanded is crucial for the FutureBuilder's ListView
            child: RefreshIndicator(
              onRefresh: _refreshArticles,
              color: Colors.pinkAccent, // Colorful refresh indicator
              child: FutureBuilder<List<NewsArticle>>(
                future: _articlesFuture,
                builder: (context, snapshot) {
                  // State 1: Loading
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(color: Colors.indigo));
                  }

                  // State 2: Error
                  if (snapshot.hasError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
                            const SizedBox(height: 10),
                            Text('Error loading news: ${snapshot.error}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 20),
                            ElevatedButton.icon(
                              onPressed: _refreshArticles,
                              icon: const Icon(Icons.refresh),
                              label: const Text('Try Again'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo,
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  // State 3: Data Loaded Successfully (and is not null)
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    final articles = snapshot.data!;
                    final filteredArticles = _filterArticles(articles); // Apply filter here

                    if (filteredArticles.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.filter_list_off, size: 60, color: Colors.grey),
                              const SizedBox(height: 10),
                              Text(
                                'No articles found matching your criteria in "$_selectedCategory".',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: filteredArticles.length + 1, // +1 for the hero banner
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          // Hero Banner at the top
                          return HeroBanner(
                            title: 'Stay Connected with 24/7 Global Updates',
                            subtitle: 'Your curated feed is ready. Use the filters above to dive deeper!',
                            imageUrl: 'https://picsum.photos/id/405/1200/400', // Different image ID for Hero
                          );
                        }
                        final article = filteredArticles[index - 1]; // Adjust index for the banner
                        return NewsCard(article: article);
                      },
                    );
                  }

                  // State 4: Data is loaded but empty
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.feed_outlined, size: 60, color: Colors.grey),
                          SizedBox(height: 10),
                          Text(
                            'No news articles found at the moment.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for the Hero Banner
class HeroBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const HeroBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            // ignore: deprecated_member_use
            Colors.indigo.withOpacity(0.4), // Use indigo overlay for color theme
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.pinkAccent.shade100, // Light pink accent
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget to display a single news item - Enhanced
class NewsCard extends StatelessWidget {
  final NewsArticle article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Reading more about: ${article.title}'),
              backgroundColor: Colors.indigo,
            ),
          );
        },
        borderRadius: BorderRadius.circular(15), // Match card border radius
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image Section
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                article.imageUrl,
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 200.0,
                    color: Colors.indigo[100],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                        color: Colors.pinkAccent, // Pink accent loader
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200.0,
                  color: Colors.indigo[200],
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.broken_image, size: 50, color: Colors.indigo),
                        const SizedBox(height: 8),
                        Text(
                          'Image failed to load',
                          style: TextStyle(color: Colors.indigo[700]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    article.category,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.pinkAccent, // Category highlight in pink
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    article.description,
                    style: TextStyle(
                      fontSize: 14.5,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Source: ${article.source}',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.indigo[500],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.indigo),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
