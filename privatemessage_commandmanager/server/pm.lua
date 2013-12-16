class("PrivateMessage")

function PrivateMessage:__init()
	Events:Register("PlayerCommand")
	Events:Subscribe("PlayerCommand", self, self.Message)
end

function PrivateMessage:Message(cmd)
	if cmd.name == "w" then
		if not cmd.args[1] then
			return
			SendChatMessage(cmd.player, "Format: /w name message")
		end
		local results = Player.Match(cmd.args[1])
		table.remove(cmd.args, 1)
		local joint_msg = table.concat(cmd.args, " ")
		local sendee = results[1]
		if not results[1] then
			return
			SendChatMessage(cmd.player, "Please specify a valid player name!")
		elseif results[1] == cmd.player then
			return
			SendChatMessage(cmd.player, "You cannot send a message to yourself!")
		else
			SendChatMessage(cmd.player, "Message sent to "..sendee:GetName())
		end
		SendChatMessage(results[1], "Message from "..cmd.player:GetName()..": "..joint_msg)
	end
end

function SendChatMessage(player, message)
	player:SendChatMessage(message, Color(198, 9, 154))
end

privatemessage = PrivateMessage()