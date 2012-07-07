require 'spec_helper'

describe SimRoutes do

  before do
    @r = SimRoutes::Builder.build do
      resources :tests
    end
  end

  it "should have routes collection" do
    @r.routes.should_not be_empty
  end

  it "route should meched" do
    @r.match("/tests").should be_true
    @r.match("/tests/1").should be_true
  end

  it "should not match path" do
    @r.match("/test").should_not be_true
  end
  
  it "first test" do
    @r.url_helpers.tests_path.should == "/tests"
  end
end
