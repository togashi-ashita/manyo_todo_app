require 'rails_helper'

describe Task, type: :model do
  let(:task) { build(:task) }

  it { is_expected.to validate_presence_of(:content) }

end
