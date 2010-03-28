require File.dirname(__FILE__) + '/spec_helper.rb'

describe "RacerPlugin" do
  before(:each) do
    load_schema
  end
  class Journal < ActiveRecord::Base
  end
  class LedgerAccount < ActiveRecord::Base
  end
  it "should load schema correctly" do
    Journal.should have(:no).records
    LedgerAccount.should have(0).records
  end
end

