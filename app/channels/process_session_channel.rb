# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class ProcessSessionChannel < ApplicationCable::Channel
  def subscribed
      puts "\n\n\nSUBSCRIBED!!!\n\n\n\n"
    stream_from "smartperson_#{uuid}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def upload_start()
      ProcessSessionChannel.upload_start(uuid)
  end
end
