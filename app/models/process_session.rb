class ProcessSession
    def self.start(uuid)
        puts "\n\n\n\n\n#{uuid}\n\n\n\n\n"
        ActionCable.server.broadcast "smartperson_#{uuid}", {
            action: "start", msg: "We're starting.."
        }
        sleep(5)
        ActionCable.server.broadcast "smartperson_#{uuid}", {
            action: "start", msg: 'Still going'
        }
        sleep(5)
        ActionCable.server.broadcast "smartperson_#{uuid}", {
            action: "start", msg: 'And still doing stuff'
        }
        sleep(5)
        ActionCable.server.broadcast "smartperson_#{uuid}", {
            action: "start", msg: 'All done'
        }
    end

    def self.upload_start(uuid)
        puts "\n\n\n\n\ngot here with smartperson_#{uuid}\n\n\n\n\n"
        ActionCable.server.broadcast "#{uuid}", {
            action: "upload_start", msg: "fuckin' eh"
        }
    end
end
