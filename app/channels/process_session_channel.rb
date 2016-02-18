# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class ProcessSessionChannel < ApplicationCable::Channel
  def subscribed
    stream_from uuid
    puts "subscribed"
    ProcessSession.start(uuid)
  end

  def connect
      stream_from uuid
      puts "conneted"
      ProcessSession.start(uuid)
    end

  def unsubscribed
    puts "bye"
  end

  def upload_start(data)
      puts "uploaded"
      ProcessSession.upload_start(uuid, data)
  end
end
