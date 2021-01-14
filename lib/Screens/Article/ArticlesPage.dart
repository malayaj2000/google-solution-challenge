import 'package:flutter/material.dart';
import '../../Helper/Widgets/RequiredWidgets.dart';
import '../../Helper/widgets/ArticlesTab.dart';

class BlogPost extends StatefulWidget {
  @override
  _BlogPostState createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  String _launchUrl1 = "https://www.indiatoday.in/india-today-insight/story/how-corruption-in-building-a-crematorium-claimed-25-lives-in-uttar-pradesh-1758102-2021-01-11";
  String _launchUrl2 = "https://www.thehindu.com/news/national/pil-in-supreme-court-to-establish-special-anti-corruption-courts-in-every-district/article33382695.ece";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context, "Blogs"),
        backgroundColor: Colors.orange,
      ),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20,),
            BlogTab(
              img: "images/supremecourt.jpg",
              title: "PIL in Supreme Court to establish Special Anti-Corruption Courts in every district",
              desc: "A PIL seeking to establish special anti-corruption courts in every district to decide cases related to various economic offences like money-laundering and tax evasion within one year has been filed in the Supreme Court.The PIL filed by BJP leader and advocate Ashwini Kumar Upadhyay has also sought directions to high courts to take appropriate steps to decide cases related economic offences...",
              postUrl: _launchUrl2,),
            SizedBox(height: 20,),
            BlogTab(
              img: "images/yogi.jpg",
              title: "How corruption in building a crematorium claimed 25 lives in Uttar Pradesh ",
              desc: "It was perhaps one of the most bizarre and tragic accidents in recent years. The roof of a new crematorium in Muradnagar, about 15 km from the district headquarters of Ghaziabad in Uttar Pradesh, collapsed on January 3, killing 25 members of a funeral procession and leaving 19 people injured.The incident occurred while some 50 mourners were standing in the 70-ft-long corridor of the crematorium....",
              postUrl: _launchUrl1,),
            SizedBox(height: 20,),
            BlogTab(
              img: "images/samsung.jpg",
              title: "Samsung vice chairman Jay Y. Lee faces nine-year sentence in bribery case",
              desc: "South Korean prosecutors requested a nine-year prison term for Samsung Electronics Co.’s Jay Y. Lee, seeking to put the heir apparent back in jail in a bribery case that rocked the nation and ignited a backlash against its most powerful conglomerates.Special prosecutors proposed the sentence during a Wednesday hearing at the Seoul High Court, which will make its ruling on the....",),
            SizedBox(height: 20,),
            BlogTab(
                img: "images/saipem.jpg",
                title: "Italy top court throws out prosecutor appeal against Saipem in Algeria graft case ",
                desc: "Italy’s top court has turned down an appeal by prosecutors to overturn an earlier ruling acquitting Saipem of corruption in a long-running trial over bribery allegations in Algeria, the energy services group said on Monday.In January an appeals court had dismissed the graft case against Saipem and lifted an asset seizure order to the tune of around 197 million euros....",),
            SizedBox(height: 20,),
            BlogTab(
                img: "images/rio.jpg",
                title: " Rio mayor arrested over alleged bribery scheme",
                desc: "Rio de Janeiro Mayor Marcelo Crivella was arrested on Tuesday, nine days before the end of his term, for alleged involvement in a corruption scheme at city hall, police and prosecutors said Crivella, who was arrested at home on the western side of Rio, denied any wrongdoing and said he was the target of political persecution.The mayor's arrest comes after a wave....",),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
