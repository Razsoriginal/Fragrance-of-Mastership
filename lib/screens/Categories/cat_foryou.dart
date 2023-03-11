import 'package:flutter/material.dart';
import 'package:fragrance/widgets/hadith_card.dart';

class cat_foryou extends StatelessWidget {
  const cat_foryou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 5,),
          hadith_card(title: "The importance of learning traditions of the Ahle Bait(a.s.)",
              hadith_by: "Imam Reza (a.s.)",
              arabic: "عَنِ الْهَرَوِيِّ قَالَ سَمِعْتُ أَبَا الْحَسَنِ عَلِيَّ بْنَ مُوسَى الرِّضَا ع يَقُولُ رَحِمَ اللَّهُ عَبْداً أَحْيَا أَمْرَنَا فَقُلْتُ لَهُ وَ كَيْفَ يُحْيِي أَمْرَكُمْ قَالَ يَتَعَلَّمُ عُلُومَنَا وَ يُعَلِّمُهَا النَّاسَ فَإِنَّ النَّاسَ لَوْ عَلِمُوا مَحَاسِنَ كَلَامِنَا لَاتَّبَعُونَا.",
              eng: "“He learns our knowledge (traditions) and teaches it to the people. Surely, if people knew the beauty of our words, they would certainly follow us.”",
              urdu: "ہمارے علوم (احادیث) سیکھ کر اور لوگوں کو ان کی تعلیم دے کر۔ یقیناً اگر لوگ ہمارے کلام کی خوبصورتی کو جان جاتے تو ضرور بالضرور ہماری اتباع و پیروی کرتے۔",
              istranslation: 3,
              descp: "Abd al-Salaam Ibn Saaleh al-Harawiyy said: I heard Imam Reza (a.s.) say, “May Allah have mercy on the person who enlivens our affair (i.e. Wilayat)!” I asked, “How is your affair enlivened?” He (a.s.) informed,",
              refeng: ["Oyoon al-Akhbaar al-Reza (a.s.), vol. 1, p. 307, H. 69", "Maani al-Akhbaar, p. 180, H. 1", "Wasaael al-Shiahh, vol. 27, p. 92, H. 33297", "Behaar al-Anwaar, vol. 2, p. 30, H. 13"],
              refurdu: ["عیون اخبار الرضا، ج:۱، ص:۳۰۷، ح:۶۹", "معانی الاخبار، ص:۱۸۰، ح:۱", "وسائل الشیعہ، ج :۲۷، ص:۹۲، ح:۳۳۲۹۷", "بحار الانوار، ج:۲، ص:۳۰، ح:۱۳"],
              mins: "5"),

          hadith_card(title: "True knowledge can be obtained only from the Ahle Bait(a.s.)",
              hadith_by: "Imam Abu Ja’far (al-Baqer) (a.s.)",
              arabic: ".قَالَ أَبُو جَعْفَرٍ ع لِسَلَمَةَ بْنِ كُهَيْلٍ وَ الْحَكَمِ بْنِ عُتَيْبَةَ شَرِّقَا وَ غَرِّبَا فَلَا تَجِدَانِ عِلْماً صَحِيحاً إِلَّا شَيْئاً خَرَجَ مِنْ عِنْدِنَا أَهْلَ الْبَيْتِ",
              eng: "“Both of you go East or West, you will not find true knowledge except that which has emanated from us Ahle Bait (a.s.).”",
              urdu: "‘‘تم دونوں چاہے مشرق کی طرف چلے جاؤ یا مغرب کی طرف ، تم صحیح علم نہیں پاسکو گے، سوائےاس کے کہ جو (علم) ہم اہل بیت علیہم السلام سے آیا ہو۔’’",
              istranslation: 3,
              descp: "Imam Abu Ja’far (al-Baqer) (a.s.) said to Salamah Ibn Kuhail and al-Hakam Ibn Otaibah (two well-known Batris),",
              refeng: ["Al-Kaafi, vol. 1, p. 399, H. 3", "Wasaael al-Shiah, vol. 21, p. 477, H. 27632", "Mir’aat al-Oqool, vol. 4, p. 309, H. 3"],
              refurdu: ["عیون اخبار الرضا،ج:۱ ،ص: ۳۰۷ ،ح :۶۹", "معانی الاخبار، ص :۱۸۰، ح: ۱", "وسائل الشیعہ ،ج :۲۷ ، :۹۲ :ح :۳۳۲۹۷", "بحار الانوار ،ج :۲ :ص :۳۰ ،ح: ۱۳"],
              mins: "3"),

          hadith_card(title: "Is guidance possible except from those in whose houses the Revelation has descended",
              hadith_by: "Imam Ja’far Ibn Muhammad (a.s.)",
              arabic: ".سَمِعْتُ جَعْفَرَ بْنَ مُحَمَّدٍ ع يَقُولُ وَ عِنْدَهُ أُنَاسٌ مِنْ أَهْلِ الْكُوفَةِ- عَجَباً لِلنَّاسِ أَنَّهُمْ أَخَذُوا عِلْمَهُمْ كُلَّهُ عَنْ رَسُولِ اللَّهِ ص فَعَمِلُوا بِهِ وَ اهْتَدَوْا وَ يَرَوْنَ أَنَّ أَهْلَ بَيْتِهِ لَمْ يَأْخُذُوا عِلْمَهُ وَ نَحْنُ أَهْلُ بَيْتِهِ وَ ذُرِّيَّتُهُ فِي مَنَازِلِنَا نَزَلَ الْوَحْيُ وَ مِنْ عِنْدِنَا خَرَجَ الْعِلْمُ إِلَيْهِمْ أَ فَيَرَوْنَ أَنَّهُمْ عَلِمُوا وَ اهْتَدَوْا وَ جَهِلْنَا نَحْنُ وَ ضَلَلْنَا إِنَّ هَذَا لَمُحَال",
              eng: "“I am amazed at the people that they think they have taken all the knowledge from the Messenger of Allah (s.a.w.a.), act upon it and are guided. They also think that we have Ahle Bait (a.s.) have not taken his (s.a.w.a.) knowledge while we are his family members and his progeny. In our houses revelation descended and from us emanated the knowledge to them (i.e. the people). Yet they think they know and they are guided while we are unaware and deviated?!! Surely, this is impossible!!”",
              urdu: "‘‘مجھے لوگوں پر تعجب ہوتا ہے کہ وہ گمان کرتے ہیں کہ ان لوگوں نے رسول اللہ صلی اللہ علیہ و آلہ و سلم سے تمام علم سیکھ لیا اور اس پر عمل کیا اور ہدایت یافتہ ہوگئے۔ اور وہ یہ بھی گمان کرتے ہیں کہ ہم اہل بیت علیہم السلام نے آپ صلی اللہ علیہ و آلہ و سلم سے علم حاصل نہیں کیا جبکہ ہم ان کے اہل بیت علیہم السلام ہیں اور ان کی ذریت ہیں۔ ہمارے گھروں میں وحی کا نزول ہوا اور ہمارے ذریعہ علم لوگوں تک پہونچا۔ پس کیا وہ لوگ یہ گمان کرتے ہیں کہ وہ جانتے ہیں اور ہدایت یافتہ ہیں اور ہم جاہل ہیں اور گمراہ ہیں۔ یقیناً یہ بات بہت ہی محال ہے۔’’",
              istranslation: 3,
              descp: "Narrator says, “I heard (Imam) Ja’far Ibn Muhammad (a.s.) say while there were some people of Kufah (Iraq) with him,",
              refeng: ["Al-Kaafi, vol. 1, p. 399, H. 3", "Wasaael al-Shiah, vol. 21, p. 477, H. 27632", "Mir’aat al-Oqool, vol. 4, p. 309, H. 3"],
              refurdu: ["الکافی ج ۱ ص ۳۹۹ ح ۳", "وسائل الشیعہ ج ۲۱ ص ۴۷۷ ح ۲۷۶۳۲", "مرآۃ العقول ج ۴ ص ۳۰۹ ح ۳"],
              mins: "7"),

          hadith_card(title: "The importance of learning traditions of the Ahle Bait(a.s.)",
              hadith_by: "Imam Reza (a.s.)",
              arabic: "عَنِ الْهَرَوِيِّ قَالَ سَمِعْتُ أَبَا الْحَسَنِ عَلِيَّ بْنَ مُوسَى الرِّضَا ع يَقُولُ رَحِمَ اللَّهُ عَبْداً أَحْيَا أَمْرَنَا فَقُلْتُ لَهُ وَ كَيْفَ يُحْيِي أَمْرَكُمْ قَالَ يَتَعَلَّمُ عُلُومَنَا وَ يُعَلِّمُهَا النَّاسَ فَإِنَّ النَّاسَ لَوْ عَلِمُوا مَحَاسِنَ كَلَامِنَا لَاتَّبَعُونَا",
              eng: "“He learns our knowledge (traditions) and teaches it to the people. Surely, if people knew the beauty of our words, they would certainly follow us.”",
              urdu: "‘‘ہمارے علوم (احادیث) سیکھ کر اور لوگوں کو ان کی تعلیم دے کر۔ یقیناً اگر لوگ ہمارے کلام کی خوبصورتی کو جان جاتے تو ضرور بالضرور ہماری اتباع و پیروی کرتے۔ ’’",
              istranslation: 3,
              descp: "Abd al-Salaam Ibn Saaleh al-Harawiyy said: I heard Imam Reza (a.s.) say, “May Allah have mercy on the person who enlivens our affair (i.e. Wilayat)!” I asked, “How is your affair enlivened?” He (a.s.) informed,",
              refeng: ["Oyoon al-Akhbaar al-Reza (a.s.), vol. 1, p. 307, H. 69", "Maani al-Akhbaar, p. 180, H. 1", "Wasaael al-Shiahh, vol. 27, p. 92, H. 33297", "Behaar al-Anwaar, vol. 2, p. 30, H. 13"],
              refurdu: ["عیون اخبار الرضا،ج:۱ ،ص: ۳۰۷ ،ح :۶۹", "معانی الاخبار، ص :۱۸۰، ح: ۱", "وسائل الشیعہ ،ج :۲۷ ، :۹۲ :ح :۳۳۲۹۷", "بحار الانوار ،ج :۲ :ص :۳۰ ،ح: ۱۳"],
              mins: "5"),

          hadith_card(title: "True knowledge can be obtained only from the Ahle Bait(a.s.)",
              hadith_by: "Imam Abu Ja’far (al-Baqer) (a.s.)",
              arabic: ".قَالَ أَبُو جَعْفَرٍ ع لِسَلَمَةَ بْنِ كُهَيْلٍ وَ الْحَكَمِ بْنِ عُتَيْبَةَ شَرِّقَا وَ غَرِّبَا فَلَا تَجِدَانِ عِلْماً صَحِيحاً إِلَّا شَيْئاً خَرَجَ مِنْ عِنْدِنَا أَهْلَ الْبَيْتِ",
              eng: "“Both of you go East or West, you will not find true knowledge except that which has emanated from us Ahle Bait (a.s.).”",
              urdu: "‘‘تم دونوں چاہے مشرق کی طرف چلے جاؤ یا مغرب کی طرف ، تم صحیح علم نہیں پاسکو گے، سوائےاس کے کہ جو (علم) ہم اہل بیت علیہم السلام سے آیا ہو۔’’",
              istranslation: 3,
              descp: "Imam Abu Ja’far (al-Baqer) (a.s.) said to Salamah Ibn Kuhail and al-Hakam Ibn Otaibah (two well-known Batris),",
              refeng: ["Al-Kaafi, vol. 1, p. 399, H. 3", "Wasaael al-Shiah, vol. 21, p. 477, H. 27632", "Mir’aat al-Oqool, vol. 4, p. 309, H. 3"],
              refurdu: ["عیون اخبار الرضا،ج:۱ ،ص: ۳۰۷ ،ح :۶۹", "معانی الاخبار، ص :۱۸۰، ح: ۱", "وسائل الشیعہ ،ج :۲۷ ، :۹۲ :ح :۳۳۲۹۷", "بحار الانوار ،ج :۲ :ص :۳۰ ،ح: ۱۳"],
              mins: "3"),

          hadith_card(title: "Is guidance possible except from those in whose houses the Revelation has descended",
              hadith_by: "Imam Ja’far Ibn Muhammad (a.s.)",
              arabic: ".سَمِعْتُ جَعْفَرَ بْنَ مُحَمَّدٍ ع يَقُولُ وَ عِنْدَهُ أُنَاسٌ مِنْ أَهْلِ الْكُوفَةِ- عَجَباً لِلنَّاسِ أَنَّهُمْ أَخَذُوا عِلْمَهُمْ كُلَّهُ عَنْ رَسُولِ اللَّهِ ص فَعَمِلُوا بِهِ وَ اهْتَدَوْا وَ يَرَوْنَ أَنَّ أَهْلَ بَيْتِهِ لَمْ يَأْخُذُوا عِلْمَهُ وَ نَحْنُ أَهْلُ بَيْتِهِ وَ ذُرِّيَّتُهُ فِي مَنَازِلِنَا نَزَلَ الْوَحْيُ وَ مِنْ عِنْدِنَا خَرَجَ الْعِلْمُ إِلَيْهِمْ أَ فَيَرَوْنَ أَنَّهُمْ عَلِمُوا وَ اهْتَدَوْا وَ جَهِلْنَا نَحْنُ وَ ضَلَلْنَا إِنَّ هَذَا لَمُحَال",
              eng: "“I am amazed at the people that they think they have taken all the knowledge from the Messenger of Allah (s.a.w.a.), act upon it and are guided. They also think that we have Ahle Bait (a.s.) have not taken his (s.a.w.a.) knowledge while we are his family members and his progeny. In our houses revelation descended and from us emanated the knowledge to them (i.e. the people). Yet they think they know and they are guided while we are unaware and deviated?!! Surely, this is impossible!!”",
              urdu: "‘‘مجھے لوگوں پر تعجب ہوتا ہے کہ وہ گمان کرتے ہیں کہ ان لوگوں نے رسول اللہ صلی اللہ علیہ و آلہ و سلم سے تمام علم سیکھ لیا اور اس پر عمل کیا اور ہدایت یافتہ ہوگئے۔ اور وہ یہ بھی گمان کرتے ہیں کہ ہم اہل بیت علیہم السلام نے آپ صلی اللہ علیہ و آلہ و سلم سے علم حاصل نہیں کیا جبکہ ہم ان کے اہل بیت علیہم السلام ہیں اور ان کی ذریت ہیں۔ ہمارے گھروں میں وحی کا نزول ہوا اور ہمارے ذریعہ علم لوگوں تک پہونچا۔ پس کیا وہ لوگ یہ گمان کرتے ہیں کہ وہ جانتے ہیں اور ہدایت یافتہ ہیں اور ہم جاہل ہیں اور گمراہ ہیں۔ یقیناً یہ بات بہت ہی محال ہے۔’’",
              istranslation: 3,
              descp: "Narrator says, “I heard (Imam) Ja’far Ibn Muhammad (a.s.) say while there were some people of Kufah (Iraq) with him,",
              refeng: ["Al-Kaafi, vol. 1, p. 399, H. 3", "Wasaael al-Shiah, vol. 21, p. 477, H. 27632", "Mir’aat al-Oqool, vol. 4, p. 309, H. 3"],
              refurdu: ["الکافی ج ۱ ص ۳۹۹ ح ۳", "وسائل الشیعہ ج ۲۱ ص ۴۷۷ ح ۲۷۶۳۲", "مرآۃ العقول ج ۴ ص ۳۰۹ ح ۳"],
              mins: "7"),
        ],
      ),
    );
  }
}
