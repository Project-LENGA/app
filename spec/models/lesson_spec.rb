require 'rails_helper'

RSpec.describe Lesson, type: :model do
  let!(:lesson) { create(:lesson) }

  describe 'validations' do
    it 'should be valid' do
      expect(lesson).to be_valid
    end

    it 'start_time should be present' do
      lesson.start_time = nil
      p lesson
      expect(lesson).not_to be_valid
    end

    it 'end_time should be present' do
      lesson.end_time = nil
      expect(lesson).not_to be_valid
    end

    it 'lesson_date should be present' do
      lesson.lesson_date = nil
      expect(lesson).not_to be_valid
    end

    it 'should have start_time earlier than end_time' do
      lesson.start_time = Time.now + 1.hour
      lesson.end_time = Time.now
      expect(lesson).not_to be_valid
    end
  end
end
