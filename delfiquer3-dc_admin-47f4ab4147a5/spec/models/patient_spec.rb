require 'rails_helper'

describe Patient, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :doctor }
end
