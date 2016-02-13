# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class ProcessSessionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "smartperson_#{uuid}"
    ProcessSession.start(uuid)
  end

  def unsubscribed
    puts "bye"
  end

  def upload_start(uuid)
      ProcessSession.upload_start(uuid)
  end
end
