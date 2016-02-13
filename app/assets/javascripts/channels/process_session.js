App.process_session = App.cable.subscriptions.create("ProcessSessionChannel", {

    connected: function() {
        return this.printMessage("Well hello!");
    },
    received: function(data) {

        // var ref, source, target;
        // App.board.position("start");
        // App.board.orientation(data.msg);
        return this.printMessage("Game started! You play as" + data.msg);
    },
    printMessage: function(message) {
        return $("#messages").append("<p>" + message + "</p>");
    }
});
