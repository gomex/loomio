require 'spec_helper'

describe GroupsTree do
  describe "#depth_first_traversal" do
    let(:user) { stub(:user) }
    let(:groups) { [stub(:group1, subgroups: []),
                    stub(:group2, subgroups: [])] }
    let(:tree) { GroupsTree.for_user(user) }

    it "doesnt yield if user has no groups" do
      user.stub(groups: [])
      tree.count.should == 0
    end

    it "yields user's groups" do
      user.stub(groups: groups)
      traversal = tree.depth_first_traversal
      traversal.next.should == groups[0]
      traversal.next.should == groups[1]
    end

    it "yields user's groups and subgroups" do
      # group1
      # - subgroup
      # group2
      groups[0].stub(subgroups: [stub(:subgroup)])
      user.stub(groups: groups)
      traversal = tree.depth_first_traversal
      traversal.next.should == groups[0]
      traversal.next.should == groups[0].subgroups[0]
      traversal.next.should == groups[1]
    end

    it "does not yield subgroups that the user does not belong to"
  end
end
