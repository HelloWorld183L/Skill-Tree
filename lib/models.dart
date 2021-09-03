class PerkNode {
  late String name;
  late int levelRequirement;
  late List<PerkNode> children;
}

class SkillTree {
  late PerkNode headNode;
}

class Skill {
  late String name;
  late int level;
  late int skillCap;
  late SkillTree skillTree;
}

class Activity {
  late String name;
  late int xpGain;
  late String difficulty;
  late Skill skill;
}

enum Difficulty { Easy, Medium, Hard, Brainfuck }
