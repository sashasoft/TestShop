require "rails_helper"

RSpec.describe Product, :type => :model do
  before { @product = Product.new(name: "Chocolate", description: "This is a Chocolate!") }
  subject { @product }
  
  it {should respond_to(:name)}
  it {should respond_to(:description)}
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @product.name = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too short" do
    before { @product.name = "a" * 2 }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @product.name = "a" * 31 }
    it { should_not be_valid }
  end
  
  describe "when name is already taken" do
    before do
      product_with_same_name = @product.dup
      product_with_same_name.name = @product.name.upcase
      product_with_same_name.save
    end
    it { should_not be_valid }
  end
  
  describe "name with mixed case" do
    let(:mixed_case_name) { "FooExAMPle" }

    it "should be saved as all lower-case" do
      @product.name = mixed_case_name
      @product.save
      expect(@product.reload.name).to eq mixed_case_name.downcase
    end
  end
  
end
