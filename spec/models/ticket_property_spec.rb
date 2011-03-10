require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TicketProperty do

  describe 'an instance' do
    let(:ticket_property){ TicketProperty.find(1) }

    it "should have and belong to many tickets" do
      ticket_property.should have_and_belong_to_many(:tickets)
    end

    it "should belong to property type" do
      ticket_property.should belong_to(:ticket_property_type)
    end
  end

  describe 'on save' do
    let(:ticket_property){ TicketProperty.find(1) }
    it "should validate presence of type" do
      ticket_property.should validate_presence_of(:ticket_property_type_id)
    end

    it "should validate presence of name" do
      ticket_property.should validate_presence_of(:name).with_message(/minimum is 2 characters/)
    end

    it "should validate uniqueness of name" do
      ticket_property.should validate_uniqueness_of(:name).scoped_to(:ticket_property_type_id)
    end

    it "should validate length of name (2-40 characters)" do
      ticket_property.should ensure_length_of(:name).is_at_most(40).is_at_least(2)
    end
  end

  describe 'on create' do
    let(:ticket_property){ TicketProperty.new }

    it "should assign a rank" do
      ticket_property.valid?
      ticket_property.rank.should == 9999
    end
  end
end
