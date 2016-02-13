App.process_session = App.cable.subscriptions.create("ProcessSessionChannel", {

    connected: function() {
        return this.printMessage("Well hello!");
    },
    received: function(data) {
        alert(data.action);
        switch (data.action) {
            case "start":
                return this.printMessage('start');

            case "upload_start":
                return this.printMessage('upload_start');
        }
        // var ref, source, target;
        // App.board.position("start");
        // App.board.orientation(data.msg);

    },
    printMessage: function(message) {
        return $("#messages").append("<p>" + message + "</p>");
    }
});
