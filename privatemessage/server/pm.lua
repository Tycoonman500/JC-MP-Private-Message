function PrivateMessage(args)
	local msg = args.text
	local split_msg = msg:split(" ")

	if split_msg[1] == "/w" then
		if not split_msg[2] then
			return
			SendChatMessage(args.player, "Format: /w name message")
		end
		local results = Player.Match(split_msg[2])
		table.remove(split_msg, 1)
		table.remove(split_msg, 1)
		local joint_msg = table.concat(split_msg, " ")
		local sendee = results[1]
		if not results[1] then
			return
			SendChatMessage(args.player, "Please specify a valid player name!")
		elseif results[1] == args.player then
			return
			SendChatMessage(args.player, "You cannot send a message to yourself!")
		else
			SendChatMessage(args.player, "Message sent to "..sendee:GetName())
		end
		SendChatMessage(results[1], "Message from "..args.player:GetName()..": "..joint_msg)
	end
end

function SendChatMessage(player, message)
	player:SendChatMessage(message, Color(198, 9, 154))
end

Events:Subscribe("PlayerChat", PrivateMessage)