App.process_session = App.cable.subscriptions.create("ProcessSessionChannel", {

    connected: function(data) {
        // whatever
    },
    received: function(data) {
        alert(data.action + " " + data.msg);
        if (data.action === 'start'){
            $('#session_uuid').val('smartperson_' + data.msg);
        }
        else if (data.action === "upload_start") {
            return this.printMessage(data.msg);
        }

    },
    printMessage: function(message) {
        return $("#messages").append("<p>" + message + "</p>");
    }
});
