class ResultsController < ApplicationController
  def show
    user_id = params[:user_id]

    @user = User.find_by(id: params[:user_id])
    @user_answers = Answer.where(user_id: @user.id)
    @group = Group.find_by(id: @user.group_id)
    @user_results = Hash.new {0}
    @group_results = Hash.new {0}
    sum_deviation = 0

    Question.all.each do |q|
      # ユーザの回答した値を取得
      value = q.answers.find_by( user_id: user_id ).value
      user_value = q.inverse_flag ? 100 - value : value

      # ユーザが所属しているグループの値を取得
      group_values = q.answers.where( user_id: @group.users.map(&:id) ).map do |answer|
        q.inverse_flag ? 100 - answer.value : answer.value
      end

      # カテゴリごとに集計する。
      @user_results[q.category_id] += ( user_value / Category.all.size )
      @group_results[q.category_id] += ( group_values.average / Category.all.size )

      # 偏差の総和
      sum_deviation += (user_value - group_values.average).abs
    end

    # ユーザとユーザの所属するグループ平均とのシンクロ度合い（％）
    # TODO 個人の結果画面にシンクロ度合いって出すのかしら？(計算怪しい)
    @synchronous_value = 100 - ( sum_deviation / Question.all.size )

    pp @group
    pp @user
    pp @user_results
    pp @group_results
    pp @synchronous_value

    pp @user_answers
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