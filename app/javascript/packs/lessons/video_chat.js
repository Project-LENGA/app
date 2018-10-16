import { initVideoChat } from '../../lessons/video_chat';

const lenga = window.lenga || {};
lenga.videoChat = {
  initVideoChat: initVideoChat,
};
window.lenga = lenga
