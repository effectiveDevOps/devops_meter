# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.create([
  { category_id: 1,
    ja_desc: '私のチームは心理的安全性が高く、何かミスやトラブルがあっても特定の個人を非難しない。それを学習の機会と捉えて再発防止のための仕組みづくりについてはなし合う文化がある',
    en_desc: 'My team is psychologically safe and doesn\'t blame certain individuals for any mistakes or problems. Also we have a culture that we consider such mistakes or problems as opportunities for learning and discuss how to prevent recurrence.',
    inverse_flag: false },
  { category_id: 1,
    ja_desc: '私は、メンバーの国籍、経歴、考え方、価値観などが多様であることは意見や仕事に向き合う姿勢の相違や対立を生み出すので、効果的にコラボレーションし価値の高い成果を出すことは難しいと考えている。',
    en_desc: 'I think that it is difficult to effectively collaborate and produce high-value results with the diversity of nationalities, backgrounds, ideas, values, etc. of members because it creates conflicts of opinion and differences in attitudes toward work.',
    inverse_flag: true },
  { category_id: 1,
    ja_desc: '私は、人のスキルや性質は生まれつきのもので変わらないと考える固定思考より、努力すればいつでも変わることができると考える成長思考を重視し、実践している。',
    en_desc: 'I emphasize and practice "Growth Mindset" that people can change at any time rather than "Fixed Mindset" that human skills and nature are inherently invariant.'
    inverse_flag: false },
  { category_id: 1,
    ja_desc: '私は、自分には自分の考え方があるが、他人にはそれぞれの経験やスキル、コンテキストから生まれた別の考え方があることを認め、受け入れて、建設的な議論が日々できている。',
    en_desc: 'I admit that I have my own way of thinking, but others have different ways of thinking that come from their experiences, skills, and context. And we always have productive discussion based on that.',
    inverse_flag: false },
  { category_id: 1,
    ja_desc: '私のチームはだれが長期休暇をとっても問題ないようオペレーションや情報を属人化せず、チームみんなで共有している。',
    en_desc: 'My team doesn\'t personalize operations and information and share it with everyone. So, everyone can take a long vacation.',
    inverse_flag: false },
  { category_id: 2,
    ja_desc: '私のチームは、自分たちの専門領域だけでなく一緒に協業している他の職種の人たちの専門領域のことも必要に応じて理解することを、よりよい成果を生むために大切だと考えて、そのために時間を使っている。',
    en_desc: 'Our team members consider it important to understand not only their own area, but also the areas of expertise of other occupations working together in order to produce better results. And spend time for that.',
    inverse_flag: false },
  { category_id: 2,
    ja_desc: '私のチームは、チームのメンバーがどんなバックグラウンド、経験、技術、知識を持っているか、またその人となりをお互いに知っている。',
    en_desc: 'Our team members know what background, experience, skills and knowledge the team members have. And each of us knows personality of the others.',
    inverse_flag: false },
  { category_id: 2,
    ja_desc: '私たちのチームは、Slack や Microsoft Teams にパブリックなチャンネルがあって気軽に質問する事ができるし、複数の人が回答を返してくれるので、チームをまたいだコミュニケーションのコストが低い。',
    en_desc: 'Our team has a public channel on Slack or Microsoft Teams, so we can ask questions casually, and multiple people will respond, so the cost of cross-team communication is low.',
    inverse_flag: false },
  { category_id: 2,
    ja_desc: '私のチームは、他の協業するチームへ依頼をするときにただ一方的に依頼を投げるだけでなく、目的や背景を共有し、時には忌憚のない意見を交換し相談しながら進めている。',
    en_desc: 'Our team members not only send out requests unilaterally when making requests to other collaborating teams, but also share objectives and backgrounds, sometimes exchanging frank opinions and consulting.',
    inverse_flag: false },
  { category_id: 3,
    ja_desc: '世の中で流行っているツールはきっといいものだから積極的に導入すべきだし、チームのプロセスをツールに合わせていくことが、良いチームとプロダクトを生み出すことにつながる。',
    en_desc: 'The tools that are prevalent in the world are surely good and should be actively introduced, in addition, adjusting our team process to the tool will lead to creating good teams and products.',
    inverse_flag: true },
  { category_id: 3,
    ja_desc: 'うちのチームは現在のプロセスとツールが、今のチームのコミュニケーションや生産性にとって有効であり続けているかを確認するために、定期的に振り返り、検証している。',
    en_desc: 'Our team regularly reviews and verifies that current our processes and tools continue to be effective for current team communication and productivity.',
    inverse_flag: false },
  { category_id: 3,
    ja_desc: 'うちのチームは、CI/CDやInfrastructure as a Codeが実践できているのでdevopsを実践できていると言える。',
    en_desc: 'We can say that our team practice devops because we can practice CI / CD and Infrastructure as a Code.',
    inverse_flag: true },
  { category_id: 4,
    ja_desc: 'DevOpsの考えが適用できるのは小さな企業やチームに限られていると思う。',
    en_desc: 'Devops can only  be applied to small company or team.',
    inverse_flag: true },
  { category_id: 4,
    ja_desc: '障害が発生し、中長期的に解決していく必要がある場合、単にBacklogとして起票するだけでなく、対象の複雑度や重要度を元に対策を考えられている。またその負債を回収するためのスケジュールが定期的に作られている。',
    en_desc: 'When a failure which needs to solve in the mid-to-long term occurs, measures are not only rised as backlogs but also based on the complexity and importance. A schedule for recovering the debt is planed regularly.',
    inverse_flag: false },
  { category_id: 4,
    ja_desc: '私のチームは、チーム内の業務を定期的にローテーションしたり明文化して共有しているので、みんながチームの業務を受け持つことができるし、急に誰かが休んでも問題ない。',
    en_desc: 'Our team regularly rotates and clearly writes work in our team. Everyone can take charge of the work and there is no problem if someone suddenly takes a dayoff.',
    inverse_flag: false },
  { category_id: 4,
    ja_desc: '私たちのチームは１０人以下になっており、それ以上人数が増える場合には新しいリーダーとチームによって分割される。また、チーム間には上下関係や情報の秘匿といった問題が存在せず対等であり責任についてもチーム間で共有されている。',
    en_desc: 'Our team has less than 10 members. If it grows more than 10 people, it will be divided by new teams with new leaders.
In addition, there are no problems such as hierarchical relationships or concealment of information between teams.
They are on equal of responsibility.',
    inverse_flag: false },
  { category_id: 5,
    ja_desc: '他のメンバーの代わりに自分が5人いればこのプロダクト、またはプロジェクトは今よりもっとうまく進む。',
    en_desc: 'If I have 5 people of me on behalf of other members, this product or project will go much better than now.',
    inverse_flag: true },
  { category_id: 5,
    ja_desc: '私はスペシャリストとして業務に専念したほうがチームの生産性に寄与できるので、多少の遅刻や雑務は許容されてもいいと思う。',
    en_desc: 'As a specialist, I can contribute to team productivity by devoting myself to work. So I think that some lateness and miscellaneous work may be tolerated.',
    inverse_flag: true },
  { category_id: 5,
    ja_desc: '私一人で解決できることには限界があり、チームメンバーがそれぞれの得意分野でサポートしてくれることで仕事を進めることができている。',
    en_desc: 'There are limits to what I can solve alone. So I have been able to work with team members providing support in their areas of expertise.',
    inverse_flag: false },
  { category_id: 5,
    ja_desc: '私はチーム間の普段の考え方や習慣、ルールについてよく理解をしており、それが形成された背景や歴史についても理解し、明文化して新人にも共有するようにしている。',
    en_desc: '"I have a good understanding of the usual ways of thinking, customs and rules between teams. 
I understand our team history and background. I continue to try write down and share with newcomers."',
    inverse_flag: false }
  ])

Group.create([
  { group_name: 'EcEx/SOK' },
  { group_name: 'EcEx/ReviewVideo' },
  { group_name: 'EcEx/StartUp' },
  { group_name: 'EcEx/Kaizen' },
  { group_name: 'EcEx/Ranking' },
  { group_name: 'C2C/ServiceApplication' },
  { group_name: 'C2C/ServicePlatform' },
  { group_name: 'C2C/ServiceDesign' },
  { group_name: 'C2C/ServicePlanning' },
  { group_name: 'C2C/ServiceInfra' },
  { group_name: 'C2C/DevRelations' },
  { group_name: 'OpenCom/Expansion' },
  { group_name: 'OpenCom/Payment' },
  { group_name: 'Auto/Car' }
  ])

Category.create!([
  { id: 1, ja_desc: 'コラボレーション', en_desc: 'Collaboration' },
  { id: 2, ja_desc: 'アフィニティ', en_desc: 'Affinity' },
  { id: 3, ja_desc: 'ツール', en_desc: 'Tool' },
  { id: 4, ja_desc: 'スケール', en_desc: 'Scaling' },
  { id: 5, ja_desc: '非ロックスター度', en_desc: 'Anti-RockStar' },
])
