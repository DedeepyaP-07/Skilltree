import 'package:flutter/material.dart';

import '../models.dart';
import 'helpers.dart';

// ===================== Frontend Web Developer =====================
Career frontendCareer() => Career(
      id: 'frontend',
      title: 'Frontend Web Developer',
      tagline: 'Build fast, accessible websites and web apps with HTML, CSS, JavaScript and React.',
      icon: Icons.web,
      color: const Color(0xFFE65100),
      stages: makeStages([
        ['Web basics', 'Structure, style and version control'],
        ['JavaScript', 'The language of the browser'],
        ['Frameworks', 'React and the modern ecosystem'],
        ['Quality and speed', 'Test and optimize your apps'],
        ['Career', 'Show your work and get hired'],
      ]),
      nodes: [
        skill('fe-html', 'HTML and CSS', 'Semantic markup, the box model, selectors and styling.', Icons.html, 0, null, [
          crs('Learn Web Development', 'MDN', '20 hours', 'https://developer.mozilla.org/en-US/docs/Learn_web_development'),
          crs('Responsive Web Design', 'freeCodeCamp', '300 hours', 'https://www.freecodecamp.org/learn'),
          crs('Learn CSS', 'web.dev', '8 hours', 'https://web.dev/learn/css'),
        ]),
        skill('fe-layout', 'Layout and Tailwind', 'Flexbox, Grid, responsive design and utility-first CSS.', Icons.grid_view, 0, 'fe-html', [
          crs('Flexbox Froggy', 'flexboxfroggy.com', '1 hour', 'https://flexboxfroggy.com'),
          crs('CSS Grid Garden', 'cssgridgarden.com', '1 hour', 'https://cssgridgarden.com'),
          crs('Tailwind CSS Docs', 'tailwindcss.com', '4 hours', 'https://tailwindcss.com/docs'),
        ]),
        skill('fe-git', 'Git and GitHub', 'Track changes and collaborate with branches and pull requests.', Icons.account_tree, 0, 'fe-html', [
          crs('Git and GitHub for Beginners', 'freeCodeCamp', '1 hour'),
          crs('Pro Git', 'git-scm.com', 'Self-paced', 'https://git-scm.com/book'),
          crs('GitHub Skills', 'GitHub', '5 hours', 'https://skills.github.com'),
        ]),
        skill('fe-js', 'JavaScript', 'Variables, functions, closures, promises and modern ES features.', Icons.javascript, 1, 'fe-html', [
          crs('The Modern JavaScript Tutorial', 'javascript.info', '40 hours', 'https://javascript.info'),
          crs('Eloquent JavaScript', 'Book', 'Self-paced', 'https://eloquentjavascript.net'),
          crs('JavaScript Algorithms and Data Structures', 'freeCodeCamp', '300 hours'),
        ]),
        skill('fe-dom', 'DOM and browser APIs', 'Select elements, handle events, fetch data and use web storage.', Icons.touch_app, 1, 'fe-js', [
          crs('Document Object Model', 'MDN', '5 hours', 'https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model'),
          crs('Using the Fetch API', 'MDN', '2 hours', 'https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch'),
          crs('JavaScript30', 'Wes Bos', '10 hours', 'https://javascript30.com'),
        ]),
        skill('fe-ts', 'TypeScript', 'Add static types to catch bugs before they run.', Icons.code, 1, 'fe-js', [
          crs('TypeScript Handbook', 'typescriptlang.org', '6 hours', 'https://www.typescriptlang.org/docs/handbook/intro.html'),
          crs('TypeScript Tutorials', 'Total TypeScript', '8 hours', 'https://www.totaltypescript.com/tutorials'),
          crs('TypeScript Playground', 'typescriptlang.org', 'Ongoing', 'https://www.typescriptlang.org/play'),
        ]),
        skill('fe-react', 'React', 'Components, props, hooks and composing user interfaces.', Icons.layers, 2, 'fe-dom', [
          crs('Learn React', 'react.dev', '12 hours', 'https://react.dev/learn'),
          crs('Full Stack Open', 'University of Helsinki', '60 hours', 'https://fullstackopen.com'),
          crsPaid('Learn React', 'Scrimba', '12 hours'),
        ]),
        skill('fe-state', 'State and data fetching', 'Manage client state and server data with Redux Toolkit and TanStack Query.', Icons.sync_alt, 2, 'fe-react', [
          crs('Redux Toolkit Tutorials', 'redux-toolkit.js.org', '5 hours', 'https://redux-toolkit.js.org/tutorials/overview'),
          crs('TanStack Query Docs', 'tanstack.com', '4 hours', 'https://tanstack.com/query/latest'),
          crs('Zustand', 'GitHub', '1 hour', 'https://github.com/pmndrs/zustand'),
        ]),
        skill('fe-next', 'Next.js', 'Routing, server rendering and full-stack React apps.', Icons.rocket_launch, 2, 'fe-react', [
          crs('Learn Next.js', 'nextjs.org', '10 hours', 'https://nextjs.org/learn'),
          crs('Next.js Documentation', 'nextjs.org', 'Self-paced', 'https://nextjs.org/docs'),
          crs('Next.js Full Course', 'YouTube', '6 hours'),
        ]),
        skill('fe-test', 'Testing', 'Unit, component and end-to-end tests.', Icons.bug_report, 3, 'fe-state', [
          crs('Testing Library Docs', 'testing-library.com', '3 hours', 'https://testing-library.com/docs'),
          crs('Vitest Guide', 'vitest.dev', '2 hours', 'https://vitest.dev/guide'),
          crs('Playwright Getting Started', 'playwright.dev', '3 hours', 'https://playwright.dev/docs/intro'),
        ]),
        skill('fe-perf', 'Performance and accessibility', 'Core Web Vitals, Lighthouse and WCAG basics.', Icons.speed, 3, 'fe-next', [
          crs('Learn Performance', 'web.dev', '6 hours', 'https://web.dev/learn/performance'),
          crs('Learn Accessibility', 'web.dev', '6 hours', 'https://web.dev/learn/accessibility'),
          crs('Lighthouse Overview', 'Chrome Developers', '1 hour', 'https://developer.chrome.com/docs/lighthouse/overview'),
        ]),
        skill('fe-career', 'Portfolio and interviews', 'Ship projects, polish your portfolio and practice interviews.', Icons.work, 4, 'fe-perf', [
          crs('Build 3 portfolio projects', 'Self-study', '4 weeks'),
          crs('Front End Interview Handbook', 'frontendinterviewhandbook.com', '10 hours', 'https://www.frontendinterviewhandbook.com'),
          crs('Frontend Developer Roadmap', 'roadmap.sh', 'Reference', 'https://roadmap.sh/frontend'),
        ]),
      ],
    );

// ===================== Backend Developer =====================
Career backendCareer() => Career(
      id: 'backend',
      title: 'Backend Developer',
      tagline: 'Design APIs, databases and servers that power apps behind the scenes.',
      icon: Icons.dns,
      color: const Color(0xFF2E7D32),
      stages: makeStages([
        ['Foundations', 'A language, Git and how the web works'],
        ['Core backend', 'Frameworks and databases'],
        ['APIs and security', 'Build and protect your APIs'],
        ['Scale and deploy', 'Architecture and shipping to production'],
        ['Career', 'Projects and interview prep'],
      ]),
      nodes: [
        skill('be-prog', 'Backend language', 'Pick Python, Node.js or Java and learn it well.', Icons.code, 0, null, [
          crs('CS50 Python', 'Harvard', '10 weeks', 'https://cs50.harvard.edu/python'),
          crs('Learn Node.js', 'nodejs.org', '10 hours', 'https://nodejs.org/en/learn'),
          crs('Java Programming', 'MOOC.fi', '12 weeks', 'https://java-programming.mooc.fi'),
        ]),
        skill('be-git', 'Git and Linux basics', 'Version control and the command line.', Icons.terminal, 0, 'be-prog', [
          crs('Git and GitHub for Beginners', 'freeCodeCamp', '1 hour'),
          crs('Linux Journey', 'linuxjourney.com', '10 hours', 'https://linuxjourney.com'),
          crs('The Missing Semester', 'MIT', '12 hours', 'https://missing.csail.mit.edu'),
        ]),
        skill('be-http', 'HTTP and the web', 'Requests, responses, status codes, headers and DNS.', Icons.public, 0, 'be-prog', [
          crs('HTTP Overview', 'MDN', '3 hours', 'https://developer.mozilla.org/en-US/docs/Web/HTTP'),
          crs('How the Internet Works', 'Cloudflare Learning', '2 hours', 'https://www.cloudflare.com/learning/'),
          crs('Postman Learning Center', 'Postman', '3 hours', 'https://learning.postman.com'),
        ]),
        skill('be-framework', 'Web framework', 'Routing, middleware and controllers with Express, FastAPI or Spring Boot.', Icons.web_asset, 1, 'be-prog', [
          crs('Express Guide', 'expressjs.com', '4 hours', 'https://expressjs.com/en/starter/installing.html'),
          crs('FastAPI Tutorial', 'fastapi.tiangolo.com', '5 hours', 'https://fastapi.tiangolo.com/tutorial'),
          crs('Spring Boot Guides', 'spring.io', '6 hours', 'https://spring.io/guides'),
        ]),
        skill('be-sql', 'SQL and relational databases', 'Queries, joins, indexes and transactions with PostgreSQL.', Icons.storage, 1, 'be-prog', [
          crs('SQLBolt', 'sqlbolt.com', '4 hours', 'https://sqlbolt.com'),
          crs('PostgreSQL Tutorial', 'postgresqltutorial.com', '10 hours', 'https://www.postgresqltutorial.com'),
          crs('SQL Tutorial', 'Mode', '6 hours', 'https://mode.com/sql-tutorial'),
        ]),
        skill('be-orm', 'Schema design and ORMs', 'Model data well and use Prisma or SQLAlchemy safely.', Icons.table_chart, 1, 'be-sql', [
          crs('Database Design Course', 'freeCodeCamp', '8 hours'),
          crs('Prisma Docs', 'prisma.io', '4 hours', 'https://www.prisma.io/docs'),
          crs('SQLAlchemy Tutorial', 'sqlalchemy.org', '4 hours', 'https://docs.sqlalchemy.org/en/20/tutorial'),
        ]),
        skill('be-rest', 'REST API design', 'Resources, versioning, pagination and OpenAPI documentation.', Icons.api, 2, 'be-framework', [
          crs('RESTful API Design', 'restfulapi.net', '3 hours', 'https://restfulapi.net'),
          crs('Learn OpenAPI', 'openapis.org', '3 hours', 'https://learn.openapis.org'),
          crs('API Design Best Practices', 'Postman', '2 hours', 'https://learning.postman.com'),
        ]),
        skill('be-auth', 'Authentication and security', 'Sessions, JWT, OAuth and the OWASP Top Ten.', Icons.lock, 2, 'be-rest', [
          crs('OWASP Top Ten', 'OWASP', '3 hours', 'https://owasp.org/www-project-top-ten'),
          crs('Introduction to JWT', 'jwt.io', '1 hour', 'https://jwt.io/introduction'),
          crs('OAuth 2.0 Simplified', 'oauth.com', '3 hours', 'https://www.oauth.com'),
        ]),
        skill('be-nosql', 'NoSQL and caching', 'Document stores and Redis for speed.', Icons.bolt, 2, 'be-sql', [
          crs('MongoDB University', 'MongoDB', '10 hours', 'https://learn.mongodb.com'),
          crs('Redis University', 'Redis', '8 hours', 'https://university.redis.io'),
          crs('Caching Strategies', 'YouTube', '1 hour'),
        ]),
        skill('be-arch', 'Architecture and scaling', 'Load balancing, queues, microservices and system design.', Icons.architecture, 3, 'be-rest', [
          crs('System Design Primer', 'GitHub', '20 hours', 'https://github.com/donnemartin/system-design-primer'),
          crs('Microservices Patterns', 'microservices.io', '5 hours', 'https://microservices.io'),
          crs('RabbitMQ Tutorials', 'rabbitmq.com', '3 hours', 'https://www.rabbitmq.com/tutorials'),
        ]),
        skill('be-docker', 'Docker and deployment', 'Containerize your service and ship it with CI/CD.', Icons.cloud_upload, 3, 'be-arch', [
          crs('Docker Get Started', 'docker.com', '4 hours', 'https://docs.docker.com/get-started'),
          crs('GitHub Actions', 'GitHub Docs', '3 hours', 'https://docs.github.com/actions'),
          crs('Deploy a Web Service', 'Render', '2 hours', 'https://render.com/docs'),
        ]),
        skill('be-career', 'Portfolio and interviews', 'Build API projects and practice system design interviews.', Icons.work, 4, 'be-docker', [
          crs('Build 3 API projects', 'Self-study', '4 weeks'),
          crs('Backend Developer Roadmap', 'roadmap.sh', 'Reference', 'https://roadmap.sh/backend'),
          crs('System Design Interview Prep', 'YouTube', '10 hours'),
        ]),
      ],
    );

// ===================== Android Developer =====================
Career androidCareer() => Career(
      id: 'android',
      title: 'Android Developer',
      tagline: 'Create native Android apps with Kotlin and Jetpack Compose.',
      icon: Icons.android,
      color: const Color(0xFF00A86B),
      stages: makeStages([
        ['Foundations', 'Programming and Git'],
        ['Kotlin', 'The official Android language'],
        ['Android core', 'Studio, Compose and navigation'],
        ['Data and architecture', 'Storage, networking and clean structure'],
        ['Launch', 'Test and publish'],
      ]),
      nodes: [
        skill('an-prog', 'Programming basics', 'Variables, control flow, functions and OOP.', Icons.code, 0, null, [
          crs('CS50x', 'Harvard', '11 weeks', 'https://cs50.harvard.edu/x'),
          crs('Object-Oriented Programming Explained', 'freeCodeCamp', '3 hours'),
          crs('Exercism Practice', 'exercism.org', 'Ongoing', 'https://exercism.org'),
        ]),
        skill('an-git', 'Git and GitHub', 'Version control for every app you build.', Icons.account_tree, 0, 'an-prog', [
          crs('Git and GitHub for Beginners', 'freeCodeCamp', '1 hour'),
          crs('Pro Git', 'git-scm.com', 'Self-paced', 'https://git-scm.com/book'),
          crs('GitHub Skills', 'GitHub', '5 hours', 'https://skills.github.com'),
        ]),
        skill('an-kotlin', 'Kotlin basics', 'Null safety, classes, lambdas and collections.', Icons.data_object, 1, 'an-prog', [
          crs('Kotlin Docs: Getting Started', 'kotlinlang.org', '6 hours', 'https://kotlinlang.org/docs/getting-started.html'),
          crs('Kotlin Koans', 'JetBrains', '3 hours', 'https://kotlinlang.org/docs/koans.html'),
          crs('Kotlin Bootcamp', 'Android Developers', '8 hours', 'https://developer.android.com/courses/kotlin-bootcamp/overview'),
        ]),
        skill('an-coroutines', 'Coroutines and Flow', 'Run work in the background and stream data.', Icons.sync_alt, 1, 'an-kotlin', [
          crs('Coroutines Guide', 'kotlinlang.org', '4 hours', 'https://kotlinlang.org/docs/coroutines-guide.html'),
          crs('Kotlin Coroutines on Android', 'Android Developers', '3 hours', 'https://developer.android.com/kotlin/coroutines'),
          crs('Kotlin Flow', 'Android Developers', '3 hours', 'https://developer.android.com/kotlin/flow'),
        ]),
        skill('an-studio', 'Android Studio and first app', 'Set up, run an emulator and build a first screen.', Icons.phone_android, 2, 'an-kotlin', [
          crs('Android Basics with Compose', 'Android Developers', '40 hours', 'https://developer.android.com/courses/android-basics-compose/course'),
          crs('Android Studio Docs', 'Android Developers', '3 hours', 'https://developer.android.com/studio/intro'),
          crs('Build Your First App', 'Android Developers', '2 hours', 'https://developer.android.com/get-started/overview'),
        ]),
        skill('an-compose', 'Jetpack Compose', 'Declarative UI, state, theming and lists.', Icons.widgets, 2, 'an-studio', [
          crs('Jetpack Compose Pathway', 'Android Developers', '30 hours', 'https://developer.android.com/courses/pathways/compose'),
          crs('Compose Documentation', 'Android Developers', 'Self-paced', 'https://developer.android.com/compose'),
          crs('Now in Android Sample', 'GitHub', '6 hours', 'https://github.com/android/nowinandroid'),
        ]),
        skill('an-nav', 'Navigation and ViewModel', 'Move between screens and survive configuration changes.', Icons.alt_route, 2, 'an-compose', [
          crs('Navigation in Compose', 'Android Developers', '2 hours', 'https://developer.android.com/develop/ui/compose/navigation'),
          crs('ViewModel Overview', 'Android Developers', '2 hours', 'https://developer.android.com/topic/libraries/architecture/viewmodel'),
          crs('Activity Lifecycle', 'Android Developers', '2 hours', 'https://developer.android.com/guide/components/activities/activity-lifecycle'),
        ]),
        skill('an-room', 'Room and DataStore', 'Save data locally with SQLite via Room.', Icons.storage, 3, 'an-nav', [
          crs('Room Persistence Library', 'Android Developers', '4 hours', 'https://developer.android.com/training/data-storage/room'),
          crs('DataStore', 'Android Developers', '2 hours', 'https://developer.android.com/topic/libraries/architecture/datastore'),
          crs('Data Persistence Codelab', 'Android Developers', '3 hours', 'https://developer.android.com/courses/android-basics-compose/unit-6'),
        ]),
        skill('an-net', 'Networking with Retrofit', 'Call REST APIs and load images.', Icons.cloud_sync, 3, 'an-nav', [
          crs('Retrofit Docs', 'Square', '2 hours', 'https://square.github.io/retrofit'),
          crs('Get Data from the Internet', 'Android Developers', '3 hours', 'https://developer.android.com/courses/android-basics-compose/unit-5'),
          crs('Coil Image Loading', 'coil-kt.github.io', '1 hour', 'https://coil-kt.github.io/coil'),
        ]),
        skill('an-arch', 'App architecture and Hilt', 'Layers, repositories and dependency injection.', Icons.architecture, 3, 'an-room', [
          crs('Guide to App Architecture', 'Android Developers', '4 hours', 'https://developer.android.com/topic/architecture'),
          crs('Hilt Dependency Injection', 'Android Developers', '3 hours', 'https://developer.android.com/training/dependency-injection/hilt-android'),
          crs('Android Architecture Samples', 'GitHub', '4 hours', 'https://github.com/android/architecture-samples'),
        ]),
        skill('an-publish', 'Testing and Google Play', 'Test your app, sign it and publish.', Icons.rocket_launch, 4, 'an-arch', [
          crs('Testing on Android', 'Android Developers', '5 hours', 'https://developer.android.com/training/testing'),
          crs('Publish Your App', 'Android Developers', '2 hours', 'https://developer.android.com/studio/publish'),
          crs('Play Console Help', 'Google', '2 hours', 'https://support.google.com/googleplay/android-developer'),
        ]),
      ],
    );
