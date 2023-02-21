require 'pry-byebug'
require 'httparty'

objeto = { goleiros: ["Jesher", "Paulao"],
           linha: ["Marcao", "Mateus", "Eduardo Pê", "Lucas", "Paulinho", "Ana", "Deva", "Gordão", "Daniel", "Fernando"]}

def sortear(objeto)
  goleiros = objeto[:goleiros]
  jogadores_linha = objeto[:linha]

  @time_azul = (goleiros.sample(goleiros.length - 1) + jogadores_linha.sample(jogadores_linha.length - 5))
  @time_preto = []

  goleiros.each do |nome|
    @time_preto << nome if !@time_azul.include?(nome)
  end

  jogadores_linha.each do |nome|
    next if @time_preto.length == 6
    @time_preto << nome if !@time_azul.include?(nome)
  end
  times = "Time Preto: #{@time_preto.join(', ')}
  Time Azul: #{@time_azul.join(', ')}"
  send_message(times)
end

def send_message(times)
  api_key="API TOKEN TELEGRAM"
  chat_id="CHAT ID GRUPO TELEGRAM"
  HTTParty.post("https://api.telegram.org/bot#{api_key}/sendMessage",
    headers: {
      'Content-Type' => 'application/json'
    },
    body: {
      chat_id: chat_id,
      text: times
    }.to_json
  )  
end

sortear(objeto)