module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :uuid


    def connect
        # cookies[:whatever] = "david"
        # puts cookies[:whatever]
        # uuid = SecureRandom.uuid
        # puts "\n\n\n\n\nCOOKEIE!\n#{cookies[:uuid]}\n\n\n\n\n"
        # if cookies[:user_id].nil? or cookies[:user_id] == 0
        #     puts "\n\nnot found\n\n"
        #     uuid = SecureRandom.uuid
        #     cookies[:user_id] = {:value => uuid}
        #     self.uuid  = uuid
        # else
        #     puts "\n\nfound\n\n"
        puts "\n\n\ncookie!\n#{cookies.signed[:user_id]}\n\n\n"
            self.uuid = cookies.signed[:user_id]
        # end
  end
end
end
