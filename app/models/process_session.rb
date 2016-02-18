class ProcessSession
    def self.start(uuid)
        ActionCable.server.broadcast uuid, {
            action: "start", msg: uuid
        }
        sleep(5)
        ActionCable.server.broadcast uuid, {
            action: "start", msg: uuid
        }
    end

    def self.upload_start(uuid, data)
        ActionCable.server.broadcast uuid, {
            action: "upload_start", msg: data
        }
    end
end
