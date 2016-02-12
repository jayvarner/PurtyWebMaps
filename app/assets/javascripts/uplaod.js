$(function() {
  // var cfg;
  // cfg = {
  //   onDrop: (function(_this) {
  //     return function(source, target) {
  //       var move;
  //       move = App.chess.move({
  //         from: source,
  //         to: target,
  //         promotion: "q"
  //       });
  //       return App.game.perform("make_move", move);
  //     };
  //   })(this)
  // };
  $( "#target" ).submit(function( event ) {
    //   return App.process_session.start("upload_start", "the fuck");
    App.process_session.perform("upload_start", "the fuck");
  });
});
