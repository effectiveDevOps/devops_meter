class DashboardController < ApplicationController
  def index;end
  def api
    render :json => {
      data: Group.all.map do |group|
        scores = {}
        Category.all.map{|e| scores[e.id]= []}
        sd = []
        user_ids = group.users.map(&:id)
        Question.all.each do |question|
          # 各問のフラグを取り除いた得点の配列
          score = question.answers.where( user_id: user_ids ).map do |answer|
            question.inverse_flag ? 100 - answer.value : answer.value
          end
          scores[question.category_id] << score.mean
          sd << score.sd
        end
        {
          name: group.group_name,
          score: ((100-sd.mean) * Category.all.map{ |e| pp scores[e.id].mean }.sum/Category.all.size/100).round(3),
          chartdata: {
            labels: [ "Synchro", *Category.all.map(&:en_desc) ],
            datasets: [
              {
                label: 'グループ平均',
                data: [(100-sd.mean), *Category.all.map{ |e| scores[e.id].mean }]
              }
            ]
          }
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
    return 0 if size-1 <= 0
    m = mean
    reduce(0) { |a,b| a + (b - m) ** 2 } / (size)
  end

  def sd
    Math.sqrt(var)
  end
end
