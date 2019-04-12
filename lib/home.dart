import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Beranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> listImg = [
      "https://ecs7.tokopedia.net/img/blog/seller/2018/04/Bulan-Ramadhan-Tiba-seller-center-blog-banner.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXvjzLtcAfbWwJ0Gzb1avPfOn3qAhPmFglIKeOs_-cJkshKS1zSg",
      "https://img.orami.co.id/media/wysiwyg/Ramadhan-2017/header-banner/RAMADHAN-Mobile-Super-Big-Banner-_432x204_.jpg"
    ];

    return ListView(
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
              child: Image.network(
                  "https://ak7.picdn.net/shutterstock/videos/23010907/thumb/1.jpg",
                  fit: BoxFit.cover),
            ),
            Positioned(
              top: 100.0,
              left: 50.0,
              right: 50.0,
              child: Material(
                elevation: 10.0,
                child: Container(
                  height: 150.0,
                  color: Colors.amber,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        listImg[index],
                        fit: BoxFit.cover,
                      );
                    },
                    itemCount: listImg.length,
                    pagination: SwiperPagination(),
                    control: SwiperControl(),
                    autoplay: true,
                    autoplayDelay: 2000,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 70.0,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 10.0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient:
                      LinearGradient(colors: [Colors.orange, Colors.pink])),
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Search...",
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  contentPadding: EdgeInsets.all(15.0),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 10.0,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://i.ytimg.com/vi/r-dEedFgsJY/maxresdefault.jpg"),
                      fit: BoxFit.cover)),
              height: 200.0,
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 10.0,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://t4.ftcdn.net/jpg/02/54/15/07/240_F_254150742_IIR9K3zwKxSWfkJAVlH4XarvH1oTtpk1.jpg"),
                      fit: BoxFit.cover)),
              height: 200.0,
            ),
          ),
        )
      ],
    );
  }
}
