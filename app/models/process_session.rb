class ProcessSession
    def self.start(uuid)
        ActionCable.server.broadcast "smartperson_#{uuid}", {
            action: "process_session_start", msg: "Uploading file(s) and you are#{uuid}"
        }
    end

    def self.upload_start(uuid)
        puts "got here"
        ActionCable.server.broadcast "smartperson_#{uuid}", {action: "upload_start", msg: 'that worked?'}
    end
end
