App.process_session = App.cable.subscriptions.create("ProcessSessionChannel", {

    connected: function(data) {
    },
    received: function(data) {
        if (data.action === 'start'){
            $('#session_uuid').val(data.msg);
            return this.printMessage(data.msg);
        }
        else if (data.action === "upload_start") {
            return this.printMessage(data.msg);
        }

    },
    printMessage: function(message) {
        return $("#messages").append("<p>" + message + "</p>");
    }
});
