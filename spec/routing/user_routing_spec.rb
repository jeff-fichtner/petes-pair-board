require "rails_helper"

RSpec.describe "User routing", :type => :routing do

  it "routes GET /users/1 to student page" do
    expect(:get => "/users/1/student").to route_to("users#student", :user_id => "1")
  end
  it "routes GET /users/1 to mentor page" do
    expect(:get => "/users/1/mentor").to route_to("users#mentor", :user_id => "1")
  end
  it "routes GET /users/new to users#new" do
    expect(:get => "/users/new").to route_to("users#new")
  end
  it "routes POST /users to users#create"  do
    expect(:post => "/users").to route_to("users#create")
  end
  it "routes GET /users/1/edit to users#edit" do
    expect(:get => "/users/1/edit").to route_to("users#edit", :id => "1")
  end
  it "routes PUT /users/1 to users#update" do
    expect(:put => "/users/1").to route_to("users#update", :id => "1")
  end
  it "routes DELETE /users/1 to users#destroy" do
    expect(:delete => "/users/1").to route_to("users#destroy", :id => "1")
  end

end
