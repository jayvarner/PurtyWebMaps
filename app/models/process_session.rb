class ProcessSession
    def self.start(uuid, foo)
        puts "\n\n\n\n\nblahblahblah\n\n\n\n\n"
        ActionCable.server.broadcast "smartperson_#{uuid}", {
            action: "start", msg: "Uploading file(s) and you are #{uuid}, #{foo}"
        }
    end

    def self.upload_start(uuid, data)
        puts "\n\n\n\n\ngot here\n\n\n\n\n"
        ActionCable.server.broadcast "smartperson_#{uuid}", {
            action: "upload_start", msg: 'fucking eh'
        }
    end
end
