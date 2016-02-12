App.process_session = App.cable.subscriptions.create("ProcessSessionChannel", {

    connected: function() {
        return this.printMessage("Well hello!");
    },
    received: function(data) {

        // alert('what?');
        // var ref, source, target;
        // App.board.position("start");
        // App.board.orientation(data.msg);
        return this.printMessage("Game started! You play as.");
    },
    printMessage: function(message) {
        return $("#messages").append("<p>" + message + "</p>");
    }
});
