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

    received({message,image, sender_image}) {
      // Called when there's incoming data on the websocket for this channel
      console.log("data coming in!");
      console.log(message);
      console.log(image);
      console.log(sender_image);

      const p = document.createElement('p')
      p.innerText = message.content;

      const picture = document.createElement('img')
      picture.classList.add('img-fit')
      picture.setAttribute("src", image)

      let avatar = document.createElement('div')
      avatar.classList.add('chat-pic')

      const leftMessage = document.createElement('div')
      leftMessage.classList.add('left-message');
      console.log(leftMessage)

      const item = document.createElement('div');
      item.classList.add('says');
      console.log(item)

      const leftBox = document.createElement('div');
      leftBox.classList.add('left-box');
      leftBox.appendChild(item)
      console.log(leftBox)

      const mycomment = document.createElement('div')
      mycomment.classList.add('mycomment')
      console.log(mycomment)

      

      // if(CURRENT_USER_ID == message.sender_id){
          leftMessage.appendChild(avatar)
          leftMessage.appendChild(leftBox)
          if(message){

            item.appendChild(p)
            
          }
          if(image){
            item.appendChild(picture)

          }
          // leftMessage.appendChild(p)
          console.log(p)
        console.log(leftMessage)
       
      // }



  
      document.getElementById("chat").appendChild(leftMessage);



    }
  });
})