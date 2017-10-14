require "spec_helper"

describe GuessWho::Profiler do
  it "should generate a guess for the name from an email with 1 word" do
    profiler = GuessWho::Profiler.profile!("johndoe@gmail.com")

    profiler.full_name.should == "John Doe"
    profiler.email.should == "johndoe@gmail.com"
  end

  # it "should generate a guess for the name from an email with a delimiter" do
  #   profiler = GuessWho::Profiler.profile!("john.doe@gmail.com")
  #
  #   profiler.full_name.should == "John Doe"
  #   profiler.email.should == "john.doe@gmail.com"
  # end
end
