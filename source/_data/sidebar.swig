<!-- hitokoto -->

<div class="hitokoto">
  <div class="hitokoto-title">
    <i class="fa fa-paragraph"></i>
    <b>一言</b>
  </div>
  <div id="hitokoto-content">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;多少事，从来急，天地转，光阴迫，一万年太久，只争朝夕。</div>
  <i id="hitokoto-from">——毛泽东语录&nbsp;</i>
</div>

<script src="https://cdn.jsdelivr.net/npm/bluebird@latest/js/browser/bluebird.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/whatwg-fetch@latest/dist/fetch.umd.min.js"></script>
<script>
  fetch('https://v1.hitokoto.cn')
    .then(res => res.json())
    .then(data => {
      let hitokoto_content = document.getElementById('hitokoto-content')
      hitokoto_content.innerText = '\xa0\xa0\xa0\xa0\xa0\xa0\xa0\xa0' + data.hitokoto
      let hitokoto_from = document.getElementById('hitokoto-from')
      hitokoto_from.innerText = '——' + data.from + '\xa0'
    })
    .catch(err => console.error(err))
</script>
