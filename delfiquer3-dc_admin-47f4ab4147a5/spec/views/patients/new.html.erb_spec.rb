require 'rails_helper'

RSpec.describe "patients/new", type: :view do
  before(:each) do
    assign(:patient, Patient.new(
      :name => "MyString",
      :adress => "MyString",
      :age => 1
    ))
  end

  it "renders new patient form" do
    render

    assert_select "form[action=?][method=?]", patients_path, "post" do

      assert_select "input#patient_name[name=?]", "patient[name]"

      assert_select "input#patient_adress[name=?]", "patient[adress]"

      assert_select "input#patient_age[name=?]", "patient[age]"
    end
  end
end
