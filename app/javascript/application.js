// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import "./add_jquery";
import "@doabit/semantic-ui-sass";
import "./channels";

$(".dropdown").dropdown();

$(".message .close").on("click", function () {
	$(this).closest(".message").transition("fade");
});

const chatContainer = document.getElementById("chatroom-container");

export const scroll_bottom = () => {
	if (chatContainer.children.length) {
		chatContainer.scrollTop = chatContainer.scrollHeight;
	}
};

scroll_bottom();

// $("#chat-form").on("keydown", (e) => {
// 	if (e.key == "Enter") {
// 		$("button").trigger("click");
// 	}
// });

// $("#message-submit-btn").on("click", (e) => {
//   $("#chat-input").val("");
// });
