return function(_)
  local c = require("vitesse.colorbuddy-like")
  local colors = c.colors
  local link = require("vitesse.utils").highlight_link

  c:group("IlluminatedWord", colors.none, colors.ignored)
  link("IlluminatedCurWord", "IlluminatedWord")
  link("IlluminatedWordText", "IlluminatedWord")
  link("IlluminatedWordRead", "IlluminatedWord")
  link("IlluminatedWordWrite", "IlluminatedWord")
end
