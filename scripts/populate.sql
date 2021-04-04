DROP TABLE IF EXISTS user_projects;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS announcements;


CREATE TABLE users (
    id          INTEGER       PRIMARY KEY,
    name        VARCHAR(128)  NOT NULL,
    bio         TEXT          NOT NULL,
    avatar_url  VARCHAR(256)  NOT NULL,
    fellowship  VARCHAR(64)   NOT NULL,
    created_ts  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    updated_ts  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE projects (
    id          INTEGER       PRIMARY KEY,
    name        VARCHAR(256)  NOT NULL,
    description TEXT          NOT NULL,
    icon_url    VARCHAR(256)  NOT NULL,
    created_ts  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    updated_ts  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE user_projects (
    user_id,
    project_id,
    PRIMARY KEY (user_id, project_id)
);


CREATE TABLE announcements (
    id          INTEGER       PRIMARY KEY,
    fellowship  VARCHAR(64)   NOT NULL,
    title       VARCHAR(256)  NOT NULL,
    body        TEXT          NOT NULL,
    created_ts  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    updated_ts  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO users
(id, created_ts, updated_ts, avatar_url, fellowship, name, bio)
VALUES
(1,  "2020-12-14 18:24", "2020-12-01 18:24", "https://avatars.dicebear.com/api/avataaars/a1.svg",  "founders", "Dennis Pearson",    "I'm a founder, angel investor, ex-google team member passionate about startups. I also love traveling, the digital nomad lifestyle and anything outdoors." || char(10) || char(10) || "I'm currently exploring several ideas, excited to launch a new concept or join an existing team."),
(2,  "2020-12-15 18:09", "2020-12-01 18:09", "https://avatars.dicebear.com/api/avataaars/a2.svg",  "writers",  "Amirah Finch",      "I'm an award winning documentary filmmaker & creator, turned tech entrepreneur. My background lies in product, marketing, storytelling and community building."),
(3,  "2020-12-15 18:22", "2020-12-01 18:22", "https://avatars.dicebear.com/api/avataaars/a3.svg",  "writers",  "Callie Begum",      "My career began with building cybersecurity systems for U.S. Government clients followed by a leadership development program where I wrote about social impact investing. I founded a company setting up cybersecurity for FinTechs. Currently I am doing alliance strategy and writing about risk at calliebegum.com."),
(4,  "2020-12-16 10:39", "2020-12-01 10:39", "https://avatars.dicebear.com/api/avataaars/a4.svg",  "founders", "Bethan Estes",      "I've spent most of the past 12 years working in the education space, having led technology and product management over 9 years at Evolve Education (purchased by News Force) and then at Schoolnest (owned by Workgenix). I've also spent much of the past several years consulting and advising startups and philanthropies in the education space."),
(5,  "2020-12-17 19:13", "2020-12-01 19:13", "https://avatars.dicebear.com/api/avataaars/a5.svg",  "writers",  "Mayur Quintana",    "I run a consultancy business, which provides digital marketing and AI services. I've worked with startups and organizations across the world including Germany and Netherlands. Culture and society are my favourite topics to read and write about. I have always been interested in writing about human behaviours and what my experiences have taught me about life in general. At this point in my writing journey, I am most interested in learning how to make writing a lifelong career."),
(6,  "2020-12-19 15:10", "2020-12-01 15:10", "https://avatars.dicebear.com/api/avataaars/a6.svg",  "founders", "Ansh Corrigan",     "We are making a web app to help people decorate their empty spaces." || char(10) || char(10) || "I would like to engage with engineers with background in 3D graphics and animation, and business gurus with expertise in establishing partnership with companies as part of our go-to-market strategy."),
(7,  "2020-12-20 11:46", "2020-12-01 11:46", "https://avatars.dicebear.com/api/avataaars/a7.svg",  "angels",   "Geoffrey Pineda",   "Built enterprise startups in the past. Ex facebook. Named AI entrepreneur of the year by venturebeat. Also angel investor in many including notion."),
(8,  "2020-12-24 16:24", "2020-12-01 16:24", "https://avatars.dicebear.com/api/avataaars/a8.svg",  "writers",  "Bret York",         "writer, strategist, advisor, MBA, father, culinary arts enthusiast"),
(9,  "2020-12-24 11:53", "2020-12-01 11:53", "https://avatars.dicebear.com/api/avataaars/a9.svg",  "writers",  "Zahraa Broadhurst", "Hi there! I’m currently work in brand building @ Facebook. I have a background in finance and community building for startups I write about culture, social norms, and psychology frameworks."),
(10, "2021-01-05 15:18", "2021-01-01 15:18", "https://avatars.dicebear.com/api/avataaars/a10.svg", "angels",   "Arnold Little",     "Previously, I was the founder and CTO of Fusion Reality, an AR startup acquired by Niantic. Prior to that I built and led the data science team for Knowledgedeck, a cloud knowledge platform that was sold to Verizon Labs. I studied engineering at Carnegie Mellon University with a focus on machine learning and computer vision."),
(11, "2021-01-07 11:48", "2021-01-01 11:48", "https://avatars.dicebear.com/api/avataaars/a11.svg", "founders", "Cai Burris",        "I'm working on Datascape - customer success platform for hyper growth startups" || char(10) || char(10) || "Previously I led machine learning at Brainorama (YC S12) where I was an early engineer and scaled the company from 15 to 200. Prior to that I worked on games at Smart Abstract. "),
(12, "2021-01-07 10:16", "2021-01-01 10:16", "https://avatars.dicebear.com/api/avataaars/a12.svg", "angels",   "Sidra Nicholls",    ""),
(13, "2021-01-08 19:49", "2021-01-01 19:49", "https://avatars.dicebear.com/api/avataaars/a13.svg", "founders", "Arlene Watt",       "Serial entrepreneur. I come from an Engineering, Product Management, and Management Consulting background. I have a Master of Engineering Management degree from Dartmouth College. Launched Nomad Hut - a workplace and accelerator for top freelancers and independent professionals."),
(14, "2021-01-10 12:45", "2021-01-01 12:45", "https://avatars.dicebear.com/api/avataaars/a14.svg", "writers",  "Devon Mccoy",       "I write a long-form newsletter that covers hardware engineering, science, my thoughts on current events, the advice I am applying, and experiments I am running." || char(10) || char(10) || "HW engineer at Apple"),
(15, "2021-01-15 13:48", "2021-01-01 13:48", "https://avatars.dicebear.com/api/avataaars/a15.svg", "angels",   "Katelin Marks",     "I make stuff and help others do the same. Lifelong learner, operator/investor, VC, educator, data scientist, photographer and maker of cocktails. Researching responsible AI/ML and building strong, inclusive entrepreneurial ecosystems"),
(16, "2021-01-15 13:38", "2021-01-01 13:38", "https://avatars.dicebear.com/api/avataaars/a16.svg", "angels",   "Gemma Arellano",    ""),
(17, "2021-01-17 19:48", "2021-01-01 19:48", "https://avatars.dicebear.com/api/avataaars/a17.svg", "angels",   "Mikaela Macgregor", "I am the CEO & Co-Founder of Supportgenics. We build AI for customer support teams." || char(10) || char(10) || "Prior to Supportgenics, I built products and infrastructure at Google and Dropbox." || char(10) || char(10) || "My background is in Software Engineering and AI, and I love everything including Marketing, Fundraising, Sales, and People Operations."),
(18, "2021-01-20 19:12", "2021-01-01 19:12", "https://avatars.dicebear.com/api/avataaars/a18.svg", "founders", "Amayah Jaramillo",  "I'm currently a Product Manager at QuantumBrain, where I'm building the foundation to make quantum computers accessible via the cloud, bridging the gap between artificial intelligence and quantum computing, and serving as an advocate for women in STEM. Previously, I served as Product Manager at IBM Watson, focused on all things AI and AR/VR."),
(19, "2021-01-20 15:22", "2021-01-01 15:22", "https://avatars.dicebear.com/api/avataaars/a19.svg", "angels",   "Tea Shannon",       "I recently co-founded an NPO in response to COVID-19, which gives 100% fund raised to local restaurants and connects them with people in need of food, like healthcare workers, seniors, and families with special needs.  We raised $130K+, and have delivered ~7K meals so far. I'm building a data platform that connects people's data on smartphones with AI companies that need high-quality data."),
(20, "2021-01-22 19:30", "2021-01-01 19:30", "https://avatars.dicebear.com/api/avataaars/a20.svg", "writers",  "Selina Peel",       "Currently working at IBM as a Data & AI Sales Engineer. Freelance copywriting for a handful of interesting companies. Interested in AI/ML, Bitcoin, digital content, investing, and startups."),
(21, "2021-01-25 10:17", "2021-01-01 10:17", "https://avatars.dicebear.com/api/avataaars/a21.svg", "founders", "Parris Short",      ""),
(22, "2021-01-29 10:39", "2021-01-01 10:39", "https://avatars.dicebear.com/api/avataaars/a22.svg", "writers",  "Harvie Drummond",   "Creator & Writer at Urbane."),
(23, "2021-02-01 12:45", "2021-02-04 12:45", "https://avatars.dicebear.com/api/avataaars/a23.svg", "founders", "Ho Samuels",        ""),
(24, "2021-02-05 14:04", "2021-02-05 14:04", "https://avatars.dicebear.com/api/avataaars/a24.svg", "founders", "Raees Carver",      "I think building is fun. Thanks to no-code, I've built over a dozen projects in 2020. I'm on the lookout for a cofounder to build something amazing (see interests below). In the meanwhile, I'm advising founders on how to get from 0-1 with no-code approach."),
(25, "2021-02-10 12:29", "2021-02-10 12:29", "https://avatars.dicebear.com/api/avataaars/a25.svg", "angels",   "Ruby-Mae Middleton","I recently spent 3 years on the investment team at Andreessen Horowitz focused on the Consumer sector. " || char(10) || char(10) || "I'm interested in companies that are enabling individuals to make a living from their unique audiences." || char(10) || char(10) || "I am an active angel investor! HMU if you want: fundraising advice, product/strategy jams..."),
(26, "2021-02-12 15:57", "2021-02-12 15:57", "https://avatars.dicebear.com/api/avataaars/a26.svg", "founders", "Kacy Connelly",     ""),
(27, "2021-02-13 17:49", "2021-02-13 17:49", "https://avatars.dicebear.com/api/avataaars/a27.svg", "founders", "Maciej Wilcox",     "Helped build ad markets at Appster for many years (NYC adtech, acquired by Verizon). Now applying that optimization / marketplace background to recruiting / FoW tools." || char(10) || char(10) || "Working on connecting talent to opportunity more efficiently at Talentops."),
(28, "2021-02-13 14:08", "2021-02-13 14:08", "https://avatars.dicebear.com/api/avataaars/a28.svg", "founders", "Kourtney Torres",   ""),
(29, "2021-02-13 11:15", "2021-02-13 11:15", "https://avatars.dicebear.com/api/avataaars/a29.svg", "founders", "Cristiano Molloy",  "Portuguese with an electronics background turned computer scientist turned startup guy. Former CTO of EdTech startup Thinkpad. Used to live in SF, just moved to LA after 5 years in NY."),
(30, "2021-02-13 16:30", "2021-02-13 16:30", "https://avatars.dicebear.com/api/avataaars/a30.svg", "founders", "Subhaan Madden",    "Previously: Product / Design leader in B2B SaaS  (ZenRain, Ringomatic, InstaCoupon). Diverse experience across operational products from CRM to full blown accounting in different markets. " || char(10) || char(10) || "Also interested in future of work, autonomous vehicles, and elder tech. " || char(10) || char(10) || "I love voice / video and plan on doing something with webrtc.");


INSERT INTO projects
(id, created_ts, updated_ts, icon_url, name, description)
VALUES
(1,  "2020-12-20 13:22", "2020-12-20 13:22", "https://avatars.dicebear.com/api/jdenticon/a1.svg",  "Seam", "An API for homes and buildings, with a hardware hub meant to help developers build apps that can do things like unlock doors, summon elevators, etc. from different device vendors. Currently in 5 pilots."),
(2,  "2020-12-23 18:57", "2020-12-23 18:57", "https://avatars.dicebear.com/api/jdenticon/a2.svg",  "Evergreen", "A digital solution for employees to request purchases and track approvals. The B2B business is built for companies with non-centralized purchases and the need to manage a slurry of different tools."),
(3,  "2020-01-10 18:45", "2020-01-10 18:45", "https://avatars.dicebear.com/api/jdenticon/a3.svg",  "Farmako Healthcare", "A million doctors in India still use paper medical records. Farmako aims to help shift them to electronic ones so they can write prescriptions and see patients online easily and keep records centrally."),
(4,  "2021-01-15 15:30", "2021-01-15 15:30", "https://avatars.dicebear.com/api/jdenticon/a4.svg",  "PolyOps", "SaaS business that provides analytics on e-commerce operations including visibility into returns, shipping and customer acquisition expenses. The startup wants to make e-commerce more efficient. PolyOps claims 15 brands are already onboard with a combined $35 million in GMV. As commerce of all sorts changes, PolyOps is trying to make the world a bit easier to grok, which seems like a smart direction to proceed."),
(5,  "2021-01-17 17:26", "2021-01-17 17:26", "https://avatars.dicebear.com/api/jdenticon/a5.svg",  "Adyn", "This startup is building a test to help women in the US determine which method of birth control is the best fit for their bodies in order to minimize side effects. The company says more than 49M US women struggle with birth control side effects. Once users submit their tests, the company gives them recommendations and can connect them with specialists to discuss options."),
(6,  "2021-01-20 19:16", "2021-01-20 19:16", "https://avatars.dicebear.com/api/jdenticon/a6.svg",  "Akiflow", "A command line-style tool for building quick shortcut commands across things like email, Google Drive, Slack, or Asana. Available on Windows/Mac. Currently has 2000 users waitlisted."),
(7,  "2021-01-28 11:49", "2021-01-28 11:49", "https://avatars.dicebear.com/api/jdenticon/a7.svg",  "Inspectify", "A software company that helps real estate agents coordinate inspections for home-sellers. The startup wants to grow into a managed marketplace that serves as a broker for all home services, from repairs to insurance."),
(8,  "2021-02-02 16:40", "2021-02-02 16:40", "https://avatars.dicebear.com/api/jdenticon/a8.svg",  "Bikayi", "Shopify isn’t a good match for consumers in the Indian market because of consumer habits that differ from those of the US (for instance, many purchases are made through WhatsApp rather than the web.) The founders started Bikayi after seeing family businesses using pen and paper to handle incoming orders online. They charge merchants $100 per year."),
(9,  "2021-02-08 15:30", "2021-02-08 15:30", "https://avatars.dicebear.com/api/jdenticon/a9.svg",  "Atomic", "A software company that provides a fintech API allowing other platforms to integrate investment accounts into their product, easily. Many modern fintech services allow you to hold cash, like Venmo and Apple Pay. That money could be, instead, invested. Atomic has found some initial traction, with a few companies signed up that give it around $300M in AUM, providing the startup with $1.5M in ARR. After every fintech added checking accounts, perhaps investments accounts are the next step."),
(10, "2021-02-13 14:58", "2021-02-13 14:58", "https://avatars.dicebear.com/api/jdenticon/a10.svg", "Blue Onion Labs", "This financial services startup is helping companies make sense of financial transaction data that lives across multiple systems. Their suite of API integrations are aiming to solve a big pain point for accounting teams, serving as a “single source of truth” for understanding the full scope of incoming transactions.");

INSERT INTO user_projects 
(user_id, project_id)
VALUES
(1,  1),
(4,  2),
(6,  2),
(11, 3),
(13, 4),
(11, 5),
(18, 6),
(21, 7),
(23, 8),
(24, 9),
(26, 10),
(27, 10);

INSERT INTO announcements
(id, created_ts, updated_ts, fellowship, title, body)
VALUES
(
  1,
  "2020-12-24 13:02",
  "2020-12-24 13:02",
  "all",
  "Happy Holidays, from the On Deck Team",
  "Amidst this crazy 2020, this community has been a beacon of hope that there is a bright future ahead. We’re so grateful you made the choice to join this community." || char(10) || char(10) || "We hope you all are able to spend some time with loved ones – either virtually, or in-person if safe – and enjoy a few days off."
),
(
  2,
  "2021-01-13 11:49",
  "2021-01-13 11:49",
  "writers",
  "Semi-Annual Throckmorton Day",
  "What is Throckmorton Day, you ask? All will be revealed in time—we’re intentionally keeping it vague for now—but high level, it’ll be a wild day-long write-a-thon with “celebrity” judges, fabulous prizes, and hijinks galore, open to current Fellows and alums." || char(10) || char(10) || "Save the date if you can!"
),
(
  3,
  "2021-01-26 16:54",
  "2021-01-26 16:54",
  "all",
  "Announcing: February 2021 Global Build Weekend!",
  "On Deck Build Weekend across ALL PROGRAMS and ALL COHORTS. Unlike other On Deck events, you must sign up to participate in Build Weekend. Please note: you do not need to have a project idea or a team to sign up!"
),
(
  4,
  "2021-02-11 15:45",
  "2021-02-11 15:45",
  "founders",
  "Workshop: Understanding the back-office necessities around a fundraise",
  "So you've just raised or are about to...what next? Join Nate to learn about the things most people don't tell you in setting up your business: insurance, HR, payroll, accounting, PR, IT, benefits, and much more."
),
(
  5,
  "2021-02-14 17:22",
  "2021-02-14 17:22",
  "all",
  "Get ready for Global Build Weekend Pitches next Sunday, 2/21 🌐🛠!",
  "While registration has **closed**, if you've not signed up yet, you're invited to join Build Weekend pitches on Sunday, 2/21! GBW is our flagship cross-fellowship event, bringing together 300+ fellows across 7+ programs for a weekend of tinkering." || char(10) || char(10) || "If you've already registered, hang tight for more information!"
);
