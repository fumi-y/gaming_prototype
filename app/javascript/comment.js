function comment (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    console.log("イベント発火");
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    const posts = document.getElementById("post");
    const protoId = posts.getAttribute("data-id");
    XHR.open("POST", `/prototypes/${protoId}/comments`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const list = document.getElementById("list");
      const formText = document.getElementById("comment_text");
      const i = XHR.response.post;
      const User = document.getElementById("user");
      const USER = User.getAttribute("data-hoge-id");
      const html = `
        <li class="comments_list">
          ${i.comment}
          <a class="comment_user" href="/">${USER}</a>
        </li>`;
      list.insertAdjacentHTML("afterend", html);
      formText.value = "";
    };
  });
 }
 
 window.addEventListener('load', comment);