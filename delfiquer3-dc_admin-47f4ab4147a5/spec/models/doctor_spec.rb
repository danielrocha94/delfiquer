require 'rails_helper'

describe Doctor, type: :model do
  it { is_expected.to have_many :patients }
end
