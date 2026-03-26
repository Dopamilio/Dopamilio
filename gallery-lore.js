'use strict';
// Dopamilio Lore Engine v4 — Community character voice, confidence gradient by tier

var RARITY_COLORS = {
  Common:    { hex: '#9CA3AF', rgb: '156,163,175' },
  Uncommon:  { hex: '#4ADE80', rgb: '74,222,128'  },
  Rare:      { hex: '#60A5FA', rgb: '96,165,250'  },
  Epic:      { hex: '#A78BFA', rgb: '167,139,250' },
  Legendary: { hex: '#F59E0B', rgb: '245,158,11'  },
  Mythic:    { hex: '#F43F5E', rgb: '244,63,94'   },
};

function seededRandom(seed) {
  var s = seed | 0;
  return function() {
    s = (Math.imul(s, 1664525) + 1013904223) | 0;
    return (s >>> 0) / 4294967296;
  };
}

// ─── PHRASE TEMPLATES — {t1} and {t2} are trait slots ─────────────────────────
// Confidence gradient: Mythic = untouchable → Common = honest newcomer

// Ranks 1–10 (Mythic): They don't enter the culture. They ARE the culture.
var TPL_MYTHIC_TOP = [
  'my {t1} isn\'t rare. it\'s mine. there\'s a difference.',
  'everything built around {t1} started with someone like me.',
  'the {t2} era? I was already here before it had a name.',
  'I don\'t prove anything. my {t1} does it without being asked.',
  'ask who was first. then look at my {t1}.',
  'nobody talks about {t2} without eventually talking about me.',
  'I didn\'t follow the {t1} culture. I left marks in it.',
  'the chain remembers. so does everyone who saw my {t1}.',
  'my {t2} alone would make most people proud. it\'s not even close to all I have.',
  'I don\'t chase. I wait. {t1} always finds its way back to me.',
];

// Ranks 11–68 (Legendary): Veterans. Earned. Culture-shapers. Unshakeable.
var TPL_LEGENDARY = [
  'two cycles in and my {t1} still turns heads. some things don\'t change.',
  'I was in {t1} before it was worth talking about. now everyone talks about it.',
  'the {t2} wave came and went. I was already anchored before it started.',
  'I don\'t explain my {t1}. the history explains itself.',
  'the {t2} community built itself around people who didn\'t move. I didn\'t move.',
  'I helped shape what {t1} means around here. ask anyone who was there.',
  'two bear markets. same {t1}. same conviction. zero regret.',
  'my {t2} wasn\'t a flex back then. now people call it legendary.',
  'I remember when {t1} was quieter. I preferred it. I stayed anyway.',
  'the {t2} noise never reached me. I was already deep in {t1}.',
  'I\'ve seen the {t1} culture at its lowest. I was the one who didn\'t leave.',
  'earned every bit of this. my {t2} knows what I went through to get here.',
  'the {t1} community found its voice. I was part of that sound from the start.',
  'I watched {t2} trend and fade. I\'m still standing in {t1}.',
  'patience in {t1} is a skill. most people don\'t have it. I do.',
  'the {t2} spotlight hit people around me. I was already positioned before it mattered.',
  'I built my {t1} reputation the slow way. it lasts longer.',
  'not the loudest in {t1}. never needed to be.',
  'the {t2} lesson cost others everything. I learned it early and free.',
  'my {t1} presence was established before most people found the community.',
  'I\'ve been through enough in {t1} to stop being surprised by it.',
  'the {t2} chapter was interesting to watch. {t1} was where I lived.',
  'I didn\'t announce my place in {t1}. I showed up and never left.',
  'two cycles of {t1} and I still care the same. that\'s rare.',
  'the {t2} hype brought people in. conviction in {t1} kept me.',
  'I saw {t2} go up and come down. my {t1} foundation never moved.',
  'old enough in {t1} to know what matters. still here because of that.',
  'I hold my {t2} like I hold my history. carefully and without apology.',
  'the {t1} culture runs through everything I\'ve done here.',
  'I\'ve outlasted three cycles of newcomers in {t1}. none of it surprised me.',
  'the {t2} generation knows my name from {t1} lore. I\'m fine with that.',
  'I gave the {t1} community more than I asked of it. that\'s the balance.',
  'been through the {t2} worst and the {t1} best. I know which one sticks.',
  'the {t1} timestamp is on-chain. so is everything else I\'ve done here.',
  'I don\'t do short-term in {t1}. I never did.',
  'my {t2} speaks to people who understand depth. they always find me.',
  'the {t1} community trusts me because I was there before trust was easy.',
  'I watched {t2} collapse and didn\'t flinch. {t1} was the plan. still is.',
  'legendary in {t1} isn\'t a label. it\'s a timestamp.',
  'I\'ve been in {t1} long enough to be the community itself.',
  'the {t2} storm passed over me. {t1} roots go deep.',
  'my reputation in {t1} was built on consistency. nothing else.',
  'I positioned in {t2} before the narrative. the narrative caught up.',
  'the {t1} community knows who stayed when it was hard. I stayed.',
  'I\'ve outlived every {t2} trend that tried to pull me away from {t1}.',
  'the floor in {t1} is wherever I stand. I haven\'t moved.',
  'I don\'t need recognition in {t1}. the history provides it.',
  'my {t2} is not a conversation starter. it\'s a conversation ender.',
  'three community cycles and my {t1} presence is still the reference point.',
  'the {t1} culture is mine as much as it is anyone\'s. I earned that.',
  'I watched {t2} rise. I watched it correct. I\'m still here in {t1}.',
  'I don\'t rebuild in {t1}. I never needed to.',
  'the {t2} crowd came to find what I\'d already built in {t1}.',
  'my {t1} position wasn\'t a bet. it was a conclusion I reached early.',
  'I held {t2} through the FUD. most didn\'t. that\'s the only difference.',
  'the {t1} signal was clear if you knew what to look for. I did.',
  'I\'ve been in {t1} long enough to stop counting the cycles.',
  'the {t2} moment was someone else\'s peak. {t1} is my home.',
];

// Ranks 69–278 (Epic): Builders. Obsessed. High energy. Always moving.
var TPL_EPIC = [
  'I built a whole framework around {t1}. I barely sleep. it works.',
  'the {t2} edge isn\'t luck. I ran the numbers and ran them again.',
  'people rest. I redesign my {t1} approach.',
  'I\'m three moves ahead in {t2}. that\'s not talent. it\'s obsession.',
  'I don\'t guess {t1} entries. I wait until the setup is obvious. then I move.',
  'my {t2} conviction isn\'t emotional. it\'s structural.',
  'the {t1} thesis took a month to build. it\'s been right since.',
  'I track {t2} so my {t1} contributions stay ahead of the curve.',
  'I don\'t do FOMO in {t1}. I do research. then I act.',
  'high conviction in {t2} means I did the work. I always do the work.',
  'I was building in {t1} before the community knew it needed builders.',
  'the {t2} puzzle has my full attention. so does {t1}.',
  'I moved into {t1} quietly. loud people don\'t get these setups.',
  'the {t2} noise is real. it doesn\'t touch my {t1} focus.',
  'every {t2} correction was a {t1} opportunity. I took every one.',
  'I check {t1} once. then I stop checking and let the system run.',
  'epic in {t2} means not stopping when good enough shows up.',
  'I have a {t1} process and a {t2} process. I follow both relentlessly.',
  'the {t1} framework took two cycles to build. now it runs itself.',
  'I sleep while my {t2} position compounds. that\'s the goal.',
  'I don\'t predict {t1}. I prepare for every outcome. there\'s a difference.',
  'the {t2} move was inevitable. I just got there first.',
  'I was obsessive about {t1} before obsessive was considered a strategy.',
  'I don\'t dabble in {t2}. I go all the way in, every time.',
  'the {t1} community needs people who don\'t slow down. I\'m that.',
  'I\'m not in {t2} to watch it unfold. I\'m in it to make it unfold.',
  'I put the {t1} system together before the community knew it existed.',
  'the {t2} breakthrough came because someone was obsessive enough. that was me.',
  'I joined {t1} and couldn\'t turn it off. still can\'t.',
  'my {t2} obsession keeps the {t1} work sharp. always.',
  'I care about {t1} because the upside is asymmetric. that\'s not luck, it\'s math.',
  'the {t2} signal gave me three days of notice. I used all three.',
  'I don\'t explain my {t1} conviction. the chart will do that eventually.',
  'patience in {t2}, precision in {t1}. that\'s the whole system.',
  'I\'m two problems ahead of the {t1} community. working on three.',
  'I sleep with the {t2} roadmap in my head. wake up and execute.',
  'the {t1} opportunity was obvious to anyone paying close attention. I was paying.',
  'I\'m wired into {t2} at all times. building inside {t1} is the only mode.',
  'builders in {t1} don\'t wait for permission. I never did.',
  'the {t2} thread went viral. I wrote the thing it was based on.',
];

// Ranks 279–698 (Rare): Survivors. Tested. Self-aware. Rebuilt stronger.
var TPL_RARE = [
  'I bought the {t1} top. I\'m still here. that\'s the whole story.',
  'the {t1} dip kept dipping. I held. turns out that was the right call.',
  'my {t2} entry was wrong. my direction was right. net result: here.',
  'I panic sold {t1} once. bought back higher. never again.',
  'the {t1} thesis survived two bad calls and a bear market. so did I.',
  'I was wrong about timing in {t2}. I was right about everything else.',
  'the {t1} move hurt. the recovery helped. I remember both.',
  'rare because I survived {t2} when most didn\'t. simple as that.',
  'my {t1} average entry is not pretty. the current chapter is prettier.',
  'I didn\'t time {t2} perfectly. I survived it. close enough.',
  'I\'ve been wrong in {t1} before. I\'ve been right after. pattern holds.',
  'lost on {t2}, won on {t1}. the wins compound. the losses teach.',
  'I held {t2} through the part where everyone else sold. here we are.',
  'the {t1} recovery wasn\'t fast. I wasn\'t going anywhere.',
  'wrong entry, right direction, enough patience. that\'s {t1} for me.',
  'I\'ve made every {t1} mistake. I don\'t make them twice.',
  'the {t2} exit was ugly. the {t1} re-entry was uglier. the result: fine.',
  'I survived {t1} by doing nothing. sometimes that\'s the move.',
  'rare: not because I was smart. because I didn\'t quit {t2}.',
  'the {t1} thesis broke twice. I fixed it twice. it holds now.',
  'I have a complicated relationship with {t2}. it\'s been productive.',
  'the {t1} mistake made me better at {t2}. expensive lesson. worth it.',
  'I held {t2} past the point of comfort. that\'s where this rank comes from.',
  'my {t1} journey: wrong, right, wrong again, right again. currently right.',
  'the {t2} volatility didn\'t shake me out of {t1}. that\'s something.',
  'I\'ve been through enough {t1} cycles to stop being surprised by them.',
  'the {t2} correction was painful. I used it to lower my average.',
  'irony: my worst {t1} decision led to my best {t1} outcome.',
  'I survived {t2} by having a lower time preference than my emotions.',
  'I don\'t talk about the {t1} drawdown. I talk about what came after.',
  'rare in {t2}: not because I was clever. because I was stubborn correctly.',
  'the {t1} mistake was real. the recovery was realer.',
  'I got burned in {t2} and came back for {t1}. that says everything.',
  'the {t1} community has seen my worst. still here.',
  'I made every mistake possible in {t2}. learned them all in {t1}.',
  'I\'ve been wrecked by {t2} and rebuilt around {t1}. twice.',
  'the {t1} hard times didn\'t break me. I\'m more honest because of them.',
  'I\'ve been through the {t2} chaos. the community knows I\'m still standing.',
  'not perfect in {t1}. not pretending to be. just unbreakable.',
  'I\'ve earned the right to be in {t1} the hard way.',
];

// Ranks 699–1667 (Uncommon): Community members. Genuine. Consistent. No ego.
var TPL_UNCOMMON = [
  'here for {t1}. not overthinking {t2}. just showing up.',
  'I\'m in {t1} and having a genuinely good time. that\'s the whole plan.',
  'the {t1} community has been kind. I\'m here for the long part.',
  'I don\'t stress {t2}. I show up in {t1} and let it be what it is.',
  'good community, good {t1} energy. that\'s all I needed to stay.',
  'I found {t1} and realized this is exactly my kind of place.',
  'not trying to be the loudest in {t2}. just consistently here.',
  'the {t1} culture fits how I move — with curiosity and no pressure.',
  'I vibe with {t2} because it doesn\'t take itself too seriously.',
  'participating in {t1} feels natural. so I keep doing it.',
  'I contribute to {t2} when I can. the community gives more back.',
  'I\'m here because {t2} brought me to {t1} and {t1} kept me.',
  'not the most vocal in {t1}. consistently showing up counts.',
  'the {t1} community has good energy. I protect it by adding to it.',
  'I like {t2} but {t1} is where my people are.',
  'I found my corner of {t1} and it suits me perfectly.',
  'in {t2} because it felt right. still feels right.',
  'the {t1} chaos doesn\'t reach me here. I appreciate that.',
  'I contribute what I can to {t2}. the community amplifies it.',
  'no agenda in {t1}. just genuine participation.',
  'the {t1} community welcomed me before I had anything to offer. offering now.',
  'I spend time in {t2} the way I spend time with good people: consistently.',
  'uncommon means I found {t1} and didn\'t need a reason to leave.',
  'I\'m in {t2} because the people are real and the mission matters.',
  'my {t1} participation is quiet and consistent. that\'s how I roll.',
  'the {t2} community doesn\'t require much. I give more than the minimum.',
  'I found {t1} through {t2} and now I can\'t separate the two.',
  'in {t1} for the culture, the community, and honestly the energy.',
  'the {t2} space moves at a pace I can match while still enjoying it.',
  'I\'m not chasing status in {t1}. I\'m building belonging.',
  'the {t2} threads led me here. the {t1} community made me stay.',
  'I participate in {t1} because it changes me a little each time.',
  'good vibes in {t2}. no need to overcomplicate it.',
  'the {t1} community runs deep. glad to be part of the river.',
  'I bring {t2} energy to {t1}. it seems to fit.',
  'in {t1} because I like what we\'re building together.',
  'the {t2} space has people worth knowing. came for the tech, stayed for them.',
  'I participate in {t1} the way I participate in things I care about: fully.',
  'no performance in {t2}. just me and the community.',
  'the {t1} culture feels earned. I earn my place in it every day.',
  'I don\'t need to be noticed in {t2}. I need to be useful.',
  'I\'m still in {t1}. honestly I\'m not entirely sure why. still in it.',
  'the {t2} plan was to make a plan. maintaining that energy.',
  'holding {t1} with the confidence of someone who hasn\'t doubted once.',
  'the {t2} community runs deeper than I realized on day one. still discovering it.',
];

// Ranks 1668–3333 (Common): Fresh arrivals. Hopeful. Learning. Still figuring it out.
var TPL_COMMON = [
  'still learning {t1}. the {t2} community has been surprisingly kind.',
  'I\'m new to {t1} and still finding my footing. everyone starts somewhere.',
  'the {t2} community seems welcoming. I\'m trying to be worthy of that.',
  'I showed up for {t1} and ended up falling for the whole community.',
  'just getting started in {t2}. there\'s a lot to absorb.',
  'the {t1} learning curve is real. I\'m on it.',
  'I found {t2} first, then {t1}, then I realized I\'d found a home.',
  'still working out my place in {t1}. the community is patient.',
  'I ask a lot of questions about {t2}. people actually answer them.',
  'the {t1} world is bigger than I expected. mapping it slowly.',
  'I refreshed the {t1} chart 47 times today. same result. I\'ll try again.',
  'I bought the {t2} top. I didn\'t know it was the top. now I do.',
  'the {t1} thesis was clear. the execution was less clear. still holding.',
  'I set a {t2} alert at the dip. I bought above the alert. learning.',
  'my {t1} strategy has rough edges. I\'m sanding them down.',
  'I saw the {t2} warning signal. I waited to see if it was real. it was.',
  'I bought {t1} and then it went down. I think about that a lot.',
  'the {t2} floor turns out to be relative. finding out how relative.',
  'I\'m DCA-ing {t1}. the average is improving. slowly.',
  'I checked {t2} during an important meeting. the meeting suffered.',
  'common entry point, uncommon determination. {t1} will know my name.',
  'I\'m the newest version of someone who cares about {t2}.',
  'the {t1} community is deeper than I realized on day one.',
  'I made my first move in {t2}. it\'s a start.',
  'learning the {t1} language so I can contribute more to the community.',
  'I don\'t know much yet. but I know I\'m in the right place.',
  'the {t2} veterans have been generous with knowledge. absorbing it.',
  'my {t1} curiosity brought me here. my commitment will keep me.',
  'I\'m brand new to {t2} and it shows. working on that.',
  'the {t1} community accepted me before I proved myself. proving it now.',
  'I showed up in {t2} not knowing anyone. that\'s changed.',
  'every day in {t1} teaches me something I didn\'t know before.',
  'I\'m here with more hope than experience. that\'s going to change.',
  'still learning what {t2} really means. the depth keeps surprising me.',
  'I joined {t1} and immediately felt like I\'d found the right corner.',
  'my {t2} chapter is just beginning. I\'m taking it seriously.',
  'new here. listening a lot. grateful for the {t1} community\'s patience.',
  'I don\'t pretend to know {t2} better than I do. learning is the only play.',
  'humble in {t1} because I know how much I still have to learn.',
  'the {t2} community is real. I came for {t1} and found the people.',
  'I\'m at the beginning of my {t1} story. it\'s going to be a good one.',
  'just arrived in {t2}. the welcome I got was unexpected and keeps me here.',
  'I\'m figuring out {t1} and {t2} at the same time. steep curve. worth it.',
  'common rank. uncommon commitment to learning {t1}.',
  'the {t2} space is new to me. the people in it are making it home.',
  'I don\'t have the {t1} history yet. I\'m building it, one day at a time.',
  'I found {t2} late. but I found it. that\'s what matters.',
  'I\'m holding from below the floor. I believe in the ceiling.',
  'the {t1} loss is a learning tax. I\'m enrolled in the curriculum.',
  'common entry. uncommon patience. the patience is load-bearing.',
];

// ─── ROLES — community identity by tier ───────────────────────────────────────
var ROLES = {
  Mythic:    ['Protocol Genesis','Culture Architect','The First Signal','Origin Block','The Immutable Reference','Zero Hash. Full Proof.','Genesis Figure','Network Root','The Satoshi Constant','Foundation Layer'],
  Legendary: ['Cycle Veteran','The OG Presence','Culture Shaper','Two-Cycle Survivor','Community Elder','Pre-Hype Builder','The Long Memory','Founding Contributor','Community Cornerstone','Cycle-Hardened','The Quiet Foundation','Community Lore','The Thesis That Held'],
  Epic:      ['Protocol Builder','Ecosystem Architect','The Obsessive Contributor','Innovation Lead','Community Infrastructure','Full-Time Builder','The Relentless One','Core Contributor','Builder in Residence','Roadmap Author','Systems Builder','The Always-On','Precision Builder'],
  Rare:      ['The Comeback','Survivor of the Dip','Battle-Tested','The Rebuilt One','Earned Their Seat','The Resilient','Contrarian Who Stayed','Through the Fire','The Recoverer','Hardened Community Member','Scar-Tissue Pioneer','Wrong Entry. Right Direction.'],
  Uncommon:  ['Community Member','The Consistent Presence','Good-Vibes Contributor','Reliable Participant','Community Connector','Steady Contributor','The Vibe Keeper','Community Backbone','The Low-Drama Member','Participant in Good Standing','The Genuine One'],
  Common:    ['Newcomer','The Curious Arrival','Community Apprentice','Fresh Signal','The Hopeful','New Energy','Just Getting Started','The Eager Learner','First-Cycle Member','Community Seedling','The Bright-Eyed'],
};

// ─── PERSONALITY — tier-aware tone descriptors ────────────────────────────────
var PERSONALITY = {
  Mythic:    ['Untouchable. Absolute.','Origin-level certainty.','Protocol incarnate.','Sovereign. Complete.','Beyond question.','The culture itself.','First. Permanent. Final.','Genesis energy.','Zero doubt. Full presence.','Self-evident. Always.'],
  Legendary: ['Calm. Battle-tested.','OG energy. Still here.','Cycle-hardened. Certain.','Patient. Unshakeable.','Composed. Earned.','Long memory. Strong roots.','Quiet confidence. Deep.','Lived-in certainty.','The steady foundation.','Veterans don\'t panic.'],
  Epic:      ['Obsessive. Always on.','Wired and building.','High output. Low drama.','Relentless contributor.','Builder energy, always.','Never satisfied. Growing.','Intensity as a feature.','Mission-driven. Sharp.','Focused. Caffeinated. Moving.','The always-forward type.'],
  Rare:      ['Earned every scar.','Rebuilt and resilient.','Survived. Stronger now.','Honest about the hard parts.','Unbreakable. Self-aware.','Battle-tested. Still here.','No illusions. No quit.','Scars are credentials.','The comeback is the story.','Gritty. Genuine. Present.'],
  Uncommon:  ['Vibing. Consistent.','Good community energy.','Genuinely here for it.','Low-key. High-value.','Present and participating.','Curious. Comfortable.','No ego. Just contribution.','Steady. Real. Valued.','Community-first mindset.','Reliable good vibes.'],
  Common:    ['Hopeful. Learning.','Earnest and eager.','New energy, full heart.','Still figuring it out.','Curious. Open. Humble.','Learning out loud.','Grateful to be here.','Newcomer with conviction.','Eyes wide. Moving forward.','Fresh start. Real intent.'],
};

// ─── TEMPLATES INDEX ──────────────────────────────────────────────────────────
var ALL_TEMPLATES = {
  Mythic:    TPL_MYTHIC_TOP,
  Legendary: TPL_LEGENDARY,
  Epic:      TPL_EPIC,
  Rare:      TPL_RARE,
  Uncommon:  TPL_UNCOMMON,
  Common:    TPL_COMMON,
};

// Trait priority for selecting t1 and t2 (most distinctive traits first)
var TRAIT_PRIORITY = ['Specials','Classes','Weapons','Hair','Eyes','Cloths','Head gear','Acessories','Background','Mouths','Eye Brows'];

function generateCharacterLore(nft) {
  var id = nft.id;
  var tier = nft.tier;
  var rank = nft.rank;
  var traits = nft.traits || {};

  // Seed based on id+rank for maximum variation
  var seed = (Math.imul(id, 2654435761) ^ Math.imul(rank, 1234567891)) | 0;
  var rng = seededRandom(seed);

  // Select t1 and t2: non-None traits in priority order
  var available = TRAIT_PRIORITY.filter(function(k) { return traits[k] && traits[k] !== 'None'; });
  if (available.length === 0) available = ['Background'];

  var t1idx = Math.floor(rng() * available.length);
  var t1key = available[t1idx];
  var t1 = traits[t1key] || 'this';

  var t2candidates = available.filter(function(k) { return k !== t1key; });
  if (t2candidates.length === 0) t2candidates = TRAIT_PRIORITY.filter(function(k) { return k !== t1key; });
  var t2 = traits[t2candidates[Math.floor(rng() * t2candidates.length)]] || 'that';

  // Template: use rank as primary index (rank is unique 1–3333, guarantees unique phrase per NFT)
  var templates = ALL_TEMPLATES[tier] || ALL_TEMPLATES['Common'];
  var tplIdx = rank % templates.length;
  var template = templates[tplIdx];

  // Interpolate {t1} and {t2} — no rank numbers in phrases
  var phrase = template
    .replace(/\{t1\}/g, t1.toLowerCase())
    .replace(/\{t2\}/g, t2.toLowerCase());

  // Role (tier-aware)
  var rolePool = ROLES[tier] || ROLES['Common'];
  var role = rolePool[Math.floor(rng() * rolePool.length)];

  // satsWallet
  var satsVar = rng();
  var satsWallet;
  if      (tier === 'Mythic')    satsWallet = 21000000;
  else if (tier === 'Legendary') satsWallet = 6900000 + Math.floor(satsVar * 3100000);
  else if (tier === 'Epic')      satsWallet = 1000000 + Math.floor(satsVar * 2000000);
  else if (tier === 'Rare')      satsWallet = 420000  + Math.floor(satsVar * 579999);
  else if (tier === 'Uncommon')  satsWallet = 69000   + Math.floor(satsVar * 350999);
  else                           satsWallet = 1000    + Math.floor(satsVar * 67999);

  // Personality (tier-aware)
  var persPool = PERSONALITY[tier] || PERSONALITY['Common'];
  var personality = persPool[Math.floor(rng() * persPool.length)];

  var color = RARITY_COLORS[tier] || RARITY_COLORS['Common'];
  var animDuration = (tier === 'Legendary' || tier === 'Mythic') ? '5s' : (tier === 'Epic' || tier === 'Rare') ? '4s' : '3s';

  return {
    phrase: phrase,
    role: role,
    satsWallet: satsWallet,
    personality: personality,
    rarityColor: color.hex,
    rarityRgb: color.rgb,
    rarityName: tier.toUpperCase(),
    animDuration: animDuration,
  };
}

window.DopamilioLore = {
  generateCharacterLore: generateCharacterLore,
  RARITY_COLORS: RARITY_COLORS,
};
