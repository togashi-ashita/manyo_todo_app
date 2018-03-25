require 'rails_helper'

describe "ソート機能" do
  before { visit tasks_path }

  subject { page }

  describe "ソート機能" do
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

  describe "検索機能" do
    context 'contentによる検索' do
      before(:each) do
        create(:task, id: 1, content: "検索に引っかかる")
        create(:task, id: 2, content: "引っかからない")
      end

      example "キーワード「検索」で検索する" do
        pending "他の部分のajaxのテストを書く際になおす。現状はall('form')[0]がnilで動かない"
        find("#search_tasks").set("検索")
        expect(all('form')[0].find("input[value='検索に引っかかる']").value).to eq "検索に引っかかる"
      end
    end
  end

end
