import { scroll_bottom } from "../application";
import consumer from "./consumer";

consumer.subscriptions.create("ChatroomChannel", {
	connected() {
		// Called when the subscription is ready for use on the server
	},

	disconnected() {
		// Called when the subscription has been terminated by the server
	},

	received(data) {
		// Called when there's incoming data on the websocket for this channel
		document.getElementById("chatroom-container").innerHTML += data.message_body
		scroll_bottom()
	},
});
