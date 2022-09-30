import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/model/news_response_model.dart';
import 'package:news_app/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.articles, this.isLoading = false});
  final Articles articles;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            if (isLoading)
              Shimmer.fromColors(
                  child: Container(
                    height: 128,
                    color: Colors.black,
                  ),
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.grey.withOpacity(0.7))
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
            if (!isLoading) LinearGradientWidget(),
            Positioned.fill(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (isLoading)
                      _ShimmerText(
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
                          Expanded(child: _ShimmerText())
                        else
                          Text(
                            articles.author ?? 'Tidak Ada Penulis',
                            style: GoogleFonts.nunito(
                                textStyle: KTextStyleNice.kFooter.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w600)),
                          ),
                        Spacer(),
                        if (isLoading)
                          Expanded(
                            child: _ShimmerText(),
                          )
                        else
                          Text(
                            formatDate(),
                            style: GoogleFonts.nunito(
                                textStyle: KTextStyleNice.kFooter.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w600)),
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
    );
  }

  String formatDate() {
    var time = 'Kosong';
    // 2022-04-21T11:37:19Z
    try {
      final date =
          DateFormat("yyyy-MM-ddThh:mm:ssZ").parse(articles.publishedAt ?? '');
      final String dateString = DateFormat("dd MMMM yyyy").format(date);
      time = dateString;
    } catch (e) {}
    return time;
  }
}

class _ShimmerText extends StatelessWidget {
  const _ShimmerText({
    super.key,
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
