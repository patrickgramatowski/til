# Special case pattern

# Example code

class User
  # some code...
end

# method no. 1
def current_user
  if session[:user_id]
    User.find(session[:user_id]
end

# method no. 2
def greeting
  "Hello, " + current_user ? current_user.name : "guest" + "!"
end

# case no. 3
if current_user
  render_logout_button
else
  render_login_button
end

# case no. 4
if current_user && current_user.has_role?(:admin)
  render_admin_panel
end
    
# case no. 5
if current_user
  @poems = current_user.poems
else
  @poems = Poems.public_pomes
end

# case no. 6
if current_user
  current_user.last_seen = Time.now
end

# Refactored code
# in our case we add GuestUser class (missing link)

class User
  # some code...

  def authenticated?
    true
  end
  
  def has_role?(role)
    true
  end
end

class GuestUser
  def initialize(session)
    @session = session
  end
  
  def name
    "Guest"
  end
  
  def authenticated?
    false
  end
  
  def has_role?(role)
    false
  end
  
  def poems
    Poems.public_pomes
  end

  def last_seen=(time)
    # some code here...
  end
end
    
# method no. 1
def current_user
  if session[:user_id]
    User.find(session[:user_id]
  else
    GuestUser.new(session)
  end
end

# method no. 2
def greeting
  "Hello, #{current_user.name} !"
end

# case no. 3
if current_user.authenticated?
  render_logout_button
else
  render_login_button
end

# case no. 4
if current_user.has_role?(:admin)
  render_admin_panel
end
    
# case no. 5
@poems = current_user.poems

# case no. 6
current_user.last_seen = Time.now

# https://www.rubytapas.com/   
