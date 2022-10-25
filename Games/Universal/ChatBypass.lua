local bypassedWords = {
   ["gay"]       = "g_ay",
   ["ass"]       = "a_ss",
   ["fag"]       = "f_ag",
   ["tit"]       = "ti_t",
   ["cum"]       = "c_um",
   ["sex"]       = "se_x",
   ["kys"]       = "ky_s",
   ["kill"]      = "ki_ll",
   ["porn"]      = "po_rn",
   ["fuck"]      = "fu_ck",
   ["shit"]      = "sh_it",
   ["tits"]      = "ti_ts",
   ["cock"]      = "c_ock",
   ["cunt"]      = "c_unt",
   ["cuck"]      = "c_uck",
   ["dick"]      = "d_ick",
   ["slut"]      = "slu_t",
   ["bitch"]     = "bi_tch",
   ["boobs"]     = "boo_bs",
   ["retard"]    = "ret_ard",
   ["retards"]   = "ret_ards",
   ["discord"]   = "disco_rd",
   ["pornhub"]   = "po_rnhub",
   ["testicles"] = "tes_ticles",
}


--// dont edit this if u dk what ur doing
local bypassStr = "%s{{aieixzvzx:%s}}" -- aieixzvzx is just a random keyboard slam

function bypassMessage(message)
   local bypassedMessage = {}

   for index, word in ipairs( message:split(" ") ) do
       local wordFormat = bypassedWords[word]
       if (not wordFormat) then
           bypassedMessage[index] = word
           continue
       end
       
       wordFormat = wordFormat:split("_")
       word = bypassStr:format(wordFormat[1], wordFormat[2]) 
       bypassedMessage[index] = word
       
       if index == #message:split(" ") then
           bypassedMessage[index] = word .. " //fn\\💀"
       end
   end
   bypassedMessage = table.concat(bypassedMessage, " ")
   
   return bypassedMessage 
end

local replicatedStorage = game:GetService("ReplicatedStorage")
local sayMessageReq     = replicatedStorage:FindFirstChild("SayMessageRequest", true)

local old__nameCall;
old__nameCall = hookmetamethod(game, "__namecall", function(self, ...)
   local method = getnamecallmethod()
   
   if (self == sayMessageReq) and (method == "FireServer") then
       local args = {...}
       local message = args[1]
       
       message = bypassMessage( message )
       
       args[1] = message
       
       return self.FireServer(self, unpack( args ) )    
   end
   
   return old__nameCall(self, ...)
end)
