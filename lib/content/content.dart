class Chapter {
  final String id;
  final String short;
  final String title;
  final String explanation;
  final String promptExample;
  final String bestPractice;

  const Chapter({
    required this.id,
    required this.short,
    required this.title,
    required this.explanation,
    required this.promptExample,
    required this.bestPractice,
  });
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final String answer;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.answer,
  });
}

const List<Chapter> kChapters = [
  Chapter(
    id: 'bases',
    short: 'Bases',
    title: "Comment fonctionne une IA d'assistance",
    explanation:
        "Une IA comme OpenAI predit la suite de mots la plus probable selon ton message. Elle ne pense pas comme un humain, mais elle est tres performante pour resumer, expliquer, rediger et structurer des idees.",
    promptExample:
        "Explique moi simplement la difference entre machine learning et deep learning, avec un exemple concret pour un debutant.",
    bestPractice:
        "Donne toujours du contexte: ton niveau, l'objectif et le format attendu de la reponse.",
  ),
  Chapter(
    id: 'prompts',
    short: 'Prompts',
    title: 'Ecrire un bon prompt',
    explanation:
        "Un bon prompt est precis, structure et oriente resultat. Plus ta demande est claire, plus la reponse sera utile. Evite les demandes vagues.",
    promptExample:
        'Tu es un coach produit. Propose un plan de lancement en 7 etapes pour une application mobile education IA, avec delai et priorites.',
    bestPractice: "Utilise cette trame: Role + Objectif + Contraintes + Format de sortie.",
  ),
  Chapter(
    id: 'limites',
    short: 'Limites',
    title: "Limites et verification des reponses",
    explanation:
        "Une IA peut se tromper, inventer une source ou manquer de contexte. Il faut verifier les informations importantes, surtout en legal, sante ou finance.",
    promptExample:
        'Donne ta reponse en indiquant clairement ce qui est certain, ce qui est une hypothese, et ce qui doit etre verifie.',
    bestPractice: 'Pour les sujets critiques, demande des sources et fais une verification externe.',
  ),
  Chapter(
    id: 'ethique',
    short: 'Ethique',
    title: "Utilisation responsable de l'IA",
    explanation:
        "L'IA doit etre utilisee sans nuire: respect de la vie privee, pas de plagiat, pas de manipulation. Le but est d'augmenter l'humain, pas de contourner l'ethique.",
    promptExample:
        "Reformule ce texte avec un ton professionnel sans recopier mot pour mot et sans inclure de donnees personnelles.",
    bestPractice: 'Ne partage jamais de donnees sensibles dans tes prompts.',
  ),
  Chapter(
    id: 'apps',
    short: 'Apps',
    title: 'Apps dans ChatGPT',
    explanation:
        "Les Apps (anciennement connecteurs) permettent de connecter des outils externes et de retrouver des informations sans quitter ChatGPT. C'est utile pour centraliser les recherches et gagner du temps.",
    promptExample:
        "Aide moi a preparer un compte rendu projet en utilisant mes documents disponibles dans mes apps connectees.",
    bestPractice: "Connecte uniquement les apps necessaires et verifie les permissions accordees.",
  ),
  Chapter(
    id: 'projects',
    short: 'Projects',
    title: 'Projects dans ChatGPT',
    explanation:
        "Projects sert a organiser ton travail par dossier: contexte, fichiers, conversations et objectifs restent regroupes. C'est ideal pour suivre un produit, un memoire ou une campagne.",
    promptExample:
        "Dans ce project, cree une roadmap mobile IA sur 8 semaines avec jalons hebdomadaires et livrables.",
    bestPractice:
        "Un project = un objectif clair. Garde une structure simple: objectif, ressources, sorties attendues.",
  ),
  Chapter(
    id: 'history',
    short: 'Historique',
    title: 'Historique, recherche et memoire',
    explanation:
        "L'historique permet de retrouver tes anciens chats, et la recherche (Ctrl+K / Cmd+K) aide a retrouver vite un sujet. La memoire peut aussi personnaliser les reponses selon ce que tu choisis de conserver.",
    promptExample:
        "Resume les points cles de nos derniers echanges sur l'application mobile IA, avec les prochaines actions.",
    bestPractice:
        "Nettoie regulierement ton historique de travail sensible et ajuste les parametres de confidentialite.",
  ),
  Chapter(
    id: 'codex',
    short: 'Codex',
    title: 'Codex et assistance de dev',
    explanation:
        "Codex est une capacite d'assistance pour coder plus vite: generation de code, refactor, debug, explication de fichiers et automatisation de taches de dev.",
    promptExample:
        "Analyse ce composant React Native et propose un refactor clair avec gestion d'etat et tests a ajouter.",
    bestPractice:
        "Toujours relire le code genere, lancer les tests et verifier les impacts securite/performance.",
  ),
  Chapter(
    id: 'install-pc',
    short: 'Install PC',
    title: 'Installer ChatGPT sur PC (Windows, macOS, Linux)',
    explanation:
        'Windows: telecharger et installer l application desktop officielle ChatGPT.\nmacOS: telecharger et installer l application desktop officielle (selon prerequis de la machine).\nLinux: pas d application desktop officielle generalement diffusee; utiliser ChatGPT sur le web et eventuellement un raccourci PWA via navigateur.',
    promptExample:
        "Donne moi les etapes exactes pour installer ChatGPT sur mon OS et verifier que tout fonctionne apres connexion.",
    bestPractice:
        "Toujours telecharger depuis la page officielle OpenAI et verifier ton compte apres installation.",
  ),
  Chapter(
    id: 'gpt-vs-browser',
    short: 'GPT vs Web',
    title: "GPT n'est pas un navigateur internet",
    explanation:
        "Beaucoup de personnes utilisent GPT comme Google. Un navigateur web explore des pages internet en direct. GPT, lui, genere une reponse a partir de ton prompt et de ses capacites actives. Sans outil web active, il ne lit pas automatiquement internet en temps reel.",
    promptExample:
        "Reponds en separant: 1) ce que tu sais avec certitude 2) ce qui doit etre verifie en ligne 3) les sources que je dois consulter.",
    bestPractice:
        "Pour les infos recentes (prix, actus, lois, horaires), demande explicitement une verification web et des sources.",
  ),
  Chapter(
    id: 'api-vs-subscription',
    short: 'API vs Abo',
    title: 'Cle API et abonnement ChatGPT: quelle difference',
    explanation:
        "Un abonnement ChatGPT donne acces a l application ChatGPT (web/mobile/desktop) selon ton plan. Une cle API sert a connecter un modele OpenAI dans ta propre application. Ce sont deux usages et deux facturations distincts.\n\nLien abonnement: https://chatgpt.com/\nLien API: https://platform.openai.com/",
    promptExample:
        "Explique moi en tableau la difference entre abonnement ChatGPT et cle API, avec cas d usage et couts.",
    bestPractice:
        "Si tu construis une app, il faut une cle API (ou un backend). Si tu veux seulement utiliser ChatGPT, l abonnement suffit.",
  ),
];

const List<QuizQuestion> kQuizQuestions = [
  QuizQuestion(
    question: 'Quel element rend un prompt plus efficace ?',
    options: [
      'Etre le plus court possible',
      'Donner du contexte et un format attendu',
      'Utiliser des majuscules',
    ],
    answer: 'Donner du contexte et un format attendu',
  ),
  QuizQuestion(
    question: "Pourquoi faut-il verifier certaines reponses de l'IA ?",
    options: [
      "Parce qu'elle est toujours exacte",
      "Parce qu'elle peut faire des erreurs",
      "Parce qu'elle refuse de repondre",
    ],
    answer: "Parce qu'elle peut faire des erreurs",
  ),
  QuizQuestion(
    question: "Quelle est une bonne pratique de securite ?",
    options: [
      'Partager les mots de passe pour gagner du temps',
      'Eviter de mettre des donnees sensibles dans les prompts',
      'Demander une reponse sans contexte',
    ],
    answer: 'Eviter de mettre des donnees sensibles dans les prompts',
  ),
  QuizQuestion(
    question: "Lequel est le meilleur prompt pour debuter ?",
    options: [
      'Parle moi de tout',
      'Explique en 5 points simples avec exemple',
      'Fais comme tu veux',
    ],
    answer: 'Explique en 5 points simples avec exemple',
  ),
  QuizQuestion(
    question: 'A quoi sert principalement un Project dans ChatGPT ?',
    options: [
      "Changer la couleur de l'interface",
      'Organiser conversations, fichiers et contexte par objectif',
      'Supprimer automatiquement tous les chats',
    ],
    answer: 'Organiser conversations, fichiers et contexte par objectif',
  ),
  QuizQuestion(
    question: 'Quelle est la bonne pratique pour installer ChatGPT sur PC ?',
    options: [
      'Telecharger uniquement depuis des sites tiers',
      'Telecharger depuis la page officielle OpenAI',
      'Desactiver tous les controles de securite',
    ],
    answer: 'Telecharger depuis la page officielle OpenAI',
  ),
  QuizQuestion(
    question: 'Quelle phrase est correcte ?',
    options: [
      'GPT est toujours un navigateur internet en direct',
      "GPT peut aider a chercher, mais ce n'est pas automatiquement un navigateur web",
      'Abonnement ChatGPT et cle API sont identiques',
    ],
    answer: "GPT peut aider a chercher, mais ce n'est pas automatiquement un navigateur web",
  ),
];
