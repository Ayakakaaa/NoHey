import consumer from "./consumer"

$(document).ready( function () {
  consumer.subscriptions.create({
      channel: "ConversationChannel",
      conversation_id: CONVERSATION_ID
    }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received({message}) {
      // Called when there's incoming data on the websocket for this channel
      console.log("data coming in!");
      console.log(message);
      const node = document.createElement("p"); 

      const textnode = document.createTextNode(message.content); 
      node.id = message.id;
      node.appendChild(textnode); 

      document.getElementById("chat").appendChild(node);
    }
  });
})