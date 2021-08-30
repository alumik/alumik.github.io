<hr style="margin-top: 40px"/>
<h2>参考链接</h2>

{%- if post.references and post.references.length %}
  <ul>
  {%- for ref in post.references %}
    {%- if ref.name %}
      <li>{{ref.name}}: <a href="{{ref.url}}">{{ref.url}}</a></li>
    {% else %}
      <li><a href="{{ref}}">{{ref}}</a></li>
    {%- endif %}
  {%- endfor %}
  </ul>
{%- endif %}
