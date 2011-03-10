require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounts/activate.html.erb" do
  
  before(:each) do
  end

  def do_render
    render "/accounts/activate"
  end
    
  it "should render the form" do
    do_render
    response.should have_tag('form[action=?]', account_activate_path) do
      with_tag 'input', :type => :submit
    end
  end
  
end

