require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProjectsHelper do

  #Delete this example and add some real ones or delete this file
  it "should be included in the object returned by #helper" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(ProjectsHelper)
  end

  describe "projects index filters" do
    before(:each) do
      @groups = [
        mock_model(Group, :name => "Standard", :default => true),
        mock_model(Group, :name => "Testgroup", :default => false)
        ]
      @user = mock_model(User, :name => "Testuser", :groups => groups)
    end

    it "should provide a list with a users groups that are no default group" do
      relevant_groups(@user).should == [@groups.last]
    end
  end

end
