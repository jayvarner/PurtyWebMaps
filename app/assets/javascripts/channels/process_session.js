App.process_session = App.cable.subscriptions.create("ProcessSessionChannel", {

    connected: function(data) {
        console.log(data);
    },
    received: function(data) {
        if (data.action === 'start'){
            $('#session_uuid').val('smartperson_' + data.msg);
            return this.printMessage(data.msg);
        }
        else if (data.action === "upload_start") {
            alert(data.action + " " + data.msg);
            return this.printMessage(data.msg);
        }

    },
    printMessage: function(message) {
        return $("#messages").append("<p>" + message + "</p>");
    }
});
