<div class="hitokoto">
  <div class="hitokoto-title">
    <i class="fa fa-paragraph"></i>
    <b>一言</b>
  </div>
  <div id="hitokoto-content">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;树梢间泻下的秋日阳光，在她肩部一闪一闪地跳跃着。</div>
  <div id="hitokoto-from"><i>——挪威的森林&nbsp;</i></div>
</div>
<div class="bing-image">
  <div class="bing-image-title">
    <i class="fa fa-image"></i>
    <b>今日背景</b>
  </div>
  <div id="bing-image-copyright">无</div>
  <div id="bing-image-button">
    <a class="btn" href="#">了解更多</a>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script>
  $.ajax({
    url: 'https://v1.hitokoto.cn?c=d&c=h&c=i&c=k',
    type: 'GET',
    dataType: 'json',
    success: function (data) {
      $('#hitokoto-content').innerText = '\xa0\xa0\xa0\xa0\xa0\xa0\xa0\xa0' + data.hitokoto
      $('#hitokoto-from>i').innerText = '——' + data.from + '\xa0'
    },
    error: function (err) {
      console.error(err)
    }
  })
  $.ajax({
    url: 'https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=zh-CN',
    type: 'GET',
    dataType: 'json',
    success: function (data) {
      $('#bing-image-copyright').innerText = data.images[0].copyright
      $('#bing-image-button>a').attr('href', data.images[0].copyrightLink)
    },
    error: function (err) {
      console.error(err)
    }
  })
</script>
