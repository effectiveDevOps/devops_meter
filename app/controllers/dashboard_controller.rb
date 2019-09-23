class DashboardController < ApplicationController
  def index
    render :json => {
      data: Group.all.map do |group|
        scores = Hash.new 0
        sd = []
        Question.all.each do |question|
          pp question
          # 各問のフラグを取り除いた得点の配列
          score = question.answers.where( user_id: group.users.map(&:id) ).map do |answer|
            question.inverse_flag ? 100 - answer.value : answer.value
          end
          pp score
          scores[question.category_id] += score.mean
          sd << score.sd
        end
        {
          name: group.group_name,
          score: (100-sd.mean) * scores.sum{|k,v|v}/Category.all.size/100,
          lables: [ "シンクロ度", *Category.all.map(&:ja_desc) ],
          datasets: [
            data: [(100-sd.mean), *Category.all.map{ |e| scores[e.id] } ]
          ]
        }
      end
    }
  end
end

# Array classここで書き換えちゃいますw
class Array
  def mean
    sum.to_f / size
  end

  def var
    m = mean
    reduce(0) { |a,b| a + (b - m) ** 2 } / (size - 1)
  end

  def sd
    Math.sqrt(var)
  end
end
