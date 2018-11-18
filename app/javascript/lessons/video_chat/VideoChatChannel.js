import ActionCable from 'actioncable';
import $ from 'jquery';

export class VideoChatChannel {
  constructor ({
    lessonId,
    onConnected = f => f,
    onDisconnected = f => f,
    onReceived = f => f,
  }) {
    this.cable = ActionCable.createConsumer();
    this.channel = this.cable.subscriptions.create({
      channel: 'VideoChatChannel',
      lesson_id: lessonId,
    }, {
      connected: this._onConnected,
      disconnected: this._onDisconnected,
      received: this._onReceived,
    });

    this.onConnected = onConnected;
    this.onDisconnected = onDisconnected;
    this.onReceived = onReceived;
  }

  /* -------------------- Instance methods -------------------- */
  joinRoom = (peerId) => {
    this.channel.perform('join_room', { peer_id: peerId });
  }

  /* -------------------- Event handlers -------------------- */
  _onConnected = () => {
    console.log('connected');
    this.onConnected();
  }

  _onDisconnected = () => {
    console.log('disconnected');
    this.onDisconnected();
  }

  _onReceived = (data) => {
    this.onReceived(data);
  }
}
