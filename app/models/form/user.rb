class Form::User < User
  REGISTRABLE_ATTRIBUTES = %i(nickname employee_number group_id)
  has_many :answers, class_name: 'Form::Answer'

  after_initialize { answers.build unless self.persisted? || answers.present? }

  def selectable_group
    Group.all
  end
end
