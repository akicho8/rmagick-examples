require "./setup"
canvas = Image.read("logo:").first
d canvas.fx("#0F0", AllChannels) # DefaultChannels と同じ。fill するのではなくパレットの方を変更する(のか？)
