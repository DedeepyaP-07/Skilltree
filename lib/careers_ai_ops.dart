import 'package:flutter/material.dart';

import '../models.dart';
import 'helpers.dart';

// ===================== Data Scientist =====================
Career dataScientistCareer() => Career(
      id: 'data-scientist',
      title: 'Data Scientist',
      tagline: 'Turn raw data into insight with Python, statistics and machine learning.',
      icon: Icons.analytics,
      color: const Color(0xFF6A1B9A),
      stages: makeStages([
        ['Foundations', 'Python and the math behind data'],
        ['Data skills', 'SQL, pandas, charts and cleaning'],
        ['Machine learning', 'Models and how to judge them'],
        ['Deploy and communicate', 'Share results people can use'],
        ['Career', 'Projects and interviews'],
      ]),
      nodes: [
        skill('ds-python', 'Python', 'Syntax, functions, files and notebooks.', Icons.code, 0, null, [
          crs('Python', 'Kaggle Learn', '5 hours', 'https://www.kaggle.com/learn/python'),
          crs('CS50 Python', 'Harvard', '10 weeks', 'https://cs50.harvard.edu/python'),
          crs('Automate the Boring Stuff', 'Al Sweigart', '20 hours', 'https://automatetheboringstuff.com'),
        ]),
        skill('ds-math', 'Math and statistics', 'Probability, distributions, hypothesis tests and linear algebra.', Icons.functions, 0, 'ds-python', [
          crs('Statistics and Probability', 'Khan Academy', '30 hours', 'https://www.khanacademy.org/math/statistics-probability'),
          crs('StatQuest', 'YouTube', '20 hours', 'https://www.youtube.com/@statquest'),
          crs('Essence of Linear Algebra', '3Blue1Brown', '3 hours', 'https://www.3blue1brown.com/topics/linear-algebra'),
        ]),
        skill('ds-sql', 'SQL', 'Query, join and aggregate data in databases.', Icons.storage, 1, 'ds-python', [
          crs('SQLBolt', 'sqlbolt.com', '4 hours', 'https://sqlbolt.com'),
          crs('Intro to SQL', 'Kaggle Learn', '3 hours', 'https://www.kaggle.com/learn/intro-to-sql'),
          crs('SQL Tutorial', 'Mode', '6 hours', 'https://mode.com/sql-tutorial'),
        ]),
        skill('ds-pandas', 'NumPy and pandas', 'Load, reshape and analyze tabular data.', Icons.table_chart, 1, 'ds-python', [
          crs('Pandas', 'Kaggle Learn', '4 hours', 'https://www.kaggle.com/learn/pandas'),
          crs('pandas Getting Started', 'pandas.pydata.org', '4 hours', 'https://pandas.pydata.org/docs/getting_started/index.html'),
          crs('NumPy Quickstart', 'numpy.org', '2 hours', 'https://numpy.org/doc/stable/user/quickstart.html'),
        ]),
        skill('ds-viz', 'Data visualization', 'Charts that explain data with Matplotlib and Seaborn.', Icons.bar_chart, 1, 'ds-pandas', [
          crs('Data Visualization', 'Kaggle Learn', '4 hours', 'https://www.kaggle.com/learn/data-visualization'),
          crs('Matplotlib Tutorials', 'matplotlib.org', '4 hours', 'https://matplotlib.org/stable/tutorials/index.html'),
          crs('Seaborn Tutorial', 'seaborn.pydata.org', '3 hours', 'https://seaborn.pydata.org/tutorial.html'),
        ]),
        skill('ds-eda', 'Cleaning and exploration', 'Handle missing values, outliers and engineer features.', Icons.cleaning_services, 1, 'ds-pandas', [
          crs('Data Cleaning', 'Kaggle Learn', '4 hours', 'https://www.kaggle.com/learn/data-cleaning'),
          crs('Feature Engineering', 'Kaggle Learn', '5 hours', 'https://www.kaggle.com/learn/feature-engineering'),
          crs('Exploratory Data Analysis Project', 'Self-study', '1 week'),
        ]),
        skill('ds-ml', 'Machine learning basics', 'Regression, classification, trees and clustering.', Icons.model_training, 2, 'ds-eda', [
          crs('Intro to Machine Learning', 'Kaggle Learn', '3 hours', 'https://www.kaggle.com/learn/intro-to-machine-learning'),
          crs('scikit-learn User Guide', 'scikit-learn.org', 'Self-paced', 'https://scikit-learn.org/stable/user_guide.html'),
          crsPaid('Machine Learning Specialization', 'Coursera', '3 months', 'https://www.coursera.org/specializations/machine-learning-introduction'),
        ]),
        skill('ds-eval', 'Model evaluation', 'Cross-validation, metrics and tuning.', Icons.fact_check, 2, 'ds-ml', [
          crs('Intermediate Machine Learning', 'Kaggle Learn', '4 hours', 'https://www.kaggle.com/learn/intermediate-machine-learning'),
          crs('Cross-validation', 'scikit-learn.org', '2 hours', 'https://scikit-learn.org/stable/modules/cross_validation.html'),
          crs('Hyperparameter Tuning', 'scikit-learn.org', '2 hours', 'https://scikit-learn.org/stable/modules/grid_search.html'),
        ]),
        skill('ds-dl', 'Deep learning intro', 'Neural networks with PyTorch or Keras.', Icons.hub, 2, 'ds-ml', [
          crs('Practical Deep Learning', 'fast.ai', '30 hours', 'https://course.fast.ai'),
          crs('Intro to Deep Learning', 'Kaggle Learn', '4 hours', 'https://www.kaggle.com/learn/intro-to-deep-learning'),
          crs('PyTorch Tutorials', 'pytorch.org', '10 hours', 'https://pytorch.org/tutorials'),
        ]),
        skill('ds-deploy', 'Deploying models', 'Serve models with Streamlit, FastAPI and MLflow.', Icons.cloud_upload, 3, 'ds-eval', [
          crs('Streamlit Docs', 'streamlit.io', '3 hours', 'https://docs.streamlit.io'),
          crs('MLflow Docs', 'mlflow.org', '4 hours', 'https://mlflow.org/docs/latest'),
          crs('FastAPI Tutorial', 'fastapi.tiangolo.com', '5 hours', 'https://fastapi.tiangolo.com/tutorial'),
        ]),
        skill('ds-story', 'Dashboards and storytelling', 'Communicate findings with BI tools.', Icons.insights, 3, 'ds-viz', [
          crs('Tableau Public Training', 'Tableau', '6 hours', 'https://public.tableau.com/app/learn'),
          crs('Power BI Training', 'Microsoft Learn', '8 hours', 'https://learn.microsoft.com/power-bi'),
          crsPaid('Storytelling with Data', 'Book', 'Self-paced'),
        ]),
        skill('ds-career', 'Portfolio and interviews', 'Kaggle projects, case studies and interview practice.', Icons.work, 4, 'ds-deploy', [
          crs('Kaggle Competitions', 'Kaggle', 'Ongoing', 'https://www.kaggle.com/competitions'),
          crs('Data Science Roadmap', 'roadmap.sh', 'Reference', 'https://roadmap.sh/ai-data-scientist'),
          crs('Data Science Interview Prep', 'YouTube', '10 hours'),
        ]),
      ],
    );

// ===================== AI / ML Engineer =====================
Career mlEngineerCareer() => Career(
      id: 'ml-engineer',
      title: 'AI / ML Engineer',
      tagline: 'Train, evaluate and ship machine learning and LLM-powered systems.',
      icon: Icons.psychology,
      color: const Color(0xFFAD1457),
      stages: makeStages([
        ['Foundations', 'Python and math'],
        ['Classical ML', 'Core algorithms'],
        ['Deep learning', 'Neural networks, vision and language'],
        ['LLMs and production', 'Build and run AI systems'],
        ['Career', 'Research reading and portfolio'],
      ]),
      nodes: [
        skill('ml-python', 'Python for ML', 'Python, NumPy and notebooks for experiments.', Icons.code, 0, null, [
          crs('Python', 'Kaggle Learn', '5 hours', 'https://www.kaggle.com/learn/python'),
          crs('NumPy Quickstart', 'numpy.org', '2 hours', 'https://numpy.org/doc/stable/user/quickstart.html'),
          crs('Git and GitHub for Beginners', 'freeCodeCamp', '1 hour'),
        ]),
        skill('ml-math', 'Linear algebra and calculus', 'Vectors, matrices, gradients and probability.', Icons.functions, 0, 'ml-python', [
          crs('Essence of Linear Algebra', '3Blue1Brown', '3 hours', 'https://www.3blue1brown.com/topics/linear-algebra'),
          crs('Mathematics for Machine Learning', 'mml-book.com', '30 hours', 'https://mml-book.github.io'),
          crs('Calculus', 'Khan Academy', '20 hours', 'https://www.khanacademy.org/math/calculus-1'),
        ]),
        skill('ml-classic', 'Classical machine learning', 'Regression, trees, SVMs, clustering and evaluation.', Icons.model_training, 1, 'ml-math', [
          crsPaid('Machine Learning Specialization', 'Coursera', '3 months', 'https://www.coursera.org/specializations/machine-learning-introduction'),
          crs('scikit-learn User Guide', 'scikit-learn.org', 'Self-paced', 'https://scikit-learn.org/stable/user_guide.html'),
          crs('Intro to Machine Learning', 'Kaggle Learn', '3 hours', 'https://www.kaggle.com/learn/intro-to-machine-learning'),
        ]),
        skill('ml-pytorch', 'PyTorch', 'Tensors, autograd and training loops.', Icons.memory, 2, 'ml-classic', [
          crs('PyTorch Tutorials', 'pytorch.org', '10 hours', 'https://pytorch.org/tutorials'),
          crs('Learn PyTorch', 'learnpytorch.io', '25 hours', 'https://www.learnpytorch.io'),
          crs('Practical Deep Learning', 'fast.ai', '30 hours', 'https://course.fast.ai'),
        ]),
        skill('ml-cv', 'Computer vision', 'CNNs, detection and image models.', Icons.visibility, 2, 'ml-pytorch', [
          crs('CS231n', 'Stanford', '30 hours', 'https://cs231n.github.io'),
          crs('Computer Vision Course', 'Hugging Face', '15 hours', 'https://huggingface.co/learn/computer-vision-course'),
          crs('OpenCV Tutorials', 'opencv.org', '5 hours', 'https://docs.opencv.org/4.x/d9/df8/tutorial_root.html'),
        ]),
        skill('ml-nlp', 'NLP and transformers', 'Tokenization, attention and fine-tuning.', Icons.chat, 2, 'ml-pytorch', [
          crs('NLP Course', 'Hugging Face', '20 hours', 'https://huggingface.co/learn/nlp-course'),
          crs('The Illustrated Transformer', 'Jay Alammar', '1 hour', 'https://jalammar.github.io/illustrated-transformer'),
          crs('CS224N', 'Stanford', '30 hours', 'https://web.stanford.edu/class/cs224n'),
        ]),
        skill('ml-llm', 'Building with LLMs', 'Prompting, tool use, structured output and evaluation.', Icons.auto_awesome, 3, 'ml-nlp', [
          crs('Prompt Engineering Overview', 'Anthropic Docs', '2 hours', 'https://docs.claude.com/en/docs/build-with-claude/prompt-engineering/overview'),
          crs('Short Courses', 'DeepLearning.AI', '1 hour each', 'https://www.deeplearning.ai/short-courses'),
          crs('Hugging Face LLM Course', 'Hugging Face', '10 hours', 'https://huggingface.co/learn'),
        ]),
        skill('ml-rag', 'RAG and agents', 'Embeddings, vector search and agent loops.', Icons.search, 3, 'ml-llm', [
          crs('Building and Evaluating RAG', 'DeepLearning.AI', '2 hours', 'https://www.deeplearning.ai/short-courses'),
          crs('Vector Database Learning Center', 'Pinecone', '4 hours', 'https://www.pinecone.io/learn'),
          crs('Building Effective Agents', 'Anthropic', '1 hour', 'https://www.anthropic.com/engineering/building-effective-agents'),
        ]),
        skill('ml-mlops', 'MLOps', 'Track experiments, containerize and monitor models.', Icons.settings_suggest, 3, 'ml-pytorch', [
          crs('MLOps Zoomcamp', 'DataTalks.Club', '10 weeks', 'https://github.com/DataTalksClub/mlops-zoomcamp'),
          crs('MLflow Docs', 'mlflow.org', '4 hours', 'https://mlflow.org/docs/latest'),
          crs('Docker Get Started', 'docker.com', '4 hours', 'https://docs.docker.com/get-started'),
        ]),
        skill('ml-career', 'Research reading and portfolio', 'Read papers, reproduce results and publish projects.', Icons.work, 4, 'ml-mlops', [
          crs('Papers with Code', 'paperswithcode.com', 'Ongoing', 'https://paperswithcode.com'),
          crs('Kaggle Competitions', 'Kaggle', 'Ongoing', 'https://www.kaggle.com/competitions'),
          crs('AI Engineer Roadmap', 'roadmap.sh', 'Reference', 'https://roadmap.sh/ai-engineer'),
        ]),
      ],
    );

// ===================== DevOps Engineer =====================
Career devopsCareer() => Career(
      id: 'devops',
      title: 'DevOps Engineer',
      tagline: 'Automate building, deploying and running software reliably at scale.',
      icon: Icons.settings_suggest,
      color: const Color(0xFF455A64),
      stages: makeStages([
        ['Foundations', 'Linux, networking and scripting'],
        ['Containers and CI/CD', 'Package and ship code automatically'],
        ['Cloud and infrastructure', 'Run workloads on the cloud'],
        ['Reliability', 'Monitor and keep systems healthy'],
        ['Career', 'Certifications and interviews'],
      ]),
      nodes: [
        skill('do-linux', 'Linux and shell', 'Files, processes, permissions and Bash scripting.', Icons.terminal, 0, null, [
          crs('Linux Journey', 'linuxjourney.com', '10 hours', 'https://linuxjourney.com'),
          crs('The Missing Semester', 'MIT', '12 hours', 'https://missing.csail.mit.edu'),
          crs('OverTheWire: Bandit', 'overthewire.org', '8 hours', 'https://overthewire.org/wargames/bandit'),
        ]),
        skill('do-net', 'Networking basics', 'TCP/IP, DNS, HTTP, load balancers and firewalls.', Icons.router, 0, 'do-linux', [
          crs('Cloudflare Learning Center', 'Cloudflare', '6 hours', 'https://www.cloudflare.com/learning/'),
          crs('Practical Networking', 'practicalnetworking.net', '8 hours', 'https://www.practicalnetworking.net'),
          crs('Networking Basics', 'Cisco Networking Academy', '10 hours', 'https://www.netacad.com'),
        ]),
        skill('do-git', 'Git and scripting', 'Branching workflows and automating tasks with Bash or Python.', Icons.account_tree, 0, 'do-linux', [
          crs('Pro Git', 'git-scm.com', 'Self-paced', 'https://git-scm.com/book'),
          crs('Bash Scripting', 'freeCodeCamp', '4 hours'),
          crs('Automate the Boring Stuff', 'Al Sweigart', '20 hours', 'https://automatetheboringstuff.com'),
        ]),
        skill('do-docker', 'Docker', 'Images, containers, volumes, networks and Compose.', Icons.inventory_2, 1, 'do-git', [
          crs('Docker Get Started', 'docker.com', '4 hours', 'https://docs.docker.com/get-started'),
          crs('Play with Docker Labs', 'Docker', '4 hours', 'https://labs.play-with-docker.com'),
          crs('Docker Compose Guide', 'docker.com', '2 hours', 'https://docs.docker.com/compose'),
        ]),
        skill('do-ci', 'CI/CD pipelines', 'Automate builds, tests and releases.', Icons.autorenew, 1, 'do-docker', [
          crs('GitHub Actions', 'GitHub Docs', '4 hours', 'https://docs.github.com/actions'),
          crs('GitLab CI/CD', 'GitLab', '3 hours', 'https://docs.gitlab.com/ee/ci'),
          crs('Jenkins Handbook', 'jenkins.io', '4 hours', 'https://www.jenkins.io/doc'),
        ]),
        skill('do-k8s', 'Kubernetes', 'Pods, deployments, services and Helm.', Icons.hub, 2, 'do-docker', [
          crs('Kubernetes Basics', 'kubernetes.io', '6 hours', 'https://kubernetes.io/docs/tutorials/kubernetes-basics'),
          crs('Helm Docs', 'helm.sh', '3 hours', 'https://helm.sh/docs'),
          crsPaid('Kubernetes for Beginners', 'KodeKloud', '10 hours', 'https://kodekloud.com'),
        ]),
        skill('do-cloud', 'A major cloud', 'Compute, storage, networking and IAM on AWS, Azure or GCP.', Icons.cloud, 2, 'do-net', [
          crs('Cloud Practitioner Essentials', 'AWS Training', '6 hours', 'https://aws.amazon.com/training'),
          crs('Azure Fundamentals', 'Microsoft Learn', '10 hours', 'https://learn.microsoft.com/training'),
          crs('Cloud Skills Boost', 'Google Cloud', '10 hours', 'https://www.cloudskillsboost.google'),
        ]),
        skill('do-iac', 'Infrastructure as code', 'Define cloud resources with Terraform and Ansible.', Icons.code, 2, 'do-cloud', [
          crs('Terraform Tutorials', 'HashiCorp', '10 hours', 'https://developer.hashicorp.com/terraform/tutorials'),
          crs('Ansible Getting Started', 'ansible.com', '4 hours', 'https://docs.ansible.com/ansible/latest/getting_started/index.html'),
          crs('Pulumi Get Started', 'pulumi.com', '3 hours', 'https://www.pulumi.com/docs/get-started'),
        ]),
        skill('do-obs', 'Monitoring and logging', 'Metrics, logs and alerts with Prometheus and Grafana.', Icons.monitor_heart, 3, 'do-k8s', [
          crs('Prometheus Docs', 'prometheus.io', '4 hours', 'https://prometheus.io/docs'),
          crs('Grafana Tutorials', 'grafana.com', '4 hours', 'https://grafana.com/tutorials'),
          crs('OpenTelemetry Docs', 'opentelemetry.io', '3 hours', 'https://opentelemetry.io/docs'),
        ]),
        skill('do-sre', 'Reliability and incidents', 'SLOs, on-call, postmortems and chaos testing.', Icons.health_and_safety, 3, 'do-obs', [
          crs('Site Reliability Engineering Book', 'Google', '15 hours', 'https://sre.google/sre-book/table-of-contents'),
          crs('The SRE Workbook', 'Google', '15 hours', 'https://sre.google/workbook/table-of-contents'),
          crs('Chaos Engineering Intro', 'Gremlin', '2 hours', 'https://www.gremlin.com/chaos-engineering'),
        ]),
        skill('do-career', 'Certifications and interviews', 'Validate skills and prepare for interviews.', Icons.work, 4, 'do-sre', [
          crs('DevOps Roadmap', 'roadmap.sh', 'Reference', 'https://roadmap.sh/devops'),
          crsPaid('Certified Kubernetes Administrator', 'Linux Foundation', '2 months', 'https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka'),
          crs('DevOps Interview Questions', 'YouTube', '5 hours'),
        ]),
      ],
    );

// ===================== Cybersecurity Analyst =====================
Career cyberCareer() => Career(
      id: 'cyber',
      title: 'Cybersecurity Analyst',
      tagline: 'Protect systems and data by finding weaknesses and defending against attacks.',
      icon: Icons.shield,
      color: const Color(0xFFC62828),
      stages: makeStages([
        ['Foundations', 'IT, networking and operating systems'],
        ['Core security', 'Concepts and cryptography'],
        ['Offense and defense', 'Hack and defend'],
        ['Specialize', 'Cloud and automation'],
        ['Career', 'Certifications and jobs'],
      ]),
      nodes: [
        skill('cs-it', 'IT and networking basics', 'How computers and networks work: TCP/IP, DNS, ports.', Icons.router, 0, null, [
          crs('Network+ Training Course', 'Professor Messer', '25 hours', 'https://www.professormesser.com/network-plus/n10-009/n10-009-video/n10-009-training-course'),
          crs('Cloudflare Learning Center', 'Cloudflare', '6 hours', 'https://www.cloudflare.com/learning/'),
          crs('Networking Basics', 'Cisco Networking Academy', '10 hours', 'https://www.netacad.com'),
        ]),
        skill('cs-linux', 'Linux and Windows', 'Command line, permissions and system administration.', Icons.terminal, 0, 'cs-it', [
          crs('Linux Journey', 'linuxjourney.com', '10 hours', 'https://linuxjourney.com'),
          crs('OverTheWire: Bandit', 'overthewire.org', '8 hours', 'https://overthewire.org/wargames/bandit'),
          crs('Windows Server Training', 'Microsoft Learn', '6 hours', 'https://learn.microsoft.com/training'),
        ]),
        skill('cs-sec', 'Security fundamentals', 'CIA triad, threats, risk and security frameworks.', Icons.security, 1, 'cs-it', [
          crs('Security+ Training Course', 'Professor Messer', '30 hours', 'https://www.professormesser.com/security-plus/sy0-701/sy0-701-video/sy0-701-comptia-security-plus-course'),
          crs('NIST Cybersecurity Framework', 'NIST', '3 hours', 'https://www.nist.gov/cyberframework'),
          crsPaid('Google Cybersecurity Certificate', 'Coursera', '6 months', 'https://www.coursera.org/professional-certificates/google-cybersecurity'),
        ]),
        skill('cs-crypto', 'Cryptography basics', 'Hashing, symmetric and public-key encryption, TLS.', Icons.vpn_key, 1, 'cs-sec', [
          crs('Crypto 101', 'crypto101.io', '8 hours', 'https://www.crypto101.io'),
          crs('Cryptopals Challenges', 'cryptopals.com', '20 hours', 'https://cryptopals.com'),
          crs('Cryptography I', 'Stanford (Coursera)', '6 weeks', 'https://www.coursera.org/learn/crypto'),
        ]),
        skill('cs-web', 'Web application security', 'XSS, SQL injection, CSRF and secure coding.', Icons.bug_report, 2, 'cs-sec', [
          crs('Web Security Academy', 'PortSwigger', '30 hours', 'https://portswigger.net/web-security'),
          crs('OWASP Top Ten', 'OWASP', '3 hours', 'https://owasp.org/www-project-top-ten'),
          crs('OWASP Juice Shop', 'OWASP', '10 hours', 'https://owasp.org/www-project-juice-shop'),
        ]),
        skill('cs-pen', 'Penetration testing', 'Recon, exploitation and reporting in legal labs.', Icons.lock_open, 2, 'cs-linux', [
          crs('TryHackMe Learning Paths', 'TryHackMe', '40 hours', 'https://tryhackme.com'),
          crs('Hack The Box Academy', 'Hack The Box', '40 hours', 'https://www.hackthebox.com'),
          crs('Metasploit Unleashed', 'OffSec', '10 hours', 'https://www.offsec.com/metasploit-unleashed'),
        ]),
        skill('cs-blue', 'Blue team and SOC', 'Log analysis, SIEM, detection and incident response.', Icons.monitor_heart, 2, 'cs-sec', [
          crs('MITRE ATT&CK', 'MITRE', '5 hours', 'https://attack.mitre.org'),
          crs('Splunk Free Training', 'Splunk', '10 hours', 'https://www.splunk.com/en_us/training/free-courses/overview.html'),
          crs('CyberDefenders Labs', 'cyberdefenders.org', '20 hours', 'https://cyberdefenders.org'),
        ]),
        skill('cs-cloud', 'Cloud security', 'IAM, network controls and misconfiguration risks.', Icons.cloud, 3, 'cs-web', [
          crs('AWS Security Fundamentals', 'AWS Training', '3 hours', 'https://aws.amazon.com/training'),
          crs('Microsoft Security Learning Paths', 'Microsoft Learn', '10 hours', 'https://learn.microsoft.com/training'),
          crs('Cloud Security Guidance', 'Cloud Security Alliance', '5 hours', 'https://cloudsecurityalliance.org/research/guidance'),
        ]),
        skill('cs-script', 'Python for security', 'Automate scans, parse logs and write small tools.', Icons.code, 3, 'cs-pen', [
          crs('Automate the Boring Stuff', 'Al Sweigart', '20 hours', 'https://automatetheboringstuff.com'),
          crs('Scapy Docs', 'scapy.net', '3 hours', 'https://scapy.readthedocs.io'),
          crs('Python for Security Practice', 'TryHackMe', '5 hours', 'https://tryhackme.com'),
        ]),
        skill('cs-cert', 'Certifications and career', 'Validate skills and prepare for analyst roles.', Icons.work, 4, 'cs-blue', [
          crs('Cyber Security Roadmap', 'roadmap.sh', 'Reference', 'https://roadmap.sh/cyber-security'),
          crsPaid('CompTIA Security+ Exam', 'CompTIA', '2 months', 'https://www.comptia.org/certifications/security'),
          crs('SOC Analyst Interview Prep', 'YouTube', '5 hours'),
        ]),
      ],
    );

// ===================== UI/UX Designer =====================
Career uxCareer() => Career(
      id: 'ux',
      title: 'UI/UX Designer',
      tagline: 'Research users and design interfaces that are clear, usable and good looking.',
      icon: Icons.draw,
      color: const Color(0xFF00838F),
      stages: makeStages([
        ['Design basics', 'Principles, type and color'],
        ['Research and structure', 'Understand users and plan flows'],
        ['UI craft', 'Tools and systems'],
        ['Prototype and test', 'Validate your ideas'],
        ['Career', 'Portfolio and case studies'],
      ]),
      nodes: [
        skill('ux-principles', 'Design principles', 'Hierarchy, contrast, alignment, spacing and usability heuristics.', Icons.palette, 0, null, [
          crs('Laws of UX', 'lawsofux.com', '3 hours', 'https://lawsofux.com'),
          crs('10 Usability Heuristics', 'Nielsen Norman Group', '1 hour', 'https://www.nngroup.com/articles/ten-usability-heuristics'),
          crsPaid('Google UX Design Certificate', 'Coursera', '6 months', 'https://www.coursera.org/professional-certificates/google-ux-design'),
        ]),
        skill('ux-type', 'Typography and color', 'Pair fonts, build a type scale and choose accessible palettes.', Icons.text_fields, 0, 'ux-principles', [
          crs('Practical Typography', 'Matthew Butterick', '4 hours', 'https://practicaltypography.com'),
          crs('Color Theory Basics', 'Interaction Design Foundation', '2 hours', 'https://www.interaction-design.org/literature/topics/color-theory'),
          crs('Material Design Color System', 'Google', '2 hours', 'https://m3.material.io/styles/color/overview'),
        ]),
        skill('ux-research', 'User research', 'Interviews, surveys and personas.', Icons.people, 1, 'ux-principles', [
          crs('Research Articles', 'Nielsen Norman Group', '10 hours', 'https://www.nngroup.com/articles'),
          crsPaid('User Research Course', 'Interaction Design Foundation', '20 hours', 'https://www.interaction-design.org'),
          crs('The Mom Test', 'Book', '4 hours'),
        ]),
        skill('ux-ia', 'Information architecture and flows', 'Sitemaps, card sorting and user flows.', Icons.schema, 1, 'ux-research', [
          crs('Information Architecture', 'Nielsen Norman Group', '3 hours', 'https://www.nngroup.com/articles/ia-vs-navigation'),
          crs('Card Sorting Guide', 'Optimal Workshop', '2 hours', 'https://www.optimalworkshop.com/learn'),
          crs('User Flow Basics', 'Figma', '2 hours', 'https://www.figma.com/resource-library/user-flow'),
        ]),
        skill('ux-wire', 'Wireframing', 'Low-fidelity layouts to test structure early.', Icons.grid_view, 1, 'ux-ia', [
          crs('Wireframing Guide', 'Figma', '2 hours', 'https://www.figma.com/resource-library/what-is-wireframing'),
          crs('Sketching for UX', 'YouTube', '2 hours'),
          crs('Lo-fi Wireframe Project', 'Self-study', '1 week'),
        ]),
        skill('ux-figma', 'Figma', 'Frames, auto layout, components and variants.', Icons.design_services, 2, 'ux-wire', [
          crs('Figma Learn Design', 'Figma', '8 hours', 'https://help.figma.com/hc/en-us/categories/360002051613-Get-started'),
          crs('Figma for Beginners', 'YouTube', '4 hours'),
          crs('Auto Layout Guide', 'Figma', '2 hours', 'https://help.figma.com/hc/en-us/articles/360040451373-Explore-auto-layout-properties'),
        ]),
        skill('ux-ds', 'Design systems', 'Tokens, components and documentation.', Icons.layers, 2, 'ux-figma', [
          crs('Material Design 3', 'Google', '5 hours', 'https://m3.material.io'),
          crs('Human Interface Guidelines', 'Apple', '5 hours', 'https://developer.apple.com/design/human-interface-guidelines'),
          crs('Atomic Design', 'Brad Frost', '4 hours', 'https://atomicdesign.bradfrost.com'),
        ]),
        skill('ux-access', 'Accessibility', 'Design for contrast, focus, screen readers and inclusion.', Icons.accessibility_new, 2, 'ux-type', [
          crs('Learn Accessibility', 'web.dev', '6 hours', 'https://web.dev/learn/accessibility'),
          crs('WCAG Quick Reference', 'W3C', '3 hours', 'https://www.w3.org/WAI/WCAG22/quickref'),
          crs('Inclusive Design Toolkit', 'Microsoft', '2 hours', 'https://inclusive.microsoft.design'),
        ]),
        skill('ux-proto', 'Prototyping and usability testing', 'Interactive prototypes and testing with real users.', Icons.touch_app, 3, 'ux-figma', [
          crs('Prototyping in Figma', 'Figma', '3 hours', 'https://help.figma.com/hc/en-us/articles/360040314193-Guide-to-prototyping-in-Figma'),
          crs('Usability Testing Guide', 'Maze', '3 hours', 'https://maze.co/guides/usability-testing'),
          crs('Usability Testing 101', 'Nielsen Norman Group', '1 hour', 'https://www.nngroup.com/articles/usability-testing-101'),
        ]),
        skill('ux-career', 'Portfolio and case studies', 'Tell the story of your process and land interviews.', Icons.work, 4, 'ux-proto', [
          crs('Build 3 case studies', 'Self-study', '6 weeks'),
          crs('UX Design Roadmap', 'roadmap.sh', 'Reference', 'https://roadmap.sh/ux-design'),
          crs('Design Interview Practice', 'YouTube', '5 hours'),
        ]),
      ],
    );
