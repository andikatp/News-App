import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/model/news_response_model.dart';
import 'package:news_app/screens/news_detail_screen.dart';
import 'package:news_app/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/date_utils.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.articles, this.isLoading = false});
  final Articles articles;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return NewsDetailScreen(
              articles: articles,
            );
          },
        )),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              if (isLoading)
                Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.5),
                    highlightColor: Colors.grey.withOpacity(0.7),
                    child: Container(
                      height: 128,
                      color: Colors.black,
                    ))
              else
                Image.network(
                  articles.urlToImage ?? '',
                  height: 128,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                        height: 128,
                        width: double.infinity,
                        child: Text(error.toString()));
                  },
                ),
              if (!isLoading) const LinearGradientWidget(),
              Positioned.fill(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (isLoading)
                        const _ShimmerText(
                          width: double.infinity,
                        )
                      else
                        Text(
                          articles.title ?? 'Judul Tidak Ditemukan',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.dmSerifDisplay(
                            textStyle: KTextStyleNice.kFooter.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (isLoading)
                            const Expanded(child: _ShimmerText())
                          else
                            Text(
                              articles.author ?? 'Tidak Ada Penulis',
                              style: KTextStyleNice.kFooter.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          const Spacer(),
                          if (isLoading)
                            const Expanded(
                              child: _ShimmerText(),
                            )
                          else
                            Text(
                              formatDate(articles.publishedAt),
                              style: KTextStyleNice.kFooter,
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShimmerText extends StatelessWidget {
  const _ShimmerText({
    this.width = double.infinity,
  });
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.7),
      highlightColor: Colors.grey,
      child: Container(
        color: Colors.black,
        height: 18,
        width: width,
      ),
    );
  }
}
