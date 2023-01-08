import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/utils/custom_text_styles.dart';

import '../../common/shimmer_loader.dart';
import '../../utils/custom_dimensions.dart';
import '../../utils/utils.dart';

class NewsArticleListItem extends StatelessWidget {
  final Article data;
  const NewsArticleListItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(px_16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: data.urlToImage,
                  progressIndicatorBuilder: (context, url, downloadProgress) => ShimmerLoader(height: MediaQuery.of(context).size.height * 0.15,),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(height: px_20),
                Text(
                  data.source?.name ?? '',
                  style: subTitle2_14ptRegular(),
                ),
                const SizedBox(height: px_10),
                Text(
                  formatDateToString(data.publishedAt),
                  style: subTitle2_14ptRegular(),
                ),
              ],
            ),
          ),
          const SizedBox(width: px_16),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title,
                    style: subTitle1_16ptBold(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: px_20),
                Text(data.description,
                    style: subTitle1_16ptRegular(),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
