import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the comment!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    let comment = data.comment;
    if(comment.parent_id){
      $(`#replies_${comment.parent_id}`).append(`<div class="reply ml-5 mb-5"> <p class="pt-1 pb-0"><span>${comment.body}</span></p> <em class="pt-1 pb-0">${comment.email} - ${comment.time} (GMT)</em> </div><hr>`);
      document.getElementById(`comment_reply_form_${comment.post_id}`).reset()
      console.log(document.getElementById(`rpbtn_${comment.parent_id}`))
      document.getElementById(`rpbtn_${comment.parent_id}`).removeAttribute("disabled")
    }
    else{
      $(`.post_${comment.post_id}`).append(`<div id="comment_${comment.id}"> <p class="m-0"><span>${comment.body} <a data-remote="true" href="/posts/${comment.post_id}/comments/new?parent_id=${comment.id}" class="float-right">Reply</a></span></p> <em>${comment.email} - ${comment.time} (GMT)</em><div id="replies_${comment.id}"></div><hr> </div>`);
      $(`#comment_${comment.id}`).after(`<div id="reply-form-${comment.id}"></div>`)
      document.getElementById(`comment_form_${comment.post_id}`).reset();
      document.getElementById(`sbmt_${comment.post_id}`).removeAttribute("disabled")
    }
    // Called when there's incoming data on the websocket for this channel
  }
});