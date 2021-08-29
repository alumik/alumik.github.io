<!-- hitokoto -->

<div class="hitokoto">
  <div class="hitokoto-title">
    <i class="fa fa-paragraph"></i>
    <b>一言</b>
  </div>
  <div id="hitokoto-content">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;树梢间泻下的秋日阳光，在她肩部一闪一闪地跳跃着。</div>
  <i id="hitokoto-from">——挪威的森林&nbsp;</i>
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
