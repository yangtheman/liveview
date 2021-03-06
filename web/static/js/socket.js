// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "web/static/js/app.js".

// To use Phoenix channels, the first step is to import Socket
// and connect at the socket path in "lib/my_app/endpoint.ex":
import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

// When you connect, you'll often need to authenticate the client.
// For example, imagine you have an authentication plug, `MyAuth`,
// which authenticates the session and assigns a `:current_user`.
// If the current user exists you can assign the user's token in
// the connection for use in the layout.
//
// In your "web/router.ex":
//
//     pipeline :browser do
//       ...
//       plug MyAuth
//       plug :put_user_token
//     end
//
//     defp put_user_token(conn, _) do
//       if current_user = conn.assigns[:current_user] do
//         token = Phoenix.Token.sign(conn, "user socket", current_user.id)
//         assign(conn, :user_token, token)
//       else
//         conn
//       end
//     end
//
// Now you need to pass this token to JavaScript. You can do so
// inside a script tag in "web/templates/layout/app.html.eex":
//
//     <script>window.userToken = "<%= assigns[:user_token] %>";</script>
//
// You will need to verify the user token in the "connect/2" function
// in "web/channels/user_socket.ex":
//
//     def connect(%{"token" => token}, socket) do
//       # max_age: 1209600 is equivalent to two weeks in seconds
//       case Phoenix.Token.verify(socket, "user socket", token, max_age: 1209600) do
//         {:ok, user_id} ->
//           {:ok, assign(socket, :user, user_id)}
//         {:error, reason} ->
//           :error
//       end
//     end
//
// Finally, pass the token on connect as below. Or remove it
// from connect if you don't care about authentication.

socket.connect()

// Now that you are connected, you can join channels with a topic:
let gonAssets = window.Gon.assets();
let channel = socket.channel(`location:${gonAssets.channel_name}`, {})
let message = $('#message-input')
let nickname = gonAssets.username;
let chatMessages = document.getElementById("chat-messages")
let lastUpdatedAt = document.getElementById("last-updated-at")
let map = new google.maps.Map(document.getElementById('map'), {
  zoom: 10,
  center: {lat: gonAssets.market_lat, lng: gonAssets.market_lng}
});
let markers = {};

message.focus();
message.on('keypress', event => {
  if(event.keyCode == 13) {
    channel.push('message:new', {message: message.val(), user: nickname});
    message.val("");
  }
});

channel.on('message:new', payload => {
  let template = document.createElement("div");
  template.innerHTML = `<b>${payload.user}</b>: ${payload.message}<br>`;
  chatMessages.appendChild(template);
  chatMessages.scrollTop = chatMessages.scrollHeight;
})

channel.on('location:updated', location => {
  console.log(location);

  var marker = new MarkerWithLabel({
    map: map,
    position: { lat: location.lat, lng: location.lng },
    labelContent: location.expert_name,
    labelAnchor: new google.maps.Point(50, 60),
    labelClass: "gmap-label",
    labelInBackground: true
  });

  if (markers[location.expert_id]) {
    markers[location.expert_id].setMap(null);
  }

  markers[location.expert_id] = marker

  lastUpdatedAt.innerHTML = `<i>${location.timestamp}</i>`
  marker.setMap(map);
})


channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

export default socket
