module Sessions
  def login(user = true)
    ApplicationHelper.any_instance.stub(:current_user) { user }
  end
end
