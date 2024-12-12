import 'package:flutter/material.dart';
import 'package:ai_detector/extension/exten.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../API/detect_api.dart';
import '../constant/const.dart';
import '../model/ai_res.dart';
import 'button.dart';
import 'faq_page.dart';
import 'feature_page.dart';


class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        title: const Text(
          'About Us',
          style: TextStyle(
            fontSize: 30,
            letterSpacing: 5,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What is an AI Content Detector?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'AI content detector is a tool that helps you identify content created by using Artificial Intelligence from a given text. Our AI content detector is trained with tremendous data from AI engines. It uses Natural Language Processing(NLP) technology to analyze the text. Publishers, as well as others like editors, marketing managers, and examiners, can use it to verify whether the content is original or not. ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const Text(
              'Why use an AI detector?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'People searched for AI content nine times more since February 2022, as AI tools became more accessible. However, the widespread use of AI content generation also raised many concerns. Thousands of tech leaders including Elon Musk and Steve Wozniak sent an open petition letter to stop AI experiments. Considering these risks, it is better to have tools that can identify AI content. Here are some reasons to choose an AI content detector.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '1. Verify the authenticity',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'AI-generated content often tends to be loaded with false information. Therefore, it is wise to verify the source and authenticity of the content before you trust it. Considering the early example, you can paste the article that claims shocking information to an AI detector. Share the information only if the tool confirms that it is human-generated content.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '2. Avoid plagiarism',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Keep in mind that even the most prominent AI tools are trained with data from search engines including blogs, academic papers, etc. from others. The chances of plagiarism in AI content are high. Times has even sued Open AI for generating New York Times articles verbatim without citing. ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '3. Ensure Quality',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'At least for now, AI-generated content is still lagging behind human-generated content in terms of creativity, largely due to the use of repetitive words and sentences. Most AI tools generate content in an over-polite manner with hedging sentences. Such a monotony tone affects the quality as well as user engagement.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '4. Protect SEO Ranking',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Even though search engines do not strictly prohibit content, most of them have a strict stance against poor and plagiarized content. A study by Marketing Insider Group found that humanized content generated more web traffic and ranked more keywords as compared to AI content. By using our GPT-content detector, you can ensure that your content is ready to compete in the SEO arena.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'How AI Content Detector Works?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Since the concept of an AI Detector is relatively new, you might be curious about how it works. Well, it\'s not that complex. In fact, our AI content detector works with the same technology as that of prominent AI content marketing tools. We trained it with the same GPT model as that of any other AI content tool. Then, it uses the Natural Language Processing(NLP) technology to understand your check and cross-check it with the trained data. It\'s as simple as that. The text need not be an exact copy to be identified. Apart from cross-verification with models, we consider 2 main things to detect AI content:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '1. Variation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'AI content comparatively has a lower variation in sentence structure and length. That means, if the first sentence is between 10-20 words, it is likely to maintain that length throughout the text. On top of that, it has a tendency to use excessive connector words like \'and\', \'or\', etc. This makes it easy for our tool to catch the monotonous AI-generated sentences.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '2. Predictability',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Predictability means it\'s how easy it is to predict the next words after analyzing the first words of a sentence. AI models usually focus on generating text that is smooth to read. But, that\'s not the case with humans. Human texts are more creative and therefore, have lower predictability.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'AI VS Human Content: Which is better for SEO?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Well, you might have mastered the art of AI content writing. But, here\'s a question for you: does Google even consider your AI content? The truth is that Google does not have an announced policy for treating AI content. However, there are some points to consider:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'First of all, you must know how Google ranks content. The search engine aims to promote content with Expertise, Experience, Authoritativeness, and Trustability (EEAT). That means the focus is on quality rather than the source. However, AI tools are reported to provide fake or generic content that may risk your SEO efforts.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Google does have a stance against AI-generated text without any value and EEAT. Such content might be removed from the search results.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'As said earlier, there are several instances when even prominent AI models are caught red-handed for providing verbatim sentences from various sources. Google does have a strict policy against plagiarism, and it punishes such content.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Imagine this. You have typed in a prompt to generate a blog on 5 Tips for SEO and posted it. Somehow you managed to rank it. But, is that the end? Several marketers will enter the same prompt. Even if we assume that it will not generate the same text, the essence will remain the same, right? Eventually, your blog will have to compete with thousands of blogs with the same content(not words). Therefore, no matter how hard you optimize an AI content, its ranking is temporary.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'How to Use the AI Content Detector Tool?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'You need not type in endless prompts and wait for the results. The process of AI content detection is quite simple and straightforward. Let\'s break it down:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '1. Paste the text',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Copy the content which you want to check and paste it into our AI content detector. The text must be less than 4,000 words for a single check. The rest of the content can be checked in the next run. Alternatively, you can also enter the URL of the content or upload it as a file. Our tool will automatically extract text from it.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '2. Hit the Button',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'You don\'t need to type any prompt. Upon pasting the text, just click the \'Detect\' button. Our tool will analyze the text and cross-check it with the models to come up with a result.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '3. View the results',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'The Free AI content detector tool will generate the result report within a split second. It lets you know how much percentage of the content is likely to be AI-generated. You can even see the portions of the text that are generated through AI. Portions that are highlighted with green may be written by a human. Yellow shows that the text is likely to be generated by AI while red shows that there are high chances that it is AI-generated text.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '4. Take actions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Take precautionary measures to avoid the consequences of AI content. You can verify the sources of portions flagged as AI-generated and if needed, remove it from the content.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Are AI content detectors reliable?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'The best AI tools like Bard, Chat GPT, and Bing unanimously state that they may make some mistakes and are constantly improving to avoid them. The same is the case with AI content detectors. As of now, no AI content detector tool claims 100% accuracy. Both these technologies are currently in an experimental phase and require updates for more reliability.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'However, our AI content detector tool has taken reasonable measures to avoid any false alarms. It is trained with advanced AI language models, and patterns for the most accuracy. And that\'s not the end. We will be constantly updating it with the latest data and changes to improve the accuracy.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'How to avoid AI detection?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'It\'s quite annoying when your content gets flagged as AI-generated even though you may not even have an account in the AI tool. Sadly it happens. So, how could you avoid such a situation? Check out some tips to avoid AI content detection:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '1. Refine the Sentence structure',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'All AI detector tools may not be trained with machine learning models. Many of them just look for patterns like complex sentences and perfect grammar, to detect AI content, as of now. So, you rework the sentence structure to avoid AI content detection. It\'s a good idea to split complex sentences into two.   ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '2. Rephrase the words',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'AI models often generate some overused words in their texts. Including such words may raise false alarms among the detectors. Some common examples of such words are: \'enhanced\', \'tapestry\', \'nestled\', \'excitingly\', \'groundbreaking\', etc. Consider using synonyms for such repetitive words to avoid AI detection.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '3. Personalization',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'The best way to avoid AI content detection is to add a bit of personalization to the content. For instance, adding your personal experience to the content not only makes it special but also creates a positive impression on the Google algorithm. And you know what? Readers always prefer to trust people with relevant experience.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '4. Improve connectivity',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Consider making your content more interactive to avoid AI detection. Try to ask questions to your readers. Use the language you speak. Viewers always prefer content that connects and interacts with them.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '5. Instill Creativity',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'As of now, AI models are not even an opponent to human creativity. The best way to make your content stand out from AI-generated texts is to instill creativity in it. Present a unique perspective on a topic that no one has even thought of. People always tend to read something fresh and unique. ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'AI Content Detector VS Plagiarism Detector',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'In the content marketing field, many often confuse these terms. And, some even use just one for the verification process. So, let\'s get it right. AI Content detectors are tools that identify text generated using Artificial Intelligence technology. Detector tools use language models and NLP for that. They also look specifically for some patterns like overused words, uniform sentence structure, etc. ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Plagiarism detectors are used to check whether the content is copied from another source. They do this by cross-checking the text with vast data of web pages, articles, research papers, blogs, etc. available on the internet. Plagiarism detectors don\'t look for any specific patterns and flag red only if they find the exact match.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Why Use Our AI Detector?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'The post-GPT era has witnessed the emergence of many AI detectors. So, out of that, why should you pick our tool itself? Sounds like a fair question. Well, here are some reasons why our GPT detector stands out from others in the market:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Unlimited Free Checks',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'No subscriptions. No restrictions. Use the AI content detector tool as much as you want, for free.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'No Sign-ups',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'You don\'t need to sign up for an account or enter the credit card details. Just paste the content and catch the AI text directly. Quite simple, isn\'t it?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'High Accuracy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'What makes our AI detector tool unique is that it doesn\'t just pick AI content randomly. It looks out for human content as it\'s trained with tremendous human-written data such as research papers, blogs, e-books, articles, etc. That means minimum false positives and maximum accuracy.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Guaranteed Privacy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Our AI detector tool doesn\'t store or share your data with third parties. Once the results are generated, your input data is completely destroyed. Since no sign-ups are required, you don\'t even have to share any personal information, too.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Trusted Partner',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'We are trusted by many students, professionals, researchers, and so on. Apart from other tools that end by just providing a percentage, we take a step further by highlighting the AI text in a passage specifically. This way, you can focus on changing that part only instead of dumping an entire content.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Latest Data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Our AI content detector is powered by the latest language models and data. We constantly update the tool to keep up with the latest developments in AI content generation. This way, you can detect content generated from new AI models, too.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
