import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/color_constant.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/constants/gradient_container.dart';
import 'package:news_app/model/news_response_model.dart';
import 'package:news_app/utils/date_utils.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({required this.articles, super.key});

  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: KGradientContainer.kGradientButtonContainer
            .copyWith(shape: BoxShape.circle),
        child: const Icon(
          Icons.heart_broken,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.network(
              articles.urlToImage ?? '',
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Text(error.toString()),
                );
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          width: 32.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200.withOpacity(0.5)),
                          child: const Center(
                            child: Icon(
                              Icons.chevron_left,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 212,
                ),
                Stack(
                  children: [
                    Positioned.fill(
                      child: Column(children: [
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0, color: Colors.white),
                            color: Colors.white,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(24),
                            ),
                          ),
                          height: 88,
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 26),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                                width: 311.0,
                                height: 141.0,
                                decoration: BoxDecoration(
                                    color:
                                        Colors.grey.shade200.withOpacity(0.5)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        formatDate(articles.publishedAt),
                                        style: KTextStyleNice.kFooter.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: ColorConstant.rebel,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        articles.title ?? 'No Title',
                                        style: GoogleFonts.dmSerifDisplay(
                                          letterSpacing: 1,
                                          color: ColorConstant.rebel,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Published by ${articles.author ?? 'No Author'}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: const TextStyle(
                                          color: ColorConstant.rebel,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    dummyText,
                    style: const TextStyle(color: ColorConstant.rebel),
                  ),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

String dummyText =
    """LONDON — Cryptocurrencies “have no intrinsic value” and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.
      
      Digital currencies like bitcoin, ether and even dogecoin have been on a tear this year, reminding some investors of the 2017 crypto bubble in which bitcoin blasted toward \$20,000, only to sink as low as \$3,122 a year later.
      
      Asked at a press conference Thursday about the rising value of cryptocurrencies, Bailey said: “They have no intrinsic value. That doesn’t mean to say people don’t put value on them, because they can have extrinsic value. But they have no intrinsic value.”
      
      “I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”
      
      Bailey’s comments echoed a similar warning from the U.K.’s Financial Conduct Authority.
      
      “Investing in cryptoassets, or investments and lending linked to them, generally involves taking very high risks with investors’ money,” the financial services watchdog said in January.
      
      “If consumers invest in these types of product, they should be prepared to lose all their money.”
      
      Bailey, who was formerly the chief executive of the FCA, has long been a skeptic of crypto. In 2017, he warned: “If you want to invest in bitcoin, be prepared to lose all your money.”""";
