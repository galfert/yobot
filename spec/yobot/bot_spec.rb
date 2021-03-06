require 'spec_helper'

describe Yobot::Bot, 'on_message' do
  it "passes the message to all behaviors if it starts with yo" do
    behavior = stub(:behavior)
    room = stub(:room)
    
    behavior.should_receive(:react).with(room, 'ping')
    
    Yobot::Bot.new([behavior]).received_message(room, 'yo ping')
  end
  
  it "does nothing if the messae doesn't start with yo" do
    behavior = stub(:behavior)
    
    behavior.should_not_receive(:react)
    
    Yobot::Bot.new([behavior]).received_message(stub, 'hello')
  end
end
