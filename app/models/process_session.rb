class ProcessSession
    def self.start(uuid)
        puts "\n\n\nblah\n\n#{uuid}\n\n\n\n\n"
        ActionCable.server.broadcast uuid, {
            action: "start", msg: uuid
        }
        sleep(10)
        puts "what"
        ActionCable.server.broadcast uuid, {
            action: "start", msg: uuid
        }
    end

    def self.upload_start(uuid)
        puts "\n\n\n\n\ngot here with #{uuid}\n\n\n\n\n"
        ActionCable.server.broadcast "#{uuid}", {
            action: "upload_start", msg: "fuckin' eh"
        }
    end
end
