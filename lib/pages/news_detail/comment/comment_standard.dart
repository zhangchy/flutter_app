import 'dart:core';
import 'package:flutter/material.dart';


/**
 * 评论标准
 */
class CommentStandard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('发表评论规范'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              Text(
                '请记住A9VG的永久域名www.a9vg.com，这是让你找回A9VG论坛的最快途经。',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(232, 17, 17, 1)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 25),),
              Text(
                '当您申请用户时，表示您已经同意遵守本规章。',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 25),),
              Text(
                '欢迎您加入本站点参加交流和讨论，本站点为公共论坛，为维护网上公共秩序和社会稳定，请您自觉遵守以下条款：',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 25),),
              Text(
                '一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息：',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Text(
                '（一）煽动抗拒、破坏宪法和法律、行政法规实施的； ',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Text(
                '（二）煽动颠覆国家政权，推翻社会主义制度的； ',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Text(
                '（三）煽动分裂国家、破坏国家统一的；',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Text(
                '（四）煽动民族仇恨、民族歧视，破坏民族团结的；',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Text(
                '（五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Text(
                '（六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的； ',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Text(
                '（七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Text(
                '（八）损害国家机关信誉的；',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Text(
                '（九）其他违反宪法和法律行政法规的；',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Text(
                '（十）进行商业广告行为的。',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 25),),
              Text(
                '二、互相尊重，对自己的言论和行为负责。',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 25),),
              Text(
                '三、禁止在申请用户时使用相关本站的词汇，或是带有侮辱、毁谤、造谣类的或是有其含义的各种语言进行注册用户，否则我们会将其删除。',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 25),),
              Text(
                '四、禁止以任何方式对本站进行各种破坏行为。',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 25),),
              Text(
                '五、如果您有违反国家相关法律法规的行为，本站概不负责，您的登录论坛信息均被记录无疑，必要时，我们会向相关的国家管理部门提供此类信息。 请记住A9VG的永久域名www.a9vg.com，这是让你找回a9vg论坛的最快途经。',
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 1.3,
                  color: Color.fromRGBO(38, 38, 38, 1)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 25),),
            ],
          ),
        )
      )
    );

  }
}
