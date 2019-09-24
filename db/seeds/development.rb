# frozen_string_literal: true

Category.create!([
                     {id: 1, ja_desc: 'コラボレーション', en_desc: 'Collaboration'},
                     {id: 2, ja_desc: 'アフィニティ', en_desc: 'Affinity'},
                     {id: 3, ja_desc: 'ツール', en_desc: 'Tool'},
                     {id: 4, ja_desc: 'スケール', en_desc: 'Scaling'},
                     {id: 5, ja_desc: '非ロックスター度', en_desc: 'Anti-RockStar'},
                 ])

Question.create!([
                     {id: 1, category_id: 1, ja_desc: '私のチームは心理的安全性が高く、何かミスやトラブルがあっても特定の個人を非難しない。それを学習の機会ととらえて、再発防止のための仕組み作りについて話し合う文化がある。', en_desc: 'Is this a Pen?', inverse_flag: 0},
                     {id: 2, category_id: 1, ja_desc: '私は、メンバーの国籍、経歴、考え方、価値観などが多様であることは意見や仕事に向き合う姿勢の相違や対立を生み出すので、効果的にコラボレーションし価値の高い成果を出すことは難しいと考えている', en_desc: 'BBB ?', inverse_flag: 1},
                     {id: 3, category_id: 1, ja_desc: '私は、人のスキルや性質は生まれつきのもので変わらないと考える固定思考より、努力すればいつでも変わることができると考える成長思考を重視し、実践している。', en_desc: 'CCC ?', inverse_flag: 0},
                     {id: 4, category_id: 1, ja_desc: '私は、自分には自分の考え方があるが、他人にはそれぞれの経験やスキル、コンテキストから生まれた別の考え方があることを認め、受け入れて、建設的な議論が日々できている。', en_desc: 'DDD ?', inverse_flag: 0},
                     {id: 5, category_id: 1, ja_desc: '私のチームはだれが長期休暇をとっても問題ないようオペレーションや情報を属人化せず、チームみんなで共有している。', en_desc: 'FFF ?', inverse_flag: 0},
                     {id: 6, category_id: 2, ja_desc: 'あああ？', en_desc: 'AAA ?', inverse_flag: 0},
                     {id: 7, category_id: 2, ja_desc: 'あああ？', en_desc: 'AAA ?', inverse_flag: 0},
                     {id: 8, category_id: 2, ja_desc: 'あああ？', en_desc: 'AAA ?', inverse_flag: 0},
                     {id: 9, category_id: 2, ja_desc: 'あああ？', en_desc: 'AAA ?', inverse_flag: 1},
                     {id: 10, category_id: 3, ja_desc: 'あああ？', en_desc: 'AAA ?', inverse_flag: 0},
                     {id: 11, category_id: 3, ja_desc: 'あああ？', en_desc: 'AAA ?', inverse_flag: 0},
                     {id: 12, category_id: 3, ja_desc: 'あああ？', en_desc: 'AAA ?', inverse_flag: 0},
                     {id: 13, category_id: 3, ja_desc: 'あああ？', en_desc: 'AAA ?', inverse_flag: 1},
                     {id: 14, category_id: 4, ja_desc: 'あああ？', en_desc: 'AAA ?', inverse_flag: 0},
                     {id: 15, category_id: 4, ja_desc: 'あああ？', en_desc: 'AAA ?', inverse_flag: 0},
                     {id: 16, category_id: 4, ja_desc: 'あああ？', en_desc: 'AAA ?', inverse_flag: 0},
                     {id: 17, category_id: 4, ja_desc: 'あああ？', en_desc: 'AAA ?', inverse_flag: 1},
                     {id: 18, category_id: 5, ja_desc: 'あああ？', en_desc: 'AAA ?', inverse_flag: 1},
                     {id: 19, category_id: 5, ja_desc: 'あああ？', en_desc: 'AAA ?', inverse_flag: 1},
                     {id: 20, category_id: 5, ja_desc: 'あああ？', en_desc: 'AAA ?', inverse_flag: 1},
                 ])

5.times do |i|
  Group.create!(
      id: i + 1,
      group_name: "#{i + 1} Group",
  )
end

50.times do |i|
  user = User.create!(
      id: i + 1,
      nickname: "NickName#{i + 1}",
      employee_number: "10000#{i + 1}",
      group_id: Random.rand(1..5),
  )
  20.times do |j|
    user.answers.create!(
                    question_id: j + 1,
                    user_id: user.id,
                    value: Random.rand(0..100),
    )
  end
end
