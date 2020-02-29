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

    received({message, image, sender_image,time_ago}) {
      // Called when there's incoming data on the websocket for this channel
      console.log("data coming in!");
      console.log(message);
      console.log(image);
      console.log(sender_image);
      console.log(time_ago);

      document.querySelector('#chat').classList.add("conversation-box")

      if (image) {
        const picture = document.createElement('img')
        picture.classList.add('img-fit')
        picture.setAttribute("src", image)
      }

      let avatar = document.createElement('div')
      avatar.classList.add('chat-pic')

      const senderImage = document.createElement('img')
      senderImage.classList.add('pic')
      senderImage.setAttribute("src", sender_image)


      const leftMessage = document.createElement('div')
      leftMessage.classList.add('left-message');
      // console.log(leftMessage)

      const item = document.createElement('div');
      item.classList.add('says');
      // console.log(item)

      const s = document.createElement('span')
      s.innerText = message.content;

      const p = document.createElement('p')

      const leftBox = document.createElement('div');
      leftBox.classList.add('left-box');
      // console.log(leftBox)

      const mycomment = document.createElement('div')
      mycomment.classList.add('mycomment')
      // console.log(mycomment)

      const time1 = document.createElement('p')
      time1.classList.add('time1')
      time1.innerText = `${time_ago} ago`

      const time2 = document.createElement('p')
      time2.classList.add('time2')
      time2.innerText = `${time_ago} ago`


      if(CURRENT_USER_ID !== message.sender_id){
        if(message){
          p.appendChild(s)
        }
        if(image){
          p.appendChild(picture)
        }
        avatar.appendChild(senderImage)
        console.log(avatar)
        leftMessage.appendChild(avatar)
        item.appendChild(p)
        leftBox.appendChild(item)
        leftMessage.appendChild(leftBox)
        leftMessage.appendChild(time1)

        // console.log(p)
        console.log(leftMessage)
        document.getElementById("chat").appendChild(leftMessage);
        document.getElementById("chat").appendChild(time1);

        }else{
        mycomment.appendChild(p)
        if(message){
          p.appendChild(s)
          mycomment.appendChild(p)
        }
        if(image){
          p.appendChild(picture)
          mycomment.appendChild(p)
        }
        console.log(mycomment)
        $(document).find("send-form").prepend('<%= escape_javascript(render("shared/error_messages", :formats => [:html])) %>');

        document.getElementById("chat").appendChild(mycomment);
        document.getElementById("chat").appendChild(time2);
      }
    }
  });
})