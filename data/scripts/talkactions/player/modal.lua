local talk = TalkAction("!modal")

function talk.onSay(player, words, param)
    local imageUrl = "https://img.freepik.com/premium-vector/qr-code-vector-icon_389832-989.jpg?w=360"
    local imageHtml = "<img src='" .. imageUrl .. "' width='210' height='210'>"
    local message = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500.<br><br>" .. imageHtml .. "<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>"

    local menu = ModalWindow{
        title = "Lorem Ipsum",
        message = message
    }

    menu:addButton("Close")
    menu:sendToPlayer(player)
    return false
end

talk:separator(" ")
talk:groupType("normal")
talk:register()