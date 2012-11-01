module ProjectsHelper
  def relevant_groups(user)
    user.groups.select {|g| !g.default?}
  end
  
  def relevant_projects(user)
    pro = []
    relevant_groups(user).each do |g|
      pro.push(g.projects);
    end
    pro.flatten!
    pro.uniq
  end
  
  def irrelevant_projects(user)
    user.projects - relevant_projects(user)
  end
  
  
  
end
