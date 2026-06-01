import 'package:flutter/material.dart';

void main() {
  runApp(const GroupFlutterPagesApp());
}

class GroupFlutterPagesApp extends StatelessWidget {
  const GroupFlutterPagesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '小组 Flutter Web 展示页',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const TeamHomePage(),
    );
  }
}

class TeamHomePage extends StatelessWidget {
  const TeamHomePage({super.key});

  static const String projectTitle = '移动应用开发小组作业展示';
  static const String projectSlogan = '用 Flutter 和 GitHub 协作完成我们的第一个 Web 项目';

  static const List<TeamMember> members = [
    TeamMember(role: '组长', name: '林书豪', task: '维护仓库、审核 PR、执行部署'),
    TeamMember(role: '组员 A', name: '徐超扬', task: '设计首页标题和项目口号'),
    TeamMember(role: '组员 B', name: '何赛', task: '整理成员介绍和任务分工'),
    TeamMember(role: '组员 C', name: '张洪滔', task: '整理项目功能列表'),
    TeamMember(role: '组员 D', name: '杨艳婷', task: '记录发布流程和访问地址'),
  ];

  static const List<String> features = [
    '展示小组项目主题与核心功能',
    '可视化呈现成员分工与贡献记录',
    '基于 Pull Request 的团队协作开发',
    'Flutter Web 编译产物托管于 GitHub Pages',
  ];

  static const List<String> releaseNotes = [
    '源码统一维护在 main 分支，所有组员修改都通过 PR 合并。',
    '组长使用 flutter build web 生成静态网页文件。',
    '构建产物发布到 gh-pages 分支，并由 GitHub Pages 对外访问。',
    '访问地址格式：https://SHLINOvO.github.io/group_flutter_pages_demo/',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('小组项目展示')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          HeroSection(),
          SizedBox(height: 20),
          MembersSection(),
          SizedBox(height: 20),
          FeaturesSection(),
          SizedBox(height: 20),
          ReleaseSection(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              TeamHomePage.projectTitle,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(TeamHomePage.projectSlogan, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class MembersSection extends StatelessWidget {
  const MembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('小组成员与分工', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ...TeamHomePage.members.map((member) => MemberCard(member: member)),
      ],
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({required this.member, super.key});

  final TeamMember member;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(member.role.characters.last)),
        title: Text('${member.role}：${member.name}'),
        subtitle: Text(member.task),
      ),
    );
  }
}

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('项目功能', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...TeamHomePage.features.map((feature) => Text('• $feature')),
          ],
        ),
      ),
    );
  }
}

class ReleaseSection extends StatelessWidget {
  const ReleaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('发布说明', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...TeamHomePage.releaseNotes.map((note) => Text('• $note')),
          ],
        ),
      ),
    );
  }
}

class TeamMember {
  const TeamMember({required this.role, required this.name, required this.task});

  final String role;
  final String name;
  final String task;
}
