import Peer from 'skyway-js';
import $ from 'jquery';
import ActionCable from 'actioncable';

export const initVideoChat = ({
  skywayApiKey,
  lessonId
}) => {
  const cable = ActionCable.createConsumer();
  cable.subscriptions.create({
    channel: 'VideoChatChannel',
    lesson_id: lessonId,
  }, {
    connected: () => {

    },
    disconnected: () => {

    },
    received: data => {
      console.log(data);
      const message = $('<p></p>').text(data.message);
      $('#dev-logs').append(message);
    },
  });

  let localStream = null;
  let peer = null;
  let existingCall = null;

  navigator.mediaDevices.getUserMedia({video: true, audio: true})
      .then(function (stream) {
          $('#my-video').get(0).srcObject = stream;
          localStream = stream;
      }).catch(function (error) {
          console.error('mediaDevice.getUserMedia() error:', error);
          return;
      });

  peer = new Peer({
    key: skywayApiKey,
    debug: 3
  });

  peer.on('open', function(){
      $('#my-id').text(peer.id);
  });

  peer.on('error', function(err){
      alert(err.message);
  });

  peer.on('close', function(){
  });

  peer.on('disconnected', function(){
  });

  $('#make-call').submit(function(e){
      e.preventDefault();
      const call = peer.call($('#callto-id').val(), localStream);
      setupCallEventHandlers(call);
  });

  $('#end-call').click(function(){
      existingCall.close();
  });

  peer.on('call', function(call){
      call.answer(localStream);
      setupCallEventHandlers(call);
  });

  function setupCallEventHandlers(call){
    if (existingCall) {
        existingCall.close();
    };

    existingCall = call;

    call.on('stream', function(stream){
        addVideo(call,stream);
        setupEndCallUI();
        $('#their-id').text(call.remoteId);
    });

    call.on('close', function(){
        removeVideo(call.remoteId);
        setupMakeCallUI();
    });
  };

  function addVideo(call,stream){
      $('#their-video').get(0).srcObject = stream;
  }

  function removeVideo(peerId){
      $('#their-video').get(0).srcObject = undefined;
  }

  function setupMakeCallUI(){
      $('#make-call').show();
      $('#end-call').hide();
  }

  function setupEndCallUI() {
      $('#make-call').hide();
      $('#end-call').show();
  }

  // Need to clean up when turbolinks makes page refresh.
  // Should remove video and audio media
  document.addEventListener("turbolinks:click", function(){
    const tracks = localStream.getTracks();
    tracks.forEach(t => t.stop());
  });
}
