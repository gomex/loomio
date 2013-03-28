require 'spec_helper'

describe GroupRequestsController do
  let(:group_request) { build :group_request }
  describe "#new" do
    before do
      GroupRequest.stub(:new => group_request)
      get :new
    end

    it "should assign a GroupRequest object" do
      assigns(:group_request).should eq(group_request)
    end

    it "should successfully render the group request page" do
      response.should be_success
      response.should render_template("new")
    end
  end

  describe "#create" do
    it "should redirect to the confirmation page" do
      put :create, :group_request => group_request.attributes
      response.should redirect_to(group_request_confirmation_url)
    end
  end

  describe "#start_new_group" do
    # context "group_id is passed into the params" do
    #   it "should redirect to the group page" do
    #     group = create(:group)
    #     group_request.group_id = group.id
    #     group_request.save!
    #     GroupRequest.stub(:find).with(group.id).and_return(group_request)
    #     get :start_new_group, group_id: group_request.group_id, token: group_request.token
    #     response.should redirect_to(group_request.group)
    #   end
    # end
  end

  describe "#confirmation" do
    it "should successfully render the confirmation page" do
      get :confirmation
      response.should be_success
      response.should render_template("confirmation")
    end
  end

end
