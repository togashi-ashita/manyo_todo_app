require 'rails_helper'

RSpec.describe User, type: :model do
  # カラム名を変更したのち、undefined method `email=' for #<User:0x007fd70c530df0>のエラーで弾かれる。
  let(:user) { create(:user) }
  subject { user }

  # factoriesに指定したuserが正常に保存されるかどうか
  it { is_expected.to be_valid }

  describe "email validation" do
    context "invalid address" do
      before { subject.email = 'aaabbbb' }
      it { is_expected.to be_invalid }
    end
  end
end
