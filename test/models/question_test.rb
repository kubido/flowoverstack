# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  title      :string(255)      not null
#  body       :text(65535)      not null
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
    @user = users(:diego)
    @question = @user.questions.new(title: "Test", body: "Test")
  end

  test "should be valid" do
    assert @question.valid?
  end

  test "title should be present" do
    @question.title = "   "
    assert_not @question.valid?
  end

  test "body should be present" do
    @question.body = "   "
    assert_not @question.valid?
  end
end
