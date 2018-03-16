require 'rails_helper'

describe "order_by_deadline" do
  before { visit tasks_path }

  subject { page }

  context "締め切り日順でソートした時に日付が新しい順に並ぶかどうか" do
    before(:each) do
      create(:task, id: 1, content: "task 1", deadline: Time.current)
      create(:task, id: 2, content: "task 2", deadline: Time.current - 1.days)
    end

    example "taskをdeadlineの降順で並び替える" do
      click_on '締め切り日順'
      expect(all('form')[1].find("input[value='task 2']").value).to eq "task 2"
      expect(all('form')[2].find("input[value='task 1']").value).to eq "task 1"
    end
  end
end
