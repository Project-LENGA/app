import Peer from 'skyway-js';
import $ from 'jquery';
import ActionCable from 'actioncable';

import { VideoChat } from "./VideoChat.js";

export const initVideoChat = ({
  skywayApiKey,
  lessonId
}) => {
  if (prompt('enter password') !== 'lenga-dev') return

  let localStream;

  navigator.mediaDevices.getUserMedia({video: true, audio: true})
    .then(function (stream) {
      localStream = stream;
      const videoChat = new VideoChat({
        key: skywayApiKey,
        debug: 3,
        lessonId: lessonId,
        localStream: localStream,
        myVideoElement: document.querySelector('#my-video'),
        partnerVideoElement: document.querySelector('#partner-video'),
      });
    })
    .catch(function (error) {
        console.error('mediaDevice.getUserMedia() error:', error);
        return Promise.reject(false);
    });

  // Need to clean up when turbolinks makes page refresh.
  // Should remove video and audio media
  document.addEventListener("turbolinks:click", function(){
    const tracks = localStream.getTracks();
    tracks.forEach(t => t.stop());
  });
}
