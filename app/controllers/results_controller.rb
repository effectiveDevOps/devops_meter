class ResultsController < ApplicationController
  def show
    @user_id = convert_to_id(params[:token])

    @user = User.find_by(id: @user_id)
    @user_answers = Answer.where(user_id: @user_id)
    @group = Group.find_by(id: @user.group_id)
    @user_results = Hash.new {0}
    @group_results = Hash.new {0}
    @questions = Question.all
    @categories = Category.all

    sum_deviation = 0

    @questions.each do |q|
      # ユーザの回答した値を取得
      value = q.answers.find_by( user_id: @user_id ).value
      user_value = q.inverse_flag ? 100 - value : value

      # ユーザが所属しているグループの値を取得
      group_values = q.answers.where( user_id: @group.users.map(&:id) ).map do |answer|
        q.inverse_flag ? 100 - answer.value : answer.value
      end

      # カテゴリごとに集計する。
      @user_results[q.category_id] += ( user_value / @categories.size )
      @group_results[q.category_id] += ( group_values.average / @categories.size )

      # 偏差の総和
      sum_deviation += (user_value - group_values.average).abs
      @group_member_count = group_values.size
    end

    # ユーザとユーザの所属するグループ平均とのシンクロ度合い（％）
    # TODO 今は表示していない。
    @synchronous_value = 100 - ( sum_deviation / @categories.size )

    # pp @group
    # pp @user
    # pp @user_results
    # pp @group_results
    # pp @synchronous_value
    # pp @user_answers
    # pp @categories
  end

end

class Array
  # 平均
  def average
    inject(:+).to_f / size
  end
  # 分散
  def variance
    a = average
    inject(0.0){|sum,i| sum + (i.to_f - a) ** 2 } / size
  end
  # 標準偏差
  def standard_deviation
    Math.sqrt(variance)
  end
end
