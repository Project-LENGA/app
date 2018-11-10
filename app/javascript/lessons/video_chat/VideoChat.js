import Peer from 'skyway-js';
import $ from 'jquery';

import { VideoChatChannel } from "./VideoChatChannel.js";

export class VideoChat {
  constructor ({
    key,
    debug,
    lessonId,
    localStream,
    myVideoElement,
    partnerVideoElement,
  }) {
    this.localStream = localStream;
    this.myVideoElement = myVideoElement;
    this.partnerVideoElement = partnerVideoElement;
    this.existingCall = null;

    // Initialize channel
    this.channel = new VideoChatChannel({
      lessonId: lessonId,
      onConnected: this._onChannelConnected,
      onReceived: this._onChannelReceived,
    });

    // Initialize skyway peer
    this.peer = new Peer({
      key: key,
      debug: debug,
    });
    this._addMyVideo(this.localStream);
    this.peer.on('open', this._onPeerOpen);
    this.peer.on('error', this._onPeerError);
    this.peer.on('close', this._onPeerClose);
    this.peer.on('disconnected', this._onPeerDisconnected);
    this.peer.on('call', this._onPeerCall);
  }

  /* -------------------- Instance methods -------------------- */

  /* -------------------- Event handlers -------------------- */
  _onChannelConnected = () => {
    this.channel.joinRoom(this.peer.id);
  }

  _onChannelReceived = (data) => {
    console.log(data);

    switch(data.action) {
      case 'message':
        const message = $('<p></p>').text(data.message);
        break;

      case 'join_room':
        if (this.peer.id !== data.peerId) {
          this._call(data.peerId);
        }
        break;

      case 'warn':
        console.warn(data.message);
        break;

      default:
        return;
    }
  }

  _onPeerOpen = () => {
    return;
  }

  _onPeerError = (error) => {
    console.error(error);
  }

  _onPeerClose = () => {
    return;
  }

  _onPeerDisconnected = () => {
    return;
  }

  _onPeerCall = (call) => {
    call.answer(this.localStream);
    this._setupCallEventHandlers(call);
  }


  /* -------------------- Private methods -------------------- */
  _call (partnerPeerId) {
    const call = this.peer.call(partnerPeerId, this.localStream);
    this._setupCallEventHandlers(call);
  }

  _close () {
    this.existingCall.close();
  }

  _setupCallEventHandlers = (call) => {
    if (this.existingCall) this.existingCall.close();

    this.existingCall = call;

    this.existingCall.on('stream', stream => {
      this._addPartnerVideo(stream);
    });

    this.existingCall.on('close', () => {
      this._removePartnerVideo();
    });
  }

  _addMyVideo = (stream) => {
    this.myVideoElement.srcObject = stream;
  }

  _addPartnerVideo = (stream) => {
    this.partnerVideoElement.srcObject = stream;
  }

  _removePartnerVideo = () => {
    this.partnerVideoElement.srcObject = undefined;
  }
}
