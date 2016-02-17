module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :uuid


    def connect
        # cookies.signed.each do |key, value|
        #     puts "Cookies!!! #{key}:#{value}"
        # end
      self.uuid = SecureRandom.uuid
    #   cookies[:user_name] = self.uuid
    end

    # Reconnect
    # def connect
    #   self.uuid = find_verified_uuid
    # end
    # protected
    #   def find_verified_uuid
    #     if cookies[:pwm_uuid]
    #       cookies[:pwm_uuid]
    #     else
    #         puts "\n\nfoo\n\n\n#{cookies[0]}\n\n\n\n\n\n"
    #         new_uuid = SecureRandom.uuid
    #         cookies[:pwm_uuid] = new_uuid
    #       new_uuid
    #     end
    #   end

  end
end
