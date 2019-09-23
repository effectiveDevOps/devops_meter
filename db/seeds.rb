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
  ])

Group.create([
  { group_name: 'EcEx/Service Operation Kaizen Grp.'}
  ])
